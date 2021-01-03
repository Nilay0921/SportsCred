import 'package:flutter/material.dart';
import 'package:sportcred/UI/Post/PostPage.dart';
import 'package:sportcred/models/global.dart';

class PostWidget extends StatefulWidget {
  final String title;
  final String desc;
  final String connection;
  final int upvotes;

  PostWidget(
    {Key key, this.title, this.desc, this.upvotes, this.connection}) : super(key: key);

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {  
  bool _toggled = false;

  void _onItemTapped(){
    setState(() {
      switch(_toggled) { 
        case true: { _toggled = false; } 
        break; 
        case false: { _toggled = true; } 
        break;
      } 
    });
  }
  
  @override
  Widget build(BuildContext context) {

    String title = widget.title;
    String desc = widget.desc;
    int upvotes = (_toggled == true) ? widget.upvotes + 1 : widget.upvotes;

    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => PostPage(
          username: "Anonymous",
          title: title,
          desc: desc,
        )));
      },
      child: Card(
        elevation: 0.0,
        color: Color(0x000000),
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                color: Colors.white,
                child: new Container(
                  width: 365.0,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0, top: 5.0, right: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        RichText(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          text: TextSpan(
                            style: AppTheme.postTitleText,
                            text: '$title'
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: RichText(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            text: TextSpan(
                                style: AppTheme.postDescText,
                                text: '$desc'
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 7.0, bottom: 10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: 4.0),
                                child : GestureDetector(
                                  onTap: _onItemTapped,
                                  child: Icon(
                                    Icons.arrow_circle_up_rounded,
                                    color: (_toggled == true) ? Colors.green : Colors.grey,
                                    size: 20.0
                                  ),
                                )
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 3.0, right: 2.0),
                                child: Text(
                                  upvotes.toString(),
                                  style: TextStyle(
                                    fontFamily: 'Lato',
                                    fontSize: 12.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400
                                  )
                                )
                              ),
                              /*
                              Icon(
                                Icons.arrow_downward,
                                color: Colors.grey,
                                size: 15.0
                              ),
                              */
                            ],
                          )
                        )
                      ],
                    ),
                  ),
                )
              )
            ],
          ),
        ),
      )
    );
  }
}