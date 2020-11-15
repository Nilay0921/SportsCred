import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'OpenCourt/OpenCourtPage.dart';

class LoginPage2 extends StatefulWidget {
  const LoginPage2({Key key}) : super(key: key);
  @override
  _LoginPage2State createState() => _LoginPage2State();
  //State<StatefulWidget> createState() => _HomePageState();
}

class _LoginPage2State extends State<LoginPage2> {
  /*
  final GlobalKey<FormFieldState<String>> _passwordFieldKey = GlobalKey<FormFieldState<State<String>>();
  String _name;
  String _email;
  String _username;
  String _password;

  String _validateName(String value) {
    if (value.isEmpty) {
      return 'Please enter your full name:';
    }
  }
   */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        padding: EdgeInsets.all(25),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 350,
                  width: 350,
                  child: new Image.asset('assets/images/logo_centered_darkbg.png'),
                ),
                Container(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    textInputAction: TextInputAction.none,
                    keyboardType: TextInputType.emailAddress,
                    //TO DO: validate validator - username and/or email address
                    validator: (String arg) {},
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(13))
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(13))
                        ),
                        labelStyle: TextStyle(color: Colors.white),
                        labelText: 'Username or Email'
                    ),
                    style: TextStyle(fontSize: 15.0, color: Colors.white),
                    onChanged: (String value) {
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(13))
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(13))
                    ),
                    labelStyle: TextStyle(color: Colors.white),
                    labelText: 'Password',
                    suffixIcon: Icon(Icons.lock),
                  ),
                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                  onChanged: (String value) {
                    setState() {

                    };
                  },
                ),
                GestureDetector(
                  onTap: () {

                  },
                  child: Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(top: 10, right: 5),
                    child: Text('Forgot Password?',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                OutlineButton(
                  child: Text('Login',
                    style: TextStyle(color: Colors.white),
                  ),
                  borderSide: BorderSide(color: Colors.white),
                  shape: StadiumBorder(),
                  onPressed: () {
                    //Navigator.pushNamed(context, /openCourt);
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => OpenCourtPage()));
                  },
                ),
                OutlineButton(
                  child: Text('Register',
                    style: TextStyle(color: Colors.white),
                  ),
                  borderSide: BorderSide(color: Colors.white),
                  shape: StadiumBorder(),
                  onPressed: () {
                    //Navigator.pushNamed(context, '/register');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}