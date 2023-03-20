class Person {
  String name;
  String height;
  String mass;
  String hairColor;
  String skinColor;
  String eyeColor;
  String birthYear;
  String gender;
  String homeworld;
  List<dynamic> films;

  Person(
      {required this.name,
      required this.height,
      required this.mass,
      required this.gender,
      required this.birthYear,
      required this.eyeColor,
      required this.hairColor,
      required this.homeworld,
      required this.skinColor,
      required this.films});
}

class Homeworld {
  String name;
  String rotationPeriod;
  String orbitalPeriod;
  String diameter;
  String climate;
  String gravity;
  String terrain;
  String surfaceWater;
  String population;

  String created;
  String edited;
  String url;

  Homeworld(
      {required this.name,
      required this.rotationPeriod,
      required this.orbitalPeriod,
      required this.diameter,
      required this.climate,
      required this.gravity,
      required this.terrain,
      required this.surfaceWater,
      required this.population,
      required this.created,
      required this.edited,
      required this.url});
}

class Films {
  String name;
  int episodeId;
  String diretor;
  String releaseDate;
  String producer;
  String openingCrawl;
  String edited;

  Films(
      {required this.openingCrawl,
      required this.name,
      required this.episodeId,
      required this.diretor,
      required this.releaseDate,
      required this.edited,
      required this.producer});
}
