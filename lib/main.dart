
import 'package:flutter/material.dart';
import './screens/HomeScreen.dart';
import 'screens/WelcomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{


  runApp(Newsly());

}

class Newsly extends StatefulWidget {
  @override
  _NewslyState createState() => _NewslyState();
}

class _NewslyState extends State<Newsly> {
  bool isFirstRun = true;


  Future getPref () async {
    final prefs = await SharedPreferences.getInstance();
    isFirstRun = prefs.getBool("firstRun");
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isFirstRun ? WelcomeScreen() : HomeScreen(),
    );
  }
}
