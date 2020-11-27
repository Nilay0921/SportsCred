import 'package:flutter/material.dart';

class DebateResponseWidget extends StatefulWidget {
  final String username;
  final String responseText;
  //List<double> responseRatings;

  DebateResponseWidget({this.username, this.responseText});

  @override
  _DebateResponseWidgetState createState() => _DebateResponseWidgetState(username, responseText);
}

class _DebateResponseWidgetState extends State<DebateResponseWidget> {
  // temp
  String currentUser = 'guy_fawkes';

  double _currentSliderValue = 0.0;
  double responseRating = 0.0;
  _DebateResponseWidgetState(String username, String responseText);

  @override
  Widget build(BuildContext context) {
    String responseText = widget.responseText;
    String username = widget.username;
    Object appropriateTrailing;
    Object appropriateLeading;
    Object appropriateSubtitle;

    if (username == currentUser) {
      appropriateTrailing = Column(
          children: <Widget>[
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage('https://cdn.vox-cdn.com/thumbor/7XTizfDBsdR0oSDhhGHyTAD5cSc=/11x0:628x411/1200x800/filters:focal(11x0:628x411)/cdn.vox-cdn.com/assets/945137/anonymous.jpg')
            ),
            Text(
                username,
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 10
                )
            )
          ]
      );
    } else {
      appropriateLeading = Column(
          children: <Widget>[
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage("assets/images/empty user.png")
            ),
            Text(
              username,
              style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 10
              )
            )
          ]
      );
      appropriateSubtitle = Slider(
          value: _currentSliderValue,
          min: 0,
          max: 100,
          divisions: 10,
          activeColor: Colors.grey[700],
          inactiveColor: Colors.grey[300],
          label: _currentSliderValue.round().toString(),
          onChanged: (double value) {
            setState(() {
              _currentSliderValue = value;
            });
          },
          onChangeEnd: (double value) {
            responseRating = _currentSliderValue;
          }
      );
    }

    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        color: Colors.white,
        child: ListTile(
            contentPadding: EdgeInsets.all(15.0),
            leading: appropriateLeading,
            title: Text(
                responseText,
                style: TextStyle(
                    fontFamily: 'Lato',
                    fontSize: 17,
                    color: Colors.green,
                    fontWeight: FontWeight.w400
                )
            ),
            subtitle: appropriateSubtitle,
            trailing: appropriateTrailing
        )
    );
  }
}
