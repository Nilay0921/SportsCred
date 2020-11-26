import 'package:flutter/material.dart';
import 'package:sportcred/UI/Debate/DebatePage.dart';
import 'package:sportcred/models/global.dart';

class DebateWidget extends StatelessWidget {
  final String question;

  const DebateWidget({Key key, this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DebatePage(question)));
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: AppTheme.backgroundGray,
                blurRadius: 15.0
            )
          ]
        ),
        child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
            child: ListTile(
              contentPadding: EdgeInsets.fromLTRB(10.0, 25.0, 15.0, 25.0),
              title: Text(
                question,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w400
                )
              ),
              trailing: Icon(Icons.arrow_right_outlined)
            )
        ),
      )
    );
  }
}
