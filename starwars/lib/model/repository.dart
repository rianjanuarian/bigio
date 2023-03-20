import 'package:dio/dio.dart';

import 'model.dart';

class PersonRepo {
  Future<List<Person?>> getPersonPage(int page) async {
    try {
      var response =
          await Dio().get('https://swapi.dev/api/people/?page=$page');
      final List data = response.data['results'];

      if (response.statusCode == 200) {
        return data
            .map(
              (e) => Person(
                  name: e['name'],
                  height: e['height'],
                  mass: e['mass'],
                  gender: e['gender'],
                  birthYear: e['birth_year'],
                  eyeColor: e['eye_color'],
                  hairColor: e['hair_color'],
                  homeworld: e['homeworld'],
                  skinColor: e['skin_color'],
                  films: e['films']),
            )
            .toList();
      }
      throw Exception('connection failed');
    } catch (e) {
      throw Exception(e);
    }
  }
}
