import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sportcred/models/global.dart';
import 'package:sportcred/UI/TheZone/ZoneCardWidget.dart';

class TheZonePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: AppTheme.backgroundGray,
      body: Container(
        padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/sportcredLogo.png'),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.only(top:30.0),
                children: <Widget>[
                  ZoneCardWidget(
                    title: 'The Zone',
                    img: 'assets/images/openCourt.png'
                  ),
                  ZoneCardWidget(
                    title: 'Picks',
                    img: 'assets/images/picks.png'
                  ),
                  ZoneCardWidget(
                    title: 'Trivia',
                    img: 'assets/images/trivia.png',
                    connection: 'trivia'
                  ),
                  ZoneCardWidget(
                    title: 'Analyze',
                    img: 'assets/images/analyze.png'
                  )
                ],
              )
            )
          ],
        )
      )
    );
  }
}