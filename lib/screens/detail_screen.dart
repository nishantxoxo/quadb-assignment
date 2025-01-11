import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quadb_assignment/models/movieModel.dart' as mov;

class DetailScreen extends StatelessWidget {
  final mov.moviesModel movie;
  DetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(movie.show!.name!),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 350,
                  width: double.maxFinite,
                  child: Image.network(movie.show!.image!.original!),
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.star,
                    size: 100,
                    color: Colors.yellow,
                  ),
                  Text(movie.show!.rating!.average.toString(), style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),)
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(movie.show!.summary!.toString()),
              )
            ],
          ),
        ));
  }
}
