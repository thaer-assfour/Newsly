import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsly/classes/article.dart';
import 'package:newsly/screens/NewsDetails.dart';

import '../var.dart';

Widget newsCard(Article article, context) {


  return InkWell(
    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context){return NewsDetails(article: article,);}));},
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(16), bottomLeft: Radius.circular(16)),
      ),
      shadowColor: themeColor[2],
      margin: EdgeInsets.only(top: 16, bottom: 8, right: 16, left: 16),
      elevation: 8,
      child: Container(
        color: themeColor[1].withOpacity(0.2),
        child: Column(
          children: [
            Container(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                child: Text(
                  article.title,maxLines: 3,
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
              height: MediaQuery.of(context).orientation == Orientation.landscape
                  ? MediaQuery.of(context).size.height / 3
                  : MediaQuery.of(context).size.height / 4,
              child: article.urlToImage != null
                  ? CachedNetworkImage(
                      imageUrl: article.urlToImage,
                      fadeInDuration: Duration(seconds: 1),
                      fadeInCurve: Curves.easeInCirc,
                      fit: BoxFit.cover,
                    )
                  : CachedNetworkImage(
                      imageUrl:
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/archive/a/ac/20121003093557%21No_image_available.svg/120px-No_image_available.svg.png",
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedContainer(
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
                alignment: Alignment.bottomCenter, duration: Duration(seconds: 1),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
