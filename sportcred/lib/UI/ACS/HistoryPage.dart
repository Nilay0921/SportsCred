import 'package:flutter/material.dart';
import 'package:sportcred/models/global.dart';
import 'package:sportcred/UI/ACS/HistoryWidget.dart';

class ACSHistory extends StatelessWidget {
  final String activityTitle;
  final List<String> history;

  ACSHistory({this.activityTitle, this.history});

  @override
  Widget build(BuildContext context){
    /*
    not needed if BE has a separate list for each ACS-altering activity
    List<String> getActivity(history) {
      List<String> activity = history.toString().split(" ");
      return activity;
    }
     */

    return Scaffold(
      backgroundColor: AppTheme.backgroundGray,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          activityTitle,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontFamily: 'Lato',
              fontSize: 20
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: history.length,
                  padding: EdgeInsets.all(10.0),
                  itemBuilder: (BuildContext context, int index) {
                    //List<String> parts = getActivity(history.elementAt(index));
                    return HistoryWidget(
                        activity: activityTitle,
                        change: history.elementAt(index)
                    );
                  }
                )
            )
          ]
        )
      )
    );
  }
}
