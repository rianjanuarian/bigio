// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class FilmsPage extends StatelessWidget {
  String name;
  int episodeId;
  String diretor;
  String releaseDate;
  String producer;
  String openingCrawl;
  String edited;
  FilmsPage(
      {super.key,
      required this.edited,
      required this.openingCrawl,
      required this.name,
      required this.episodeId,
      required this.diretor,
      required this.releaseDate,
      required this.producer});

  @override
  Widget build(BuildContext context) {
    final mWidth = MediaQuery.of(context).size.width;
    final mHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                    width: mWidth,
                    height: mHeight * 0.4,
                    child: Image.asset(
                      'assets/images/starwars.jpg',
                      fit: BoxFit.fill,
                    )),
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
                Positioned(
                    top: mHeight * 0.26,
                    left: mWidth * 0.03,
                    child: Container(
                      height: mHeight * 0.04,
                      width: mWidth * 0.2,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.blue),
                      child: Text(
                        "Episodes : ${episodeId.toString()}",
                        textAlign: TextAlign.center,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    )),
                Positioned(
                    top: mHeight * 0.32,
                    left: mWidth * 0.03,
                    child: Text(
                      name,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    )),
                Positioned(
                    top: mHeight * 0.36,
                    left: mWidth * 0.5,
                    child: Text(
                      edited,
                      style: const TextStyle(color: Colors.white),
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Title : $name"),
                  Text("Episodes : ${episodeId.toString()}"),
                  Text("Director : $diretor"),
                  Text("Release Date : $producer"),
                  Text("Producer : $releaseDate"),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text("Opening : "),
                  ),
                  Text(openingCrawl)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
