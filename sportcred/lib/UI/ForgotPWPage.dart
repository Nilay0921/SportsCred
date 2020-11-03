import 'package:flutter/material.dart';
import 'package:sportcred/BottomNavigation.dart';
import 'package:sportcred/UI/LoginPage.dart';

class ForgotPWPage extends StatefulWidget {
  @override
  _ForgotPWPageState createState() => _ForgotPWPageState();
}

class _ForgotPWPageState extends State<ForgotPWPage> {
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
                margin: EdgeInsets.fromLTRB(4, 0, 4, 30),
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                )),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: TextField(
                obscureText: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 50),
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
                      vertical: 7.0, horizontal: 99.0),
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
                    'Send Email',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
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
                  labelText: 'Code',
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
                  labelText: 'New Password',
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
                  labelText: 'Confirm New Password',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 50),
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
                      vertical: 7.0, horizontal: 69.0),
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
                    'Change Password',
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