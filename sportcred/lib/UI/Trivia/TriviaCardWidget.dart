import 'package:flutter/material.dart';
import 'package:sportcred/UI/Trivia/TriviaPage.dart';
import 'package:sportcred/models/global.dart';

class TriviaCardWidget extends StatelessWidget {
  final String title;
  final String img;
  final String connection;
  TriviaCardWidget({Key key, this.title, this.img, this.connection}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> radarOpponents = ['opponentA','opponentB','opponentC','opponentD','opponentE','opponentF','opponentG','opponentH','opponentI','opponentJ'];

    List<ListTile> getOpponents() {
      List<ListTile> opponents = [];
      opponents.add(
        ListTile(
          leading: const Icon(Icons.cached_rounded),
          title: Text('Random opponent', style: TextStyle(fontFamily: 'Lato')),
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TriviaConnection('multi')))
        )
      );
      for (var i in radarOpponents) {
        opponents.add(
            ListTile(
                leading: const Icon(Icons.account_circle),
              title: Text(i, style: TextStyle(fontFamily: 'Lato')),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TriviaConnection('multi')))
            )
        );
      }
      return opponents;
    }

    return InkWell(
      onTap: () {
        if (connection == 'solo') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => TriviaConnection('solo')));
        } else if (connection == 'multi') {
          showDialog<String>(context: context, builder: (BuildContext context) => SimpleDialog(
              title: const Text('Choose opponent'),
              titleTextStyle: TextStyle(
                  fontFamily: 'Lato',
                  color: Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
              children: getOpponents()
            )
          );
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
                    height: 325.0,
                    width: 365.0,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 5.0),
                      child: Text(
                          title,
                          textAlign: TextAlign.left,
                          style: AppTheme.triviaText
                      ),
                    ),
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        image: new DecorationImage(
                            fit: BoxFit.cover,
                            alignment: FractionalOffset.topCenter,
                            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.srcOver),
                            image: new AssetImage(img)
                        )
                    ),
                  )
              )
            ],
          ),
        ),
      )
    );
  }
}