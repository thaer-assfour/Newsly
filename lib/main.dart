
import 'package:flutter/material.dart';
import './screens/HomeScreen.dart';
import 'screens/WelcomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isRunBefore = prefs.getBool('runBefore');
  Widget _screen;
  if (isRunBefore == null || isRunBefore == false)
    _screen = WelcomeScreen();
  else
    _screen = HomeScreen();

  runApp(Newsly(_screen));

}

class Newsly extends StatefulWidget {
  final Widget screen;



  @override
  _NewslyState createState() => _NewslyState();

  Newsly(this.screen);
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
      home: widget.screen,
    );
  }
}
