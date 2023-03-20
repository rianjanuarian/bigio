import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars/bloc/fetch_bloc.dart';
import 'package:starwars/model/repository.dart';
import 'package:starwars/ui/detailpage.dart';

// ignore: must_be_immutable
class MainPage extends StatefulWidget {
  int? number;
  MainPage({super.key, this.number});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController controller = TextEditingController();
  int? a;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchBloc(
            RepositoryProvider.of<PersonRepo>(context),
            widget.number ?? 1,
          )..add(LoadPerson()),
        ),
      ],
      child: Scaffold(
          appBar: AppBar(
            title: Text("Page ${widget.number}"),
          ),
          body: BlocBuilder<FetchBloc, FetchState>(
            builder: (context, state) {
              if (state is FetchInitial) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is PersonLoaded) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: state.person!.length,
                          itemBuilder: (context, index) {
                            final val = state.person![index];
                            return Column(
                              children: [
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DetailPage(
                                                nama: val.name,
                                                homeworld: val.homeworld,
                                                birthYear: val.birthYear,
                                                eyeColor: val.eyeColor,
                                                gender: val.gender,
                                                hairColor: val.hairColor,
                                                height: val.height,
                                                films: val.films,
                                                mass: val.mass)),
                                      );
                                    },
                                    child: display(context, val!.name))
                              ],
                            );
                          }),
                    ),
                  ],
                );
              } else {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("harap masukkan nomer 1 - 9 "),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Kembali"))
                    ],
                  ),
                );
              }
            },
          )),
    );
  }
}

Widget display(
  BuildContext context,
  String name,
) {
  final mHeight = MediaQuery.of(context).size.height;
  final mWidth = MediaQuery.of(context).size.width;
  return SizedBox(
    width: mWidth * 0.8,
    height: mHeight * 0.2,
    child: Card(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/troops.jpg',
            fit: BoxFit.fill,
          ),
          ClipRRect(
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Center(
                      child: Text(
                    name.toUpperCase(),
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )))),
        ],
      ),
    ),
  );
}
