import 'package:flutter/material.dart';
import 'package:sportcred/models/global.dart';

class ZoneCardWidget extends StatelessWidget {
  final String title;
  final String img;

  const ZoneCardWidget(
    {Key key, this.title, this.img}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}