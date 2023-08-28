import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/now_playing_response.dart';
import 'package:peliculas/models/popular_response.dart';

import '../models/movie.dart';

class MoviesProvider extends ChangeNotifier {
  String _baseUrl = 'api.themoviedb.org';
  String _apiKey =
      'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMDdkZjIzODQ2NDgxYWRlMGVjNDQ5NjgxMWYxMjM5NCIsInN1YiI6IjY0ZTJlMDQzY2VkZTY5MDBjN2VlZWIwNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.28lcBwDrDHO2ODBV4Qx_UIYXykeu5ccZVnhywRZNc0A';
  String _languaje = 'es-Es';
  List<Movie> onDisplayMovies = [];
  List<Movie> onPopularMovies = [];

  MoviesProvider() {
    this.getOnDisplayMovies();
    this.getPopularMovies();
  }

  Future<void> getOnDisplayMovies() async {
    final url = Uri.parse(
        'https://api.themoviedb.org/3/movie/now_playing?language=es-ES&page=1');

    final headers = {
      'accept': 'application/json',
      'Authorization': _apiKey,
    };
    final response = await http.get(url, headers: headers);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);

    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();

    // if (response.statusCode == 200) {
    //   // Procesa los datos de la respuesta aquí
    // } else {
    //   // Si la solicitud no fue exitosa, maneja el error aquí
    // }
  }

  Future<void> getPopularMovies() async {
    final url = Uri.parse(
        'https://api.themoviedb.org/3/movie/now_playing?language=es-ES&page=1');

    final headers = {
      'accept': 'application/json',
      'Authorization': _apiKey,
    };
    final response = await http.get(url, headers: headers);
    final popularResponse = PopularResponse.fromJson(response.body);
    onPopularMovies = [...onPopularMovies, ...popularResponse.results];
    // print(onPopularMovies[0]);

    if (response.statusCode == 200) {
      print('La solicitud fue exitosa');
    } else {
      print('Error 500 por favor');
    }

    notifyListeners();
  }

  // getOnDisplayMovies() async {
  //   var url = Uri.https(_baseUrl, 'movie/now_playing',
  //       {'api_key': _apiKey, 'languaje': _languaje, 'page': '1'});

  //   // Await the http get response, then decode the json-formatted response.
  //   final response = await http.get(url);

  // }
}
