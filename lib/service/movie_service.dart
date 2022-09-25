import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_flutter/model/movie_model.dart';
import 'package:movie_flutter/model/moviedetail_model.dart';
import 'package:movie_flutter/utils/contants.dart';

class MovieService {
  static var client = http.Client();

  Future<Movie?> getNowPlaying() async {
    var response = await client
        .get(Uri.parse(BASE_URL + URL_NOWPLAYING_MOVIE + "?api_key=$API_KEY"));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      print(jsonString);
      return Movie.fromJson(json.decode(response.body));
    } else {
      print("Error");
    }
    return null;
  }

  Future<Movie?> getTopRated() async {
    var response = await client
        .get(Uri.parse(BASE_URL + URL_TOPRATED_MOVIE + "?api_key=$API_KEY"));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return Movie.fromJson(jsonDecode(response.body));
    } else {
      print("Error");
    }
    return null;
  }

  Future<Movie?> getPopular() async {
    var response = await client
        .get(Uri.parse(BASE_URL + URL_POPULAR_MOVIE + "?api_key=$API_KEY"));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      // return Movie.fromJson(jsonDecode(response.body));
      return movieFromJson(response.body);
    } else {
      print("Error");
    }
    return null;
  }

  Future<DetailMovie?> getDetailMovie({required String id}) async {
    var response = await client
        .get(Uri.parse(BASE_URL + URL_DETAIL_MOVIE + id + "?api_key=$API_KEY"));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return detailMovieFromJson(response.body);
      // return DetailMovie.fromJson(jsonDecode(response.body));
    } else {
      print("ERROR");
    }
    return null;
  }
}
