import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsly/classes/article.dart';
import 'package:http/http.dart' as http;
import 'package:newsly/screens/NewsCatgory.dart';
import 'package:newsly/widgets/newsCard.dart';

import '../var.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var isLoading = false;
  bool animatedVar = false;
  List<String> newsType = [
    "Business",
    "Entertainment",
    "General",
    "Health",
    "Science",
    "Sports",
    "Technology"
  ];
  List<Article> myArticles = [];

  Future<List<Article>> getArticleList() async {
    var url =
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=6e60e7da8b234bde89a128dc55f3ad18';
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
            title: Text("Newsly Home",
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
        //  drawer: Drawer(),
          body: Stack(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? null
                      : 64,
                  child: MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? null
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: newsType.length,
                          padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return NewsCat(newsType[index]);
                                }));
                              },
                              child: Container(
                                margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(
                                    left: 24, right: 24, top: 12, bottom: 12),
                                decoration: BoxDecoration(
                                    color: themeColor[0],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                    border: Border.all(
                                        color: themeColor[3],
                                        width: 1,
                                        style: BorderStyle.solid)),
                                child: Text(newsType[index],
                                    style: GoogleFonts.lato(
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        decoration: TextDecoration.none,
                                        color: themeColor[3])),
                              ),
                            );
                          }),
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                  ),
                  child: MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? null
                      : Text(
                          "Latest News:",
                          style: GoogleFonts.lato(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              decoration: TextDecoration.none,
                              color: themeColor[3]),
                        ),
                ),
                Flexible(
                  child: isLoading
                      ? Align(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator())
                      : GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                      MediaQuery.of(context).orientation ==
                                              Orientation.landscape
                                          ? 2
                                          : 1,
                              childAspectRatio: MediaQuery.of(context).orientation == Orientation.landscape
                                  ? 25/17
                                  : 25/22),
                          itemCount: myArticles.length,
                          itemBuilder: (context, index) {
                            return newsCard(myArticles[index], context);
                          }),
                )
              ],
            ),
          ])),
    );
  }
}
