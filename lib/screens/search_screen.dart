import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quadb_assignment/models/movieModel.dart';
import 'package:quadb_assignment/providers/movieProvider.dart';
import 'package:quadb_assignment/widgets/movies_grid.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  FocusNode searchFocusNode = FocusNode();
  String searched = "";


  void seachmovies() async{
    await Provider.of<Movieprovider>(context, listen: false).searchMovie(searched);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            focusNode: searchFocusNode,
            decoration: const InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              labelText: 'Search by name',
              border: OutlineInputBorder(),
            ),
            onSubmitted: (value)  {
              setState(() {
                searched = value;
              });
        
              seachmovies();
              setState(() {
                
              });
            },
          ),
        ),
      ),
      body: searched.isEmpty? Center(child: Text("search movies"),) : MoviesGrid(true, searched) 
    );
  }
}
