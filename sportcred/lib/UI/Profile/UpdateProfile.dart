import 'package:flutter/material.dart';
import 'package:sportcred/models/global.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key key}) : super(key: key);
  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundGray,
      appBar: AppBar(
        title: Text('Edit Profile'),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.green,
            ),
            onPressed: () {
              Navigator.pop(context);
            }
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.green,
            ),
            onPressed: () {

            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 40, top: 40, right: 40),
        //color: AppTheme.backgroundGray,
        child: ListView(
          children: [
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 5,
                          color: Colors.green,
                        ),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 3, blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0,10)
                          )
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          //temporary profile picture
                          image: NetworkImage('https://cdn.vox-cdn.com/thumbor/7XTizfDBsdR0oSDhhGHyTAD5cSc=/11x0:628x411/1200x800/filters:focal(11x0:628x411)/cdn.vox-cdn.com/assets/945137/anonymous.jpg'),
                        )
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 1, color: Colors.black),
                          color: Colors.green,
                        ),
                        child: Icon(
                            Icons.edit,
                            color: Colors.black
                        ),
                      ))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                textCapitalization: TextCapitalization.words,
                keyboardType: TextInputType.text,
                // TO DO: validator
                decoration: InputDecoration (
                    labelText: 'Name',
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: 'Guy Fawkes',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintStyle: TextStyle(fontSize:15, color: Colors.white)
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.text,
                // TO DO: validator
                decoration: InputDecoration (
                    labelText: 'Username',
                    hintText: 'guy_fawkes',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(fontSize:15, color: Colors.white)
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.emailAddress,
                // TO DO: validator
                decoration: InputDecoration (
                    labelText: 'Email',
                    hintText: 'guyfawkes@gmail.com',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(fontSize:15, color: Colors.white)
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                textCapitalization: TextCapitalization.words,
                keyboardType: TextInputType.text,
                obscureText: showPassword,
                // TO DO: validator
                decoration: InputDecoration (
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white),
                    //hintText: '*********',
                    //floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: IconButton(
                        icon: Icon(Icons.remove_red_eye, color: showPassword ? Colors.green : Colors.grey),
                        onPressed: () {
                          setState(() => showPassword = !showPassword);
                        }
                    )
                ),
              ),
            ),
            SizedBox(
                height: 40
            ),
            OutlinedButton(
                child: Text('Submit', style: TextStyle(color: Colors.green, backgroundColor: Colors.white)),
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                  backgroundColor: Colors.white,
                  side: BorderSide(width: 1, color: Colors.green),
                ),
                onPressed: () {
                  Navigator.pop(context);
                }
            )
          ],
        ),
      ),
    );
  }
}
