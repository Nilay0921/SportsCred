import 'package:flutter/material.dart';
import 'package:sportcred/BottomNavigation.dart';
import 'package:sportcred/UI/ForgotPWPage.dart';
import 'package:sportcred/UI/RegisterPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              margin: EdgeInsets.fromLTRB(20, 0, 20, 50),
              child: Image(
                image: new AssetImage('assets/images/Logo.png')
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
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
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
              margin: EdgeInsets.fromLTRB(177, 0, 0, 225),
              child: TextButton(
                onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgotPWPage(),
                      ),
                    );
                  },
                child: Text('Forgot Password',
                    style: TextStyle(color: Colors.grey)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('New to SportCred?', style: TextStyle(color: Colors.white)),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(color: Color(0xff05FF00)),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 0, bottom: 20),
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
                    vertical: 7.0,
                    horizontal: 125.0
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
                    'Login',
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
