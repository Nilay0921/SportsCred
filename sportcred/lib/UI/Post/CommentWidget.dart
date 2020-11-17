import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentWidget extends StatelessWidget {
  final String username;
  final String comment;
  final String score;

  const CommentWidget({this.username, this.comment, this.score});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/empty user.png"),
                  radius: 12,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    username,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(35, 0, 10, 0),
              child: Text(
                comment,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 100, 0),
                child: TextButton(
                  onPressed: null, 
                  child: Text(
                    "Load replies...",
                  style: TextStyle(color: Colors.blue, fontSize: 13),
                  ),
                ),
              ),
              IconButton(
              icon: Icon(
                Icons.arrow_upward_rounded,
                size: 20,
              ),
              onPressed: null),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(score),
              ),
            ],
          )
        ],
      ),
    );
  }
}
