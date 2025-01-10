import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quadb_assignment/screens/bottomNavbar.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Bottomnavbar(),));
    },);
  }


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/splash_pic.jpg",
              fit: BoxFit.cover,
              width: width * 0.9,
              height: height * 0.5,
            ),
            SizedBox(height: height * 0.04,),
            Text("TOP HEADLINES", style: GoogleFonts.anton(letterSpacing: .6, color: Colors.grey),),
            SizedBox(height: height * 0.04,),
            SpinKitChasingDots(
              color: Colors.red,
              size: 40,
            )


          ],
        ),
      ),
    );
  }
}
