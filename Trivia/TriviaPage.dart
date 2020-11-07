import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:math';
import 'package:simple_timer/simple_timer.dart';

class dbConnection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // temp, TO DO: connect to BE
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString("assets/trivia.json"),
      builder: (context, snapshot) {
        List triviaData = json.decode(snapshot.data.toString());
        if (triviaData != null) {
          return TriviaPage(triviaData : triviaData);
        }
        },
    );
  }
}

class TriviaPage extends StatefulWidget {
  var triviaData;
  TriviaPage({Key key, this.triviaData}) : super(key: key);
  @override
  _TriviaPageState createState() => _TriviaPageState(triviaData);
}

class _TriviaPageState extends State<TriviaPage> with SingleTickerProviderStateMixin {
  var triviaData;
  var randomQuestionNumber;
  // From pub.dev
  TimerController _timerController;
  _TriviaPageState(this.triviaData);

  @override
  void initState() {
    _timerController = TimerController(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var randomQuestionNumber = new Random().nextInt(9) + 1;
    print(randomQuestionNumber);
    return Scaffold(
        appBar: AppBar(
          title: Text("Trivia"),
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
                                padding: EdgeInsets.only(top: 15),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(
                                      'https://cdn.vox-cdn.com/thumbor/7XTizfDBsdR0oSDhhGHyTAD5cSc=/11x0:628x411/1200x800/filters:focal(11x0:628x411)/cdn.vox-cdn.com/assets/945137/anonymous.jpg'),
                                )
                            ),
                            Text(
                              'guy_fawkes',
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w800,
                              ),
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
                              triviaData[0]['$randomQuestionNumber'],
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
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(25),
                                  child: MaterialButton(
                                    onPressed: () {
                                      /* TO DO: For all onPressed, change colour indicating correct/incorrect answer, then proceed to next question
                                      Create getter(s)/setter(s), and verify responses
                                      if (triviaData[1]['$randomQuestionNumber']["optionA"] == triviaData[2]['$randomQuestionNumber']) {
                                      }
                                      */
                                    },
                                    child: Text(
                                        triviaData[1]['$randomQuestionNumber']["optionA"],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18
                                        )),
                                    color: Colors.grey[400],
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10)),
                                    minWidth: 300,
                                    height: 50,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(25),
                                  child: MaterialButton(
                                    onPressed: () {
                                      /*
                                      if (triviaData[1]['$randomQuestionNumber']["optionB"] == triviaData[2]['$randomQuestionNumber']) {
                                      }

                                       */
                                    },
                                    child: Text(
                                        triviaData[1]['$randomQuestionNumber']["optionB"],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18
                                        )),
                                    color: Colors.grey[400],
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10)),
                                    minWidth: 300,
                                    height: 50,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(25),
                                  child: MaterialButton(
                                    onPressed: () {
                                      /*
                                      if (triviaData[1]['$randomQuestionNumber']["optionC"] == triviaData[2]['$randomQuestionNumber']) {
                                      }

                                       */
                                    },
                                    child: Text(
                                        triviaData[1]['$randomQuestionNumber']["optionC"],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18
                                        )),
                                    color: Colors.grey[400],
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10)),
                                    minWidth: 300,
                                    height: 50,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(25),
                                  child: MaterialButton(
                                    onPressed: () {
                                      /*
                                      if (triviaData[1]['$randomQuestionNumber']["optionD"] == triviaData[2]['$randomQuestionNumber']) {
                                      }
                                       */
                                    },
                                    child: Text(
                                        triviaData[1]['$randomQuestionNumber']["optionD"],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18
                                        )),
                                    color: Colors.grey[400],
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10)),
                                    minWidth: 300,
                                    height: 50,
                                  ),
                                ),
                              ]
                          )
                      )
                  ),
                  Expanded(
                      child: Container(
                        child: SimpleTimer(
                            controller: _timerController,
                            status: TimerStatus.start,
                            duration: Duration(seconds: 14)
                        )
                      )
                  )
                ]
            )
        )
    );
  }
}