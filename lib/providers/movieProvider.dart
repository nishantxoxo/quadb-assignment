import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quadb_assignment/models/movieModel.dart';
import 'package:http/http.dart' as http;
class Movieprovider with ChangeNotifier {

  List<moviesModel> _movies = [];
  List<moviesModel> _searchedMovies =[];
  
   List<moviesModel> get movies {
    return [..._movies];
  }     
  
  List<moviesModel> get searchedmovies {
    return [..._movies];
  }  

  Future<void> fetchAndSet() async {                                        
    final url = 'https://api.tvmaze.com/search/shows?q=all';
    try {
      final Response = await http.get(Uri.parse(url));                       //fetch the data with a GET request
      final extracted = json.decode(Response.body) as List<dynamic>;                  
      final List<moviesModel> loadedMovies = [];                                 
      extracted.forEach(
        (element) {
          loadedMovies.add(moviesModel.fromJson(element));
        },
      );

      _movies = loadedMovies;                                          
    } catch (e) {
      throw e;
    } 
  }


  Future<void> searchMovie(String query) async {                                
    final url = 'https://api.tvmaze.com/search/shows?q=$query';
    try {
      final Response = await http.get(Uri.parse(url));                       //fetch the data with a GET request
      final extracted = json.decode(Response.body) as List<dynamic>;                  
      final List<moviesModel> loadedSearchedMovies = [];                                 
      extracted.forEach(
        (element) {
          loadedSearchedMovies.add(moviesModel.fromJson(element));
        },
      );

      _searchedMovies = loadedSearchedMovies;                                         
    } catch (e) {
      throw e;
    } 
  }










}