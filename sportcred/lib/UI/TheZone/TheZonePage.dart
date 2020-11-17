import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sportcred/UI/TheZone/AddPostWidget.dart';
import 'package:sportcred/models/global.dart';
import 'package:sportcred/UI/TheZone/PostWidget.dart';
import 'package:sportcred/BottomNavigation.dart';

class TheZonePage extends StatefulWidget{
  @override
  TheZonePageState createState() => TheZonePageState();
}

final List<String> titles= <String>['A very long statement that actually is super long. Consider applying a flex factor to force the children', 'So this text isn\'t as long as it should be',
'E-sports is taking over viewership of many other sports', 'Pascal Siakam Bad', 'Jimmy Butler beat Kevin Hart in a 3-point shoot out with only his left hand!!!!', 'This post actually exists just to check the scrolling capability and to see if I can put a button over a post'];
final List<String> descs = <String>['Lots of text also belongs here because I think I should put a good number of characters to test how my app deals with it otherwise I\'m sad',
'But we have enough text here that it can make the post look normal I hope that everything else does too', 'Esports viewership has gone to crazy high levels. Offseason basketball was not playing on the sports channel but an Overwatch pro game was thats honestly crazy!',
'Now give me your upvotes Toronto Raptors fans', 'I mean to be fair Kevin Hart is like 4 feet shorter than Jimmy Butler so I guess I gotta give that to him', 'I don\'t know if having a button over posts in the bottom right is better or if having a button somewhere else on the screen is who knows?. Let me know your thoughts down below'];
final List<int> upvotes = <int>[20, 402, 203, 1400, 320, 12];

class TheZonePageState extends State<TheZonePage>{

  static void addItem(String title, String desc){
    titles.insert(0, title);
    descs.insert(0, desc);
    upvotes.insert(0, 0);
  }

  void _onItemTapped(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => AddPostWidget()));
  }
    

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: AppTheme.backgroundGray,
      appBar: AppBar(
        title: Text(
            "The Zone",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontFamily: 'Lato',
          fontSize: 20),
        ),
      centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 5.0),
              child: Image.asset('assets/images/sportcredLogo.png'),
            ),
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.only(right: 5.0, bottom: 20.0),
              child: Container(
                height: 20,
                width:20,
                child: GestureDetector(
                  onTap: _onItemTapped,
                  child: Icon(Icons.add_box_rounded, color: Colors.green)
                )
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: titles.length,
                itemBuilder: (BuildContext context, int index){
                  return PostWidget(
                    title: '${titles[index]}',
                    desc: '${descs[index]}',
                    upvotes: upvotes[index]
                  );
                }
              )
            ),
          ],
        ),
      ),
    );
  }
}