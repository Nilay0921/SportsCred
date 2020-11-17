import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sportcred/models/global.dart';
import 'package:sportcred/UI/TheZone/TheZonePage.dart';

class AddPostWidget extends StatefulWidget {
  @override
  _AddPostWidgetState createState() => _AddPostWidgetState();
}

class _AddPostWidgetState extends State<AddPostWidget> {
    final titleController = TextEditingController();
    final descController = TextEditingController();
    GlobalKey<TheZonePageState> addKey = GlobalKey<TheZonePageState>();

    @override
    void dispose() {
      titleController.dispose();
      descController.dispose();
      super.dispose();
    }

    void _onButtonPress() {
      String title = titleController.text;
      String desc = descController.text;
      print(title + desc);
      if (title.length <= 100 && desc.length <= 400 && title.length > 0 && desc.length > 0){
        TheZonePageState.addItem(title, desc);
        Navigator.push(context, MaterialPageRoute(builder: (context) => TheZonePage()));
      }
    }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF2b2b29),
      appBar: AppBar(
        title: Text(
            "Add Post",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontFamily: 'Lato',
          fontSize: 20
        ),
      ),
      centerTitle: true,
      ),
      body: new Container(
        padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: TextField(
                keyboardType: TextInputType.multiline,
                obscureText: false,
                maxLines: null,
                maxLength: 100,
                controller: titleController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  counterStyle: TextStyle(color: Colors.white),
                  contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  labelText: 'Title',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(borderSide: new BorderSide(color: Colors.white)),
                  focusedBorder: UnderlineInputBorder(borderSide: new BorderSide(color: Colors.white)),
                ),
              ),
            ),
            Container(
              child: TextField(
                keyboardType: TextInputType.multiline,
                obscureText: false,
                maxLines: null,
                maxLength: 400,
                controller: descController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  counterStyle: TextStyle(color: Colors.white),
                  contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  labelText: 'Content',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(borderSide: new BorderSide(color: Colors.white)),
                  focusedBorder: UnderlineInputBorder(borderSide: new BorderSide(color: Colors.white)),
                ),
              ),
            ),
            Container(
              width: 365,
              padding: EdgeInsets.only(top: 10.0),
              child: FlatButton(
                child: Text('Post'),
                color: AppTheme.sportGreen,
                onPressed: _onButtonPress,
              )
            )
          ],
        )
      )
    );
  }
}
