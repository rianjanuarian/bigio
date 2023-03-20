import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class HomeWorld extends StatelessWidget {
  String? name;
  String? rotationPeriod;
  String? orbitalPeriod;
  String? diameter;
  String? climate;
  String? gravity;
  String? terrain;
  String? surfaceWater;
  String? population;

  String? created;
  String? edited;
  String? url;
  HomeWorld(
      {super.key,
      this.name,
      this.rotationPeriod,
      this.orbitalPeriod,
      this.diameter,
      this.climate,
      this.gravity,
      this.terrain,
      this.surfaceWater,
      this.population,
      this.created,
      this.edited,
      this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Planet ${name ?? ''}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Planet Name : ${name ?? ''}"),
            Text("Rotation Period : ${rotationPeriod ?? ''}"),
            Text("Orbital Period : ${orbitalPeriod ?? ''}"),
            Text(
                "Diameter :  ${NumberFormat.currency(symbol: '', locale: 'id', decimalDigits: 0).format(int.parse(diameter!))}"),
            Text("Climate : ${climate ?? ''}"),
            Text("Gravity : ${gravity ?? ''}"),
            Text("Terrain : ${terrain ?? ''}"),
            Text("Surface Water : ${surfaceWater ?? ''}"),
            Text(
                "Population :  ${NumberFormat.currency(symbol: '', locale: 'id', decimalDigits: 0).format(int.parse(population!))}"),
            Text("Created : ${created ?? ''}"),
            Text("Edited : ${edited ?? ''}"),
          ],
        ),
      ),
    );
  }
}
