import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sportcred/models/global.dart';
import 'package:sportcred/UI/Trivia/TriviaCardWidget.dart';

class TriviaHome extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: AppTheme.backgroundGray,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Trivia",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontFamily: 'Lato',
              fontSize: 20
            ),
          ),
        ),
        body: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top:15.0),
                      children: <Widget>[
                        TriviaCardWidget(
                            title: 'Solo',
                            img: 'assets/images/soloPlayer.jpg',
                            connection: 'solo'
                        ),
                        TriviaCardWidget(
                            title: 'Head-to-head',
                            img: 'assets/images/jumpBall.jpg',
                            connection: 'multi'
                        ),
                      ],
                    )
                )
              ],
            )
        )
    );
  }
}