import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> newsType = [
    "Business",
    "Entertainment",
    "General",
    "Health",
    "Science",
    "Sports",
    "Technology"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Newsly Home"),centerTitle: true,backgroundColor: Colors.lightBlue,),
        drawer: Drawer(),
        body: Stack(children: [
          Container(color: Colors.white70,),
          Container(
            height: 64,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: newsType.length,
                padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 24, right: 24,top: 12,bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                        border: Border.all(color: Colors.black54,width: 2,style: BorderStyle.solid)),
                    child: Text(newsType[index]),
                  );
                }),
          )
        ]),
      ),
    );
  }
}
