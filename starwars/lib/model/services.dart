import 'package:dio/dio.dart';
import 'package:starwars/model/model.dart';

abstract class Services {
  static Future<Homeworld?> getHomeworld(String page) async {
    try {
      var response = await Dio().get(page);
      final data = response.data;

      if (response.statusCode == 200) {
        return Homeworld(
          name: data['name'],
          rotationPeriod: data['rotation_period'],
          orbitalPeriod: data['orbital_period'],
          diameter: data['diameter'],
          climate: data['climate'],
          gravity: data['gravity'],
          terrain: data['terrain'],
          surfaceWater: data['surface_water'],
          population: data['population'],
          created: data['created'],
          edited: data['edited'],
          url: data['url'],
        );
      }
      throw Exception('connection failed');
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<Films?> getFilmsList(String page) async {
    try {
      var response = await Dio().get(page);
      final data = response.data;

      if (response.statusCode == 200) {
        return Films(
            edited: data['edited'],
            openingCrawl: data['opening_crawl'],
            name: data['title'],
            episodeId: data['episode_id'],
            diretor: data['director'],
            releaseDate: data['producer'],
            producer: data['release_date']);
      }
      throw Exception('connection failed');
    } catch (e) {
      throw Exception(e);
    }
  }
}
