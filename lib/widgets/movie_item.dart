import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quadb_assignment/models/movieModel.dart';
import 'package:quadb_assignment/screens/detail_screen.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key});

  @override
  Widget build(BuildContext context) {
    final movie = Provider.of<moviesModel>(context);
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(movie: movie),)),
      child: Card(
        elevation: 4,
        child: Column(mainAxisAlignment: MainAxisAlignment.center ,
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CachedNetworkImage(
                errorWidget: (context, url, error) => Icon(
                  Icons.error_outline,
                  color: Colors.red,
                ),
                placeholder: (context, url) => SpinKitFadingCircle(
                  color: Colors.red,
                  size: 50,
                ),
                fit: BoxFit.cover,
                imageUrl: movie.show?.image?.medium?.toString() ?? "" ,
              ),
            ),
            Text( 
             movie.show!.name! ,
             overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                fontSize: 13,
                
              ),
            )
          ],
        ),
      ),
    );
  }
}
