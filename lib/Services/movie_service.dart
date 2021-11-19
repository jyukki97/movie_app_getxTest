import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:infinite_scroll_test/Model/movie_list.dart';

class MovieService {
  static var client = http.Client();

  static Future<MovieList?> fetchMovie(int limit, int page) async {
    var response = await client.get(
        Uri.parse('https://yts.mx/api/v2/list_movies.json?limit=$limit&page=$page')
    );
    if(response.statusCode == 200) {
      var jsonString = json.decode(response.body);
      return MovieList.fromJson(jsonString);
    } else{
      return null;
    }
  }
}