import 'package:flutter/material.dart';
import 'package:sportcred/models/global.dart';
import 'package:sportcred/UI/Debate/DebateWidget.dart';
import 'package:intl/intl.dart';

class DebateHome extends StatefulWidget {
  @override
  _DebateHomeState createState() => _DebateHomeState();
}

class _DebateHomeState extends State<DebateHome> {
  List<String> debateQuestions = ['Who is the greatest of all time?', 'Is Dwight Howard a HOF\'er?', 'What should be the criteria for the HOF? Rings or accolades?', 'Is Carmelo Anthony a HOF\'er?', 'Does Ja Morant win ROY if Zion plays a full season based on the numbers he put up in the games before and after the bubble?', 'Should college basketball players be paid?', 'Best team ever?', 'Who would you rather build around? Giannis Antetokounmpo or Ben Simmons?', 'Kyle Lowry or Russell Westbrook?', 'Should WNBA players be paid more?'];

  @override
  Widget build(BuildContext context){
    var date = DateTime.now();
    var dateFormat = DateFormat('EEEE, MMMM d');
    String formattedDate = dateFormat.format(date);

    return Scaffold(
      backgroundColor: AppTheme.backgroundGray,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Debates",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontFamily: 'Lato',
              fontSize: 20
          ),
        ),
      ),
      body: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         children: <Widget>[
           Expanded(
             child: Container(
               padding: EdgeInsets.all(15.0),
               margin: EdgeInsets.all(20.0),
               decoration: BoxDecoration(
                   border: Border.all(
                     color: AppTheme.sportGreen,
                     width: 3.0
                   ),
                   borderRadius: BorderRadius.all(
                       Radius.circular(10.0)
                   )
               ),
               child: Text(
                 formattedDate,
                 style: TextStyle(
                     color: Colors.white,
                     fontWeight: FontWeight.w400,
                     fontFamily: 'Lato',
                     fontSize: 20
                 ),
               ),
             )
           ),
           Expanded(
               flex: 6,
               child: ListView.builder(
                   shrinkWrap: true,
                   itemCount: debateQuestions.length,
                   padding: EdgeInsets.all(10.0),
                   itemBuilder: (BuildContext context, int index) {
                     return Align(
                       heightFactor: 0.9,
                       child: DebateWidget(
                           question: '${debateQuestions[index]}'
                       )
                     );
                   }
               )
           ),
         ],
      ),
    );
  }
}
