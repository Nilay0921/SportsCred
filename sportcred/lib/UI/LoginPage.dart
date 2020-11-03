import 'package:flutter/material.dart';
import 'package:sportcred/BottomNavigation.dart';
import 'package:sportcred/models/global.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF2b2b29),
        body: new Container(
            padding: EdgeInsets.fromLTRB(30, 100, 30, 0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 180, 30),
                  child: Text(
                    'Login',
                    textScaleFactor: 3,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: new Color.fromARGB(500, 500, 500, 500),
                    ),
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  color: Colors.white,
                  child: TextField(
                    controller: emailController,
                    obscureText: false,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  color: Colors.white,
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Container(
                  child: RaisedButton(
                    color: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 129.0),
                    //go to HomePage (The Zone)
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));},
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('New to SportCred?'),
                    TextButton(
                      onPressed: () {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                        builder: (context) => RegisterPage(),
//                      ),
//                    );
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(color: Color(0xff05FF00)),
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: null,
                  child: Text('Forgot Password?',
                      style: TextStyle(color: Colors.black)),
                )
              ],
            )));
  }
}
