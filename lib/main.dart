import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quadb_assignment/providers/movieProvider.dart';
import 'package:quadb_assignment/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Movieprovider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'quadb assignment',
        theme: ThemeData.dark(
         
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Splashscreen(),
      ),
    );
  }
}
