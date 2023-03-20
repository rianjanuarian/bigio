// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:starwars/model/services.dart';
import 'package:starwars/ui/filmspage.dart';
import 'package:starwars/ui/homeworld.dart';

class DetailPage extends StatelessWidget {
  String nama;
  String height;
  String mass;
  String hairColor;
  String eyeColor;
  String birthYear;
  String gender;
  String homeworld;
  List<dynamic> films;
  DetailPage(
      {super.key,
      required this.nama,
      required this.birthYear,
      required this.eyeColor,
      required this.gender,
      required this.hairColor,
      required this.height,
      required this.mass,
      required this.films,
      required this.homeworld});

  @override
  Widget build(BuildContext context) {
    final mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(nama),
      // ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Positioned(
              left: mWidth * 0.02,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(5)),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 15,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                nama,
                style: const TextStyle(fontSize: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name : $nama"),
                  Text("Birth Year: $birthYear"),
                  Text("Gender : $gender"),
                  Text("Hair Color : $hairColor"),
                  Text("Height : $height Cm"),
                  Text("Weight : $mass Kg"),
                  Text("Eye Color: $eyeColor"),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Homeworld : "),
                      FutureBuilder(
                          future: Services.getHomeworld(homeworld),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return InkWell(
                                  onTap: () {
                                    var val = snapshot.data;
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeWorld(
                                              name: val?.name,
                                              rotationPeriod:
                                                  val?.rotationPeriod,
                                              orbitalPeriod: val?.orbitalPeriod,
                                              diameter: val?.diameter,
                                              climate: val?.climate,
                                              gravity: val?.gravity,
                                              terrain: val?.terrain,
                                              surfaceWater: val?.surfaceWater,
                                              population: val?.population,
                                              created: val?.created,
                                              edited: val?.edited,
                                              url: val?.url)),
                                    );
                                  },
                                  child: Text(
                                    snapshot.data?.name ?? '',
                                    style: const TextStyle(
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline),
                                  ));
                            } else {
                              return const Text("loading...");
                            }
                          })
                    ],
                  ),
                  const Text("Film List :"),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: films.length,
                      itemBuilder: (context, index) {
                        return FutureBuilder(
                            future:
                                Services.getFilmsList(films[index].toString()),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return InkWell(
                                    onTap: () {
                                      final film = snapshot.data;
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => FilmsPage(
                                                openingCrawl:
                                                    film!.openingCrawl,
                                                edited: film.edited,
                                                name: film.name,
                                                episodeId: film.episodeId,
                                                diretor: film.diretor,
                                                releaseDate: film.releaseDate,
                                                producer: film.producer)),
                                      );
                                    },
                                    child: card(
                                        context, snapshot.data?.name ?? ''));
                              } else {
                                return card(context, 'Loading...');
                              }
                            });
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget card(
  BuildContext context,
  String name,
) {
  final mHeight = MediaQuery.of(context).size.height;
  final mWidth = MediaQuery.of(context).size.width;
  return SizedBox(
    width: mWidth * 0.3,
    height: mHeight * 0.1,
    child: Card(
      child: Center(
        child: Text(name),
      ),
    ),
  );
}
