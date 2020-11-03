import 'package:flutter/material.dart';
import 'package:sportcred/UI/LoginPage.dart';
import 'package:sportcred/UI/QuestionnairePage.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
              child: Image(
                image: new AssetImage('assets/images/Logo.png')
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 50,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      width: 140,
                      child: TextField(
                        obscureText: false,
                        style: TextStyle(color: Colors.white),
                        decoration: new InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          labelText: 'First Name',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(borderSide: new BorderSide(color: Colors.white)),
                          focusedBorder: UnderlineInputBorder(borderSide: new BorderSide(color: Colors.white)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 140,
                      child: TextField(
                        obscureText: false,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          labelText: 'Last Name',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(borderSide: new BorderSide(color: Colors.white)),
                          focusedBorder: UnderlineInputBorder(borderSide: new BorderSide(color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                )
              )
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: TextField(
                obscureText: false,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(borderSide: new BorderSide(color: Colors.white)),
                  focusedBorder: UnderlineInputBorder(borderSide: new BorderSide(color: Colors.white)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: TextField(
                obscureText: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(borderSide: new BorderSide(color: Colors.white)),
                  focusedBorder: UnderlineInputBorder(borderSide: new BorderSide(color: Colors.white)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: TextField(
                obscureText: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(borderSide: new BorderSide(color: Colors.white)),
                  focusedBorder: UnderlineInputBorder(borderSide: new BorderSide(color: Colors.white)),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already a member?', style: TextStyle(color: Colors.white)),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Color(0xff05FF00)),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 180, bottom: 20),
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
                      builder: (context) => QuestionnairePage(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 7.0,
                    horizontal: 112.0
                  ),
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
                    'Register',
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
