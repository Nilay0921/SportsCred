import 'package:flutter/material.dart';
import 'package:sportcred/UI/ACS/ACSWidget.dart';
import 'package:sportcred/models/global.dart';
import 'package:sportcred/UI/Profile/PicksHistoryPage.dart';
import '../../models/global.dart';

class ProfilePage extends StatefulWidget{
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>{
  int radarListSize = 5; //[BACKEND] Get size of radar list
  bool radarListToggled = false;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFF2b2b29),
      body: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top:20.0),
                  child: CircleAvatar(
                    radius: 63,
                    backgroundColor: Color(0xFF000000),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/images/placeholder.png'),
                    )
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top:125.0, left: 85),
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Color(0xFF1CEF5B)
                  ),
                ),
              ]
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top:10.0),
              child: Text(
                'Sameer Khan',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  color: Colors.white
                )
              )
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top:5.0),
              child: Text(
                'A.C.S:' + ' 154 436',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.sportGreen
                )
              )
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top:10.0),
              child: Text(
                'Huge fan of basketball! Favourite team is Toronto Raptors. Also watch some' +
                'baseball and football during playoffs',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  color: Colors.white
                )
              )
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 25.0, top:30.0),
              child: Text(
                'Radar List',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white
                )
              )
            ),
            Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.only(left: 25.0, top: 5.0),
              child: new Container(
                height: 2.0,
                width: 95.0,
                color: Colors.black
              )
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top:10.0),
              child: new ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: getList()
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(top:5.0),
              child: new GestureDetector(
                onTap: _onItemTapped,
                child: new Container(
                  height: 25,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey[400],
                  child: getIcon(radarListToggled)
                ),
              )
            ),
            Container(
              padding: EdgeInsets.only(top: 20.0),
              alignment: Alignment.bottomCenter,
              child: new Row(
                children: <Widget>[
                  new Container(
                    padding: EdgeInsets.only(left:10.0),
                    child: new GestureDetector(
                      onTap: _onItemTappedPicks,
                      child: new Container(
                        height: 60,
                        width: 180,
                        decoration: new BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: new BorderRadius.all(Radius.circular(20.0))
                        ),
                        child: Center(
                          child: new Text(
                            'Picks History',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Colors.black
                            )
                          ),
                        )
                      ),
                    )
                  ),
                  new Container(
                    padding: EdgeInsets.only(left:20.0),
                    child: new GestureDetector(
                      onTap: _onItemTappedACS,
                      child: new Container(
                        height: 60,
                        width: 180,
                        decoration: new BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: new BorderRadius.all(Radius.circular(20.0))
                        ),
                        child: Center(
                          child: new Text(
                            'ACS Breakdown',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Colors.black
                            )
                          ),
                        )
                      ),
                    ),
                  )
                ],
              ),
            )
          ]
        )
      )
    );
  }

  List<Widget> getList(){
    List<Container> list = [];
    if (!radarListToggled){
      list = createList(3);
    } else{
      list = createList(radarListSize);
    }
    return list;
  }

  List<Widget> createList(int size){
    List<Container> list = [];
    for (int i = 0; i < size; i++){
        list.add(Container(
          height: 50,
          color: i % 2 == 0 ? Colors.grey[800] : Colors.grey[700],
          child: new Center(
            child: new Text(
              'Name Here',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'Lato',
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: Colors.white
              )
            )
          )
        ));
      }
    return list;
  }

  void _onItemTappedPicks(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => PicksHistoryPage()));
  }

  void _onItemTappedACS(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => ACSWidget()));
  }

  void _onItemTapped() {
    setState(() {
      if (radarListToggled == true){
        radarListToggled = false;
      } else{
        radarListToggled = true;
      }
    });
  }

  Icon getIcon(bool radarListToggled){
    if (radarListToggled){
      return Icon(Icons.keyboard_arrow_up);
    } else{
      return Icon(Icons.keyboard_arrow_down);
    }
  }

}
