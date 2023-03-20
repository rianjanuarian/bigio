import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars/model/repository.dart';
import 'package:starwars/ui/mainpage.dart';

class Selection extends StatefulWidget {
  const Selection({super.key});

  @override
  State<Selection> createState() => _SelectionState();
}

int a = 0;

class _SelectionState extends State<Selection> {
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Starwars"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Masukkan halaman 1 - 9"),
          TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: 'Masukkan Nomor'),
          ),
          ElevatedButton(
              onPressed: () {
                while (true) {
                  if (controller.text.isEmpty) {
                    _dialogBuilder(context);
                    break;
                  } else {
                    setState(() {
                      a = int.parse(controller.text);
                    });
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RepositoryProvider(
                              create: (context) => PersonRepo(),
                              child: MainPage(
                                number: a,
                              ),
                            )),
                  );
                  break;
                }
              },
              child: const Text("Go"))
        ],
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Harap isi halaman'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Kembali'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
