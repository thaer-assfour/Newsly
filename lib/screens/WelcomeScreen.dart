
import 'dart:ui';
import 'package:newsly/screens/HomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrolling_page_indicator/scrolling_page_indicator.dart';

import '../var.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List pageId = [1, 2, 3, 4]; // number of pages and connected to name of background in assets folder.
  List pageTitle = [
    "Welcome to \n Newsly \n App",
    "The latest local and international news",
    "Breaking news from International news agencies",
    "Read the newspaper headlines"
  ]; // title appear on welcome page it connected to pageId list one by one.
  PageController _controller = PageController(
    initialPage: 0,
  );


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: [
          PageView.builder(
            controller: _controller,
            itemCount: pageId.length,
            itemBuilder: (context, index) {
              return welcome(pageId[index], pageTitle[index]); //welcome widget
            }),
          Padding(
          padding: const EdgeInsets.all(24),
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ScrollingPageIndicator( // plugin
                    dotColor: themeColor[1],
                    dotSelectedColor: themeColor[0],
                    dotSize: 8,
                    dotSelectedSize: 12,
                    dotSpacing: 24,
                    controller: _controller,
                    itemCount: pageId.length,
                    orientation: Axis.horizontal,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 48,
                    decoration: BoxDecoration(),
                    child: RaisedButton(
                      color:themeColor[0],
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30)),
                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setBool('runBefore', true); // set// value to not shown welcome screen if the program loaded before
                      Navigator.push(context, MaterialPageRoute(builder: (context){return HomeScreen();}));
                      },
                      child: Text(
                        "Get Started",
                        style: GoogleFonts.lato(
                          fontStyle: FontStyle.normal,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: themeColor[3],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        )
      ],
    ));
  }
}

Widget welcome(int id, String title) {
  String path = 'assets/images/Welcome' + id.toString() + '.jpg';

  return SafeArea(
      child: Stack(
    children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(path),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0, sigmaY: 1),
          child: Container(
            color: Colors.black26.withOpacity(0.7),
          ),
        ),
      ),
      Align(
          alignment: Alignment.center,
          child: Text(
            title,
            style: GoogleFonts.lato(
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.none,
                color: themeColor[0]),
            textAlign: TextAlign.center,
          ))
    ],
  ));
}
