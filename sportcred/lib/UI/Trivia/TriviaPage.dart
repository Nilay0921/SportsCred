import 'package:flutter/material.dart';
import 'package:sportcred/models/global.dart';
import 'package:sportcred/BottomNavigation.dart';
import 'package:simple_timer/simple_timer.dart';
import 'dart:async';
import 'dart:convert';

class dbConnection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // temp, TO DO: connect to BE
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString("assets/trivia.json"),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        List triviaData = json.decode(snapshot.data.toString());
        if (triviaData != null) {
          return TriviaPage(triviaData: triviaData);
        } else {
          return Container(
            child: Text('Update trivia connection'),
          );
        }
      }
    );
  }
}

class TriviaPage extends StatefulWidget {
  final triviaData;
  TriviaPage({Key key, this.triviaData}) : super(key: key);
  @override
  _TriviaPageState createState() => _TriviaPageState(triviaData);
}

class _TriviaPageState extends State<TriviaPage> with SingleTickerProviderStateMixin {
  var triviaData;
  int questionIndex = 0;
  int questionNumber;
  int questionTitle;
  var questionList = List<int>.generate(10, (index) => index);
  TimerController _timerController;
  bool optionAColourChange = false;
  bool optionBColourChange = false;
  bool optionCColourChange = false;
  bool optionDColourChange = false;
  var newButtonColour;
  int score = 0;
  _TriviaPageState(this.triviaData);

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
    questionNumber = questionList.elementAt(questionIndex) + 1;
    questionTitle = questionIndex + 1;

    void checkQuestionNumber() {
      setState(() {
        optionAColourChange = false;
        optionBColourChange = false;
        optionCColourChange = false;
        optionDColourChange = false;
        if (questionIndex < 9) {
          questionIndex++;
        } else {
          String scoreMessage;
          Navigator.pop(context);
          if (score == 1) {
            scoreMessage = 'You obtained 1 point. \nWould you like to play more solo trivia?';
          } else {
            scoreMessage = 'You obtained $score points.\nWould you like to play more solo trivia?';
          }
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text('Solo Trivia Results'),
              content: Text('$scoreMessage'),
              actions: [
                FlatButton(
                  child: Text('YES'),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => dbConnection()));
                  },
                ),
                FlatButton(
                  child: Text('NO'),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
                  }
                )
              ],
            )
          );
        }
      });
      _timerController.restart();
    }

    void checkAnswer(String choice) {
      setState(() {
        _timerController.pause();
        if (choice == "optionA") {
          optionAColourChange = true;
        } if (choice == "optionB") {
          optionBColourChange = true;
        } if (choice == "optionC") {
          optionCColourChange = true;
        } if (choice == "optionD") {
          optionDColourChange = true;
        }
        if (triviaData[1]['$questionNumber']['$choice'] == triviaData[2]['$questionNumber']) {
          newButtonColour = Colors.green[800];
          score++;
        } else {
          newButtonColour = Colors.red[600];
          score--;
        }
      });
      Future<void>.delayed(Duration(seconds: 1), () => checkQuestionNumber());
    }

    return Scaffold(
        backgroundColor: AppTheme.backgroundGray,
        appBar: AppBar(
          title: Text('Question $questionTitle of 10'),
          centerTitle: true,
        ),
        body: Center(
            child: Column(
                children: <Widget>[
                  Expanded(
                      child: Column(
                          children: <Widget>[
                            //TO DO: display user's actual dp and username
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
                          ]
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
                  // TO DO: deal with Qs that need text fields rather than choosing from 4 options
                  Expanded(
                      flex: 4,
                      child: Container(
                          child: Column(
                            // TO DO: make more effective by combining code for the different answer options
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(25),
                                  child: ButtonTheme(
                                    child: RaisedButton(
                                      onPressed: () {
                                        checkAnswer('optionA');
                                      },
                                      child: Text(
                                          triviaData[1]['$questionNumber']["optionA"],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18
                                          )
                                      ),
                                      color: optionAColourChange ? newButtonColour : Colors.grey[400],
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                    ),
                                    minWidth: 325,
                                    height: 50,
                                  )
                                ),
                                Padding(
                                  padding: EdgeInsets.all(25),
                                  child: ButtonTheme(
                                    child: RaisedButton(
                                      onPressed: () {
                                        checkAnswer('optionB');
                                      },
                                      child: Text(
                                          triviaData[1]['$questionNumber']["optionB"],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18
                                          )
                                      ),
                                      color: optionBColourChange ? newButtonColour : Colors.grey[400],
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                    ),
                                    minWidth: 325,
                                    height: 50,
                                  )
                                ),
                                Padding(
                                  padding: EdgeInsets.all(25),
                                  child: ButtonTheme(
                                    child: RaisedButton(
                                      onPressed: () {
                                        checkAnswer('optionC');
                                      },
                                      child: Text(
                                          triviaData[1]['$questionNumber']["optionC"],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18
                                          )
                                      ),
                                      color: optionCColourChange ? newButtonColour : Colors.grey[400],
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                    ),
                                    minWidth: 325,
                                    height: 50,
                                  )
                                ),
                                Padding(
                                  padding: EdgeInsets.all(25),
                                  child: ButtonTheme(
                                    child: RaisedButton(
                                      onPressed: () {
                                        checkAnswer('optionD');
                                      },
                                      child: Text(
                                          triviaData[1]['$questionNumber']["optionD"],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18
                                          )
                                      ),
                                      color: optionDColourChange ? newButtonColour : Colors.grey[400],
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                    ),
                                    minWidth: 325,
                                    height: 50
                                  )
                                ),
                              ]
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