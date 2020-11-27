import 'package:flutter/material.dart';
import 'package:sportcred/UI/Picks/PicksPage.dart';
import 'package:sportcred/UI/Trivia/TriviaHome.dart';
import 'package:sportcred/UI/TheZone/TheZonePage.dart';
import 'package:sportcred/models/global.dart';
import 'package:sportcred/UI/Debate/DebateHome.dart';

class CourtCardWidget extends StatelessWidget {
  final String title;
  final String img;
  final String connection;

  const CourtCardWidget(
    {Key key, this.title, this.img, this.connection}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (connection == 'trivia') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => TriviaHome()));
        } else if (connection == 'zone') { 
          Navigator.push(context, MaterialPageRoute(builder: (context) => TheZonePage()));
        } else if (connection == 'picks') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => PicksPage()));
        } else if (connection == 'analyze') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => DebateHome()));
        }
      },
      child: Card(
      elevation: 0.0,
      color: Color(0x00000000),
      child: Padding(
        padding: const EdgeInsets.only(top: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              child: new Container(
                height: 125.0,
                width: 365.0,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 5.0),
                  child: Text(
                    '$title',
                    textAlign: TextAlign.left,
                    style: AppTheme.zoneText
                  ),
                ),
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  image: new DecorationImage(
                    fit: BoxFit.cover,
                    alignment: FractionalOffset.topCenter,
                    colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.srcOver),
                    image: new AssetImage('$img')
                  )
                ),
              )
            )
          ],
        ),
      ),
    ));
  }
}