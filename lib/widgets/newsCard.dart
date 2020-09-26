import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsly/classes/article.dart';

import '../var.dart';

Widget newsCard(Article article) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(16), bottomLeft: Radius.circular(16)),
    ),
    shadowColor: themeColor[2],
    margin: EdgeInsets.only(top: 16, bottom: 8, right: 16, left: 16),
    elevation: 8,
    color: Colors.white,
    child: Column(
      children: [
        Container(

          color: themeColor[1].withOpacity(0.3),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
            child: Text(
              article.title,
              style: GoogleFonts.lato(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  decoration: TextDecoration.none,
                  color: themeColor[3]),
            ),
          ),
        ),
        Container(
          child: article.urlToImage != null
              ? CachedNetworkImage(
                  imageUrl: article.urlToImage,
                )
              : CachedNetworkImage(
                  imageUrl:
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/480px-No_image_available.svg.png",
                ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Text(
              "Published time : " +
                  "${article.publishedAt.substring(0, 10)}" +
                  "  " +
                  "${article.publishedAt.substring(11, 16)}",
              style: GoogleFonts.lato(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  decoration: TextDecoration.none,
                  color: themeColor[3]),
            ),
            alignment: Alignment.bottomLeft,
          ),
        )
      ],
    ),
  );
}
