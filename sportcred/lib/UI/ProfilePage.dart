import 'package:flutter/material.dart';
import 'package:sportcred/models/global.dart';

class ProfilePage extends StatefulWidget{
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: new Container(
        color: backgroundGrey,
        child: new ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: new Stack(fit: StackFit.loose, children: <Widget>[
                    new Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                          width: 140.0,
                          height: 140.0,
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                              image: new ExactAssetImage('assets/images/spiritBlossomTeemoPrestige.png'),
                              fit: BoxFit.cover
                            )
                          ),
                        )
                      ],
                    )
                  ])
                ),
                Padding(
                  padding: EdgeInsets.only(right: 100.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new CircleAvatar(
                        backgroundColor: sportGreen,
                        radius: 25.0,
                        child: new Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                ),
              ],
            )
          ]
        )
      )
    );
  }
}