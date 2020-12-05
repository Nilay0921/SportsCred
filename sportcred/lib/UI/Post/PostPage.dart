import 'package:flutter/material.dart';
import 'package:sportcred/UI/Post/CommentWidget.dart';
import 'package:sportcred/models/global.dart';

class PostPage extends StatefulWidget {
  final String username;
  final String title;
  final String desc;

  PostPage({this.username, this.title, this.desc});

  @override
  _PostPageState createState() => _PostPageState(username, title, desc);
}

class _PostPageState extends State<PostPage> {
  String username;
  String title;
  String desc;
  String dropdownValue = "Top";

  _PostPageState(String username, String title, String desc) {
    this.username = username;
    this.title = title;
    this.desc = desc;
  }

  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  List<Widget> comments = [
    CommentWidget(
      username: "William Lee",
      comment: "This is what I think in response to this post!",
      score: "999",
    ),
    CommentWidget(
      username: "Sameeer Khan",
      comment: "Wow!",
      score: "482",
    ),
    CommentWidget(
      username: "Nick Sam",
      comment:
          "Long Statements are nice, and I'm testing whether long statements look good as a comment.",
      score: "279",
    ),
    CommentWidget(
      username: "Brian Li",
      comment: "This page is scrollable.",
      score: "111",
    ),
  ];

  addComment(String comment) {
    setState(() {
      comments.add(new CommentWidget(
        username: "Sameer Khan",
        comment: comment,
        score: "0",
      ));
    });
  }

  List<CommentWidget> getComments() {
    return comments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundGray,
      body: Container(
        padding: EdgeInsets.only(top: 80.0, left: 20.0, right: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/empty user.png"),
                            radius: 20,
                          ),
                          Align(
                            child: Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Text(
                                username,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: Text(
                        "$title",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text(
                        "$desc",
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.arrow_upward_rounded,
                            ),
                            onPressed: null),
                        Text(
                          "1234",
                          style: TextStyle(fontSize: 12),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.arrow_downward_rounded,
                          ),
                          onPressed: null,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Comments",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: 80,
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                          dropdownColor: Colors.black,
                          items: <String>[
                            'Top',
                            'New',
                          ].map((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: new Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: comments,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: 230,
                      child: TextField(
                        controller: myController,
                        obscureText: false,
                        style: TextStyle(color: Colors.white, fontSize: 15),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          labelText: 'Add Comment',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          isDense: true,
                        ),
                      ),
                    ),
                    Container(
                      height: 35,
                      width: 52,
                      child: RaisedButton(
                        color: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        onPressed: () {
                          addComment(myController.text);
                          myController.text = "";
                        },
                        padding: EdgeInsets.all(0),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 7.0, horizontal: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            gradient: LinearGradient(
                              colors: <Color>[
                                Color(0xff228B22),
                                Color(0xff2EB62C),
                                Color(0xff83D475)
                              ],
                            ),
                          ),
                          child: const Text(
                            'Add',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
