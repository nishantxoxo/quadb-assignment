import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quadb_assignment/models/movieModel.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key});

  @override
  Widget build(BuildContext context) {
    final movie = Provider.of<moviesModel>(context);
    return Card(
      elevation: 4,
      child: Column(
        children: [
          CachedNetworkImage(
            errorWidget: (context, url, error) => Icon(
              Icons.error_outline,
              color: Colors.red,
            ),
            placeholder: (context, url) => SpinKitFadingCircle(
              color: Colors.red,
              size: 50,
            ),
            fit: BoxFit.cover,
            imageUrl: movie.show!.image!.medium.toString(),
          ),
          Text(
            movie.show!.name!,
            style: GoogleFonts.poppins(
              fontSize: 13,
            ),
          )
        ],
      ),
    );
  }
}
