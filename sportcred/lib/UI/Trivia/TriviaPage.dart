import 'package:flutter/material.dart';
import 'package:sportcred/models/global.dart';
import 'package:simple_timer/simple_timer.dart';
import 'dart:async';
import 'dart:convert';

class TriviaConnection extends StatelessWidget {
  final String gameType;
  TriviaConnection(this.gameType);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString("assets/trivia.json"),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          List triviaData = json.decode(snapshot.data.toString());
          if (triviaData != null) {
            return TriviaTester(triviaData: triviaData, gameType: gameType);
          } else {
            return Container(
              child: Text('Update trivia connection'),
            );
          }
        }
    );
  }
}

class TriviaTester extends StatefulWidget {
  final triviaData;
  final String gameType;
  TriviaTester({Key key, this.triviaData, this.gameType}) : super(key: key);
  @override
  _TriviaTesterState createState() => _TriviaTesterState(triviaData, gameType);
}

class _TriviaTesterState extends State<TriviaTester> with SingleTickerProviderStateMixin {
  var triviaData;
  String gameType;
  var questionList = List<int>.generate(13, (index) => index + 1);
  int questionIndex = 0;
  int questionNumber;
  int questionTitle;
  TimerController _timerController;
  bool optionAColourChange = false;
  bool optionBColourChange = false;
  bool optionCColourChange = false;
  bool optionDColourChange = false;
  var newButtonColour;
  int score = 0;
  final myController = TextEditingController();
  _TriviaTesterState(this.triviaData, this.gameType);

  @override
  void initState() {
    questionList.shuffle();
    _timerController = TimerController(this);
    _timerController.duration = Duration(seconds: 14);
    _timerController.start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    questionNumber = questionList.elementAt(questionIndex);
    questionTitle = questionIndex + 1;

    void checkQuestionNumber() {
      setState(() {
        optionAColourChange = false;
        optionBColourChange = false;
        optionCColourChange = false;
        optionDColourChange = false;
        score--;
        if (questionIndex < 9) {
          questionIndex++;
        } else {
          Navigator.pop(context);
          showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: Text('Trivia Results'),
                content: Text('You obtained $score points.\n\nWould you like to play more trivia?'),
                actions: [
                  FlatButton(
                      child: Text('NO'),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      }
                  ),
                  FlatButton(
                    child: Text('YES'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              )
          );
        }
      });
      _timerController.restart();
    }

    void checkButtonAnswer(String choice) {
      setState(() {
        _timerController.pause();
        if (choice == "optionA") {
          optionAColourChange = true;
        } else if (choice == "optionB") {
          optionBColourChange = true;
        } else if (choice == "optionC") {
          optionCColourChange = true;
        } else if (choice == "optionD") {
          optionDColourChange = true;
        }
        if (triviaData[1]['$questionNumber']['$choice'] == triviaData[2]['$questionNumber']) {
          newButtonColour = Colors.green[800];
          score = score + 2;
        } else {
          newButtonColour = Colors.red[600];
        }
      });
      Future<void>.delayed(Duration(seconds: 1), () => checkQuestionNumber());
    }

    void checkFillAnswer(String answer) {
      setState(() {
        _timerController.pause();
        if (answer == triviaData[2]['$questionNumber']) {
          score = score + 2;
        }
      });
      Future<void>.delayed(Duration(seconds: 1), () => checkQuestionNumber());
    }

    Widget triviaButton(String option, var optionColourChange) {
      return Padding(
          padding: EdgeInsets.all(25),
          child: ButtonTheme(
            minWidth: 325,
            height: 50,
            child: RaisedButton(
                color: optionColourChange ? newButtonColour : Colors.grey[400],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                onPressed: () {
                  checkButtonAnswer(option);
                },
                child: Text(
                  triviaData[1]['$questionNumber'][option],
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18
                  )
              ),
            ),
          )
      );
    }

    List<Widget> viewOfQuestionTypes() {
      List<Widget> view;
      if (triviaData[3]['$questionNumber'] == "multiple") {
        view = [
          triviaButton('optionA', optionAColourChange),
          triviaButton('optionB', optionBColourChange),
          triviaButton('optionC', optionCColourChange),
          triviaButton('optionD', optionDColourChange),
        ];
      } else if (triviaData[3]['$questionNumber'] == "fill") {
        view = [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: TextField(
              controller: myController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)
                  )
              ),
            ),
          ),
          OutlinedButton(
              child: Text('Enter', style: TextStyle(color: Colors.green, backgroundColor: Colors.white)),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                backgroundColor: Colors.white,
                minimumSize: Size(100, 50),
                side: BorderSide(width: 1, color: Colors.green),
              ),
              onPressed: () {
                checkFillAnswer(myController.text);
                myController.clear();
              }
          )
        ];
      }
      return view;
    }

    List<Widget> viewOfHeaderTypes() {
      List<Widget> view;
      if (gameType == 'solo') {
        view = [
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  'https://cdn.vox-cdn.com/thumbor/7XTizfDBsdR0oSDhhGHyTAD5cSc=/11x0:628x411/1200x800/filters:focal(11x0:628x411)/cdn.vox-cdn.com/assets/945137/anonymous.jpg'),
            )
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              'guy_fawkes',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w600,
              ),
            )
          )
        ];
      } else if (gameType == 'multi') {
        view = [
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://cdn.vox-cdn.com/thumbor/7XTizfDBsdR0oSDhhGHyTAD5cSc=/11x0:628x411/1200x800/filters:focal(11x0:628x411)/cdn.vox-cdn.com/assets/945137/anonymous.jpg'),
                ),
                Text(
                  'vs',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/placeholder.png'),
                )
            ]
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'guy_fawkes',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'trivia_rival',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ]
          )
        ];
      }
      return view;
    }

    return Scaffold(
        backgroundColor: AppTheme.backgroundGray,
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Question $questionTitle of 10'),
          centerTitle: true,
        ),
        body: Center(
            child: Column(
                children: <Widget>[
                  Expanded(
                      child: Column(
                          children: viewOfHeaderTypes()
                      )
                  ),
                  Expanded(
                    child: Container(
                      color: Color(0xFF1CEF5B),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                              triviaData[0]['$questionNumber'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 19
                              )
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 4,
                      child: Container(
                          child: Column(
                            children: viewOfQuestionTypes()
                          )
                      )
                  ),
                  Expanded(
                      child: Container(
                          child: Padding(
                              padding: EdgeInsets.only(bottom: 20),
                              child: SimpleTimer(
                                controller: _timerController,
                                duration: Duration(seconds: 14),
                                progressTextStyle: TextStyle(
                                    color: Colors.white
                                ),
                                onEnd: checkQuestionNumber,
                              )
                          )
                      )
                  )
                ]
            )
        )
    );
  }
}
