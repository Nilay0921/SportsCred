import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PickWidget extends StatelessWidget {
  final String bracket;
  final bool selected1;
  final String name1;
  final String icon1;
  final bool selected2;
  final String name2;
  final String icon2;
  final VoidCallback onTap1;
  final VoidCallback onTap2;

  const PickWidget({this.bracket, this.selected1, this.name1, this.icon1, this.selected2, this.name2, this.icon2, this.onTap1, this.onTap2});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,
          color: Color.fromARGB(1, 81, 209, 109)
        ),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 40,
            width: 310,
            color: Colors.black45,
            child: Center(
              child: Text(
                "$bracket",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Lato',
                ),
              ),
            ),
          ),
          InkWell(
            onTap: onTap1,
            child: Container(
              height: 50,
              width: 300,
              child: Card(
                color: selected1? Colors.green : Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 2,
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("$icon1"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text("$name1", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: InkWell(
              onTap: onTap2,
              child: Container(
                height: 50,
                width: 300,
                child: Card(
                  color: selected2? Colors.green : Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 2,
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage("$icon2"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text("$name2", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
