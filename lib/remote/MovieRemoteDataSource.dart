
import 'dart:convert';

import 'package:chwitter/model/Movie.dart';
import 'package:chwitter/model/MovieListModel.dart';
import 'package:chwitter/remote/AbstractRemoteDataSource.dart';
import 'package:http/http.dart' as http;

class MovieRemoteDataSource extends RemoteDataSource<Movie>{

  static const POPULAR_MOVIES_QUERY = 'https://api.themoviedb.org/3/movie/popular?api_key=bf0af36b6b0149089510541e46af70f9';

  @override
  Future<List<Movie>> getItems() async {
    var response = await http.get(POPULAR_MOVIES_QUERY);
    if (response.statusCode == 200) {
      return MovieListModel.fromJson(json.decode(response.body)).items;
    }
    else {
      throw Exception('Failed to load movies');
    }
  }
}