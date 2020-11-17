import 'package:flutter/material.dart';
import 'package:sportcred/UI/Post/CommentWidget.dart';
import 'package:sportcred/models/global.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  String postUsername = "Firstname Lastname";
  String postTitle =
      "A very long statement that actually is super long. Consider applying a flex factor to force the children";
  String postDescription =
      "Lots of text also belongs here because I think I should put a good number of characters to test how my app deals with it otherwise I'm sad";
  String dropdownValue = "Top";

 _PostPageState({this.postUsername, this.postTitle, this.postDescription}) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundGray,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 80.0, left: 20.0, right: 20.0),
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
                          Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text(
                              postUsername,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: Text(
                        postTitle,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text(
                        postDescription,
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
                              color: Colors.red,
                            ),
                            onPressed: null),
                        Text(
                          "1234",
                          style: TextStyle(fontSize: 12),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.arrow_downward_rounded,
                            color: Colors.blue,
                          ),
                          onPressed: null
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
                comment: "Long Statements are nice, and I'm testing whether long statements look good as a comment.",
                score: "279",
              ),
               CommentWidget(
                username: "Brian Li",
                comment: "This page is scrollable.",
                score: "111",
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: TextField(
                  obscureText: false,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
            ],
          ),
        ),
      ),
    );
  }
}
