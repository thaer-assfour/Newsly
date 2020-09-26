import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsly/classes/article.dart';
import 'package:http/http.dart' as http;
import 'package:newsly/widgets/newsCard.dart';

import '../var.dart';

class NewsCat extends StatefulWidget {
  final String newsCat;

  @override
  _NewsCatState createState() => _NewsCatState();

  NewsCat(this.newsCat);
}

class _NewsCatState extends State<NewsCat> {
  var isLoading = false;
  List<Article> myArticles = [];

  Future<List<Article>> getArticleList() async {
    var url =
        'http://newsapi.org/v2/top-headlines?country=us&category='+ widget.newsCat + '&apiKey=6e60e7da8b234bde89a128dc55f3ad18';
    var response = await http.get(url);
    final body = jsonDecode(response.body)['articles'] as List;
    myArticles = body.map((json) => Article.fromJson(json)).toList();
    setState(() {
      isLoading = false;
    });
    return myArticles;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading = true;
    getArticleList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.newsCat + " News",
              style: GoogleFonts.lato(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  decoration: TextDecoration.none,
                  color: themeColor[0])),
          centerTitle: true,
          backgroundColor: themeColor[3],
        ),

        body: Container(
          color: Colors.white,
          child: isLoading
              ? Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator())
              : ListView.builder(
              itemCount: myArticles.length,
              itemBuilder: (context, index) {
                return newsCard(myArticles[index]);
              }),
        ),
      ),
    );
  }
}
