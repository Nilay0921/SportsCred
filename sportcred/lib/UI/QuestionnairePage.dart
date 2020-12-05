import 'package:flutter/material.dart';
import 'package:sportcred/BottomNavigation.dart';
import 'package:sportcred/UI/LoginPage.dart';

class QuestionnairePage extends StatefulWidget {
  @override
  _QuestionnairePageState createState() => _QuestionnairePageState();
}

class _QuestionnairePageState extends State<QuestionnairePage> {
  String dropdownvalue = 'No History';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF2b2b29),
      body: new Container(
        padding: EdgeInsets.fromLTRB(30, 100, 30, 0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 30),
                child: Text(
                  'Questionnaire',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                )),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 250, 10),
              child: TextField(
                obscureText: false,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  labelText: 'Age',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: TextField(
                obscureText: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  labelText: 'Favourite Sport?',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: TextField(
                obscureText: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  labelText: 'Odd Sport?',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: TextField(
                obscureText: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  labelText: 'Favourite Sports Team?',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white)),
                ),
              ),
            ),
            Text(
              'Highest Level of Sport Play?',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            Container(
              width: 140,
              child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButton<String>(
                  value: dropdownvalue,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  dropdownColor: Colors.black,
                  items: <String>[
                    'No History',
                    'Elementary',
                    'High School',
                    'University',
                    'Professional'
                  ].map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      dropdownvalue = newValue;
                    });
                  },
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 130, bottom: 20),
              child: RaisedButton(
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                padding: EdgeInsets.all(0),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 7.0, horizontal: 126.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xff228B22),
                        Color(0xff2EB62C),
                        Color(0xff83D475)
                      ],
                    ),
                  ),
                  child: const Text(
                    'Done',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      )
    );
  }
}
