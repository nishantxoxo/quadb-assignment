import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quadb_assignment/providers/movieProvider.dart';
import 'package:quadb_assignment/widgets/movie_item.dart';

class MoviesGrid extends StatelessWidget {
  bool isSearchScreen;
  String searched;

  MoviesGrid(this.isSearchScreen, this.searched);

  @override
  Widget build(BuildContext context) {
    final movies = isSearchScreen
        ? Provider.of<Movieprovider>(context).searchedmovies
        : Provider.of<Movieprovider>(context).movies;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Number of items per row
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 2 / 3, // Adjust this for item aspect ratio
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
          value: movies[index],
          child: MovieItem(),
        ),
      ),
    );
  }
}
