import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quadb_assignment/providers/movieProvider.dart';
import 'package:quadb_assignment/widgets/movies_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
bool isloading = false;
class _HomeScreenState extends State<HomeScreen> {

  
  @override
  void initState() {
    Future.delayed(Duration.zero).then(
      (_) async {
        setState(
          () {
            isloading = true;
          },
        );
        await Provider.of<Movieprovider>(context, listen: false)
            .fetchAndSet(); 
        setState(
          () {
            isloading = false;
          },
        );
      },
    );

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Movies"),), body: MoviesGrid(false, ""),);
  }
}