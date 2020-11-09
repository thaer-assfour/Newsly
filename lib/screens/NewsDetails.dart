import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:newsly/classes/article.dart';

import '../var.dart';

class NewsDetails extends StatefulWidget {
  final Article article;

  const NewsDetails({Key key, this.article}) : super(key: key);

  @override
  _NewsDetailsState createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details",
            style: GoogleFonts.lato(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                fontSize: 24,
                letterSpacing: 2,
                decoration: TextDecoration.none,
                color: themeColor[0])),
        centerTitle: true,
        backgroundColor: themeColor[3],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: MediaQuery.of(context).orientation ==
                        Orientation.portrait
                    ? null
                    : Row(
                        // this row appeare only in landscape mode for picture and title
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: widget.article.title == null
                                ? null
                                : Text(widget.article.title,
                                    style: GoogleFonts.lato(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w800,
                                        decoration: TextDecoration.none,
                                        color: themeColor[3])),
                          ),
                          Container(
                            child: widget.article.urlToImage != null
                                ? CachedNetworkImage(
                                    imageUrl: widget.article.urlToImage,
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    fadeInDuration: Duration(seconds: 1),
                                    fadeInCurve: Curves.easeInCirc,
                                    fit: BoxFit.cover,
                                  )
                                : CachedNetworkImage(
                                    imageUrl:
                                        "https://upload.wikimedia.org/wikipedia/commons/thumb/archive/a/ac/20121003093557%21No_image_available.svg/120px-No_image_available.svg.png",
                                  ),
                          ),
                        ],
                      ),
              ),
              Container(
                child: MediaQuery.of(context).orientation ==
                        Orientation
                            .landscape // this picture hide in landscape mode because its called in row
                    ? null
                    : widget.article.urlToImage != null
                        ? CachedNetworkImage(
                            imageUrl: widget.article.urlToImage,
                            fadeInDuration: Duration(seconds: 1),
                            fadeInCurve: Curves.easeInCirc,
                            fit: BoxFit.cover,
                          )
                        : CachedNetworkImage(
                            imageUrl:
                                "https://upload.wikimedia.org/wikipedia/commons/thumb/archive/a/ac/20121003093557%21No_image_available.svg/120px-No_image_available.svg.png",
                          ),
              ),
              Container(
                color: themeColor[3].withOpacity(0.09),
                child: MediaQuery.of(context).orientation ==
                        Orientation
                            .landscape // this title hide in landscape mode because its called in row
                    ? null
                    : Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: widget.article.title == null
                            ? null
                            : Text(widget.article.title,
                                style: GoogleFonts.lato(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800,
                                    decoration: TextDecoration.none,
                                    color: themeColor[3])),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: widget.article.description == null
                    ? null
                    : Text(widget.article.description,
                        style: GoogleFonts.lato(
                            fontStyle: FontStyle.normal,
                            fontSize: 16,
                            decoration: TextDecoration.none,
                            color: themeColor[4])),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 12),
                child: Container(
                  child: Text(
                    "Published time : " +
                        "${widget.article.publishedAt.substring(0, 10)}" +
                        "  " +
                        "${widget.article.publishedAt.substring(11, 16)}",
                    style: GoogleFonts.lato(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w800,
                        fontSize: 12,
                        decoration: TextDecoration.none,
                        color: themeColor[3]),
                  ),
                  alignment: Alignment.topLeft,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: widget.article.author == null
                    ? null
                    : Text("Author : " + widget.article.author,
                        style: GoogleFonts.lato(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w800,
                            fontSize: 12,
                            decoration: TextDecoration.none,
                            color: themeColor[3])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
