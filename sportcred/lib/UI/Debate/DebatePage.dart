import 'package:flutter/material.dart';
import 'package:sportcred/UI/Debate/DebateResponseWidget.dart';
import 'package:sportcred/models/global.dart';

class DebatePage extends StatefulWidget {
  final String question;

  DebatePage(this.question);

  @override
  _DebatePageState createState() => _DebatePageState(question);
}

class _DebatePageState extends State<DebatePage> {
  String question;
  TextEditingController responseEditingController = TextEditingController();
  bool responseSubmitted = false;
  bool visible = true;
  List<Widget> debateResponses = [
    DebateResponseWidget(
        username: 'stephenS',
        responseText: 'Absolutely not! This is a generic response. It allows me to see whether or not short to medium debate responses show up properly!'
    ),
    DebateResponseWidget(
        username: 'HighLord',
        responseText: 'Haha yes for sure! This is also a generic response. Given that the previous test worked, let me see if even longer responses show up properly! I wonder if the addition of this response will push the responses off the screen. Perhaps yes, perhaps no. We shall see!'
    ),
    DebateResponseWidget(
        username: 'redroselady',
        responseText: 'AHHHH! I do not know the first thing about basketball -sniffs- How unfortunate. The probability of this response being seen w/o scroll is very low! Fingers crossed that is the case'
    ),
  ];

  _DebatePageState(String question) {
    this.question = question;
  }

  Visibility getFloatingActionButton() {
    if (responseSubmitted) {
      visible = false;
    }
    return Visibility(
      visible: visible,
      child:FloatingActionButton(
         backgroundColor: AppTheme.sportGreen,
         child: Icon(Icons.add),
         onPressed: () => displayDebateBottomSheet(context),
      )
    );
  }

  void displayDebateBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 500,
          decoration: BoxDecoration(
            border: Border.all(color: AppTheme.sportGreen, width: 3),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "Please enter your debate response",
                  style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.w400
                  )
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                  child: TextField(
                    maxLines: null,
                    controller: responseEditingController,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.create)
                    )
                  ),
              ),
              RaisedButton(
                  child: Text('Submit'),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text('Submit analysis?'),
                          content: Text('You will not be able to edit your analysis at a later time.'),
                          actions: [
                            FlatButton(
                                child: Text('NO'),
                                onPressed: () {
                                  Navigator.pop(context);
                                }
                            ),
                            FlatButton(
                              child: Text('YES'),
                              onPressed: () {
                                responseSubmitted = true;
                                debateResponses.add(
                                    DebateResponseWidget(
                                        username: 'guy_fawkes',
                                        responseText: responseEditingController.text
                                    )
                                );
                                responseEditingController.clear();
                                setState(() {});
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                            )
                          ],
                        )
                    );
                  }
              )
            ]
          )
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundGray,
      body: Container(
        padding: EdgeInsets.only(top: 65.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Align(
                      child: Text(
                        question,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    )
                  ),
              )
            ),
            Expanded(
                flex: 6,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: debateResponses.length,
                    padding: EdgeInsets.all(10.0),
                    itemBuilder: (BuildContext context, int index) {
                      return debateResponses[index];
                    }
                )
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: getFloatingActionButton()
              )
            )
          ],
        ),
      ),
    );
  }
}
