import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportcred/UI/Picks/PickWidget.dart';
import 'package:sportcred/models/global.dart';

class PicksHistoryPage extends StatefulWidget {
  @override
  _PicksHistoryPageState createState() => _PicksHistoryPageState();
}

class _PicksHistoryPageState extends State<PicksHistoryPage> {
  List<bool> pickValue = new List.filled(30, false);
  String dropdownValue = 'NBA 2019-2020 Playoffs';

  @override
  Widget build(BuildContext context) {
    List<String> pickNames = [
      'Milwaukee',
      'Orlando',
      'Indiana',
      'Miami',
      'Boston',
      'Philadelphia',
      'Toronto',
      'Brooklyn',
      'LA Lakers',
      'Portland',
      'Houston',
      'Oklahoma City',
      'Denver',
      'Utah',
      'LA',
      'Dallas',
      'Empty',
      'Empty',
      'Empty',
      'Empty',
      'Empty',
      'Empty',
      'Empty',
      'Empty',
      'Empty',
      'Empty',
      'Empty',
      'Empty',
      'Empty',
      'Empty',
      'Empty',
    ];
    return Scaffold(
      backgroundColor: AppTheme.backgroundGray,
      appBar: AppBar(
        title: Text(
          "Pick History",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontFamily: 'Lato',
              fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: DropdownButton<String>(
                    dropdownColor: AppTheme.backgroundGray,
                    value: dropdownValue,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.white),
                      underline: Container(
                        height: 2,
                        color: AppTheme.sportGreen,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: <String>['NBA 2019-2020 Playoffs', 'NBA 2018-2019 Playoffs', 'NBA 2017-2018 Playoffs', 'NBA 2016-2017 Playoffs']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                  )
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: PickWidget(
                      bracket: "First Round A",
                      icon1: "assets/images/TorontoRaptors.jpg",
                      icon2: "assets/images/TorontoRaptors.jpg",
                      name1: pickNames[0],
                      name2: pickNames[1],
                      selected1: pickValue[0],
                      selected2: pickValue[1],
                      onTap1: () {
                        setState(() {
                          pickValue[0] = !pickValue[0];
                          if (pickValue[0] == true) pickValue[1] = false;
                        });
                      },
                      onTap2: () {
                        setState(() {
                          pickValue[1] = !pickValue[1];
                          if (pickValue[1] == true) pickValue[0] = false;
                        });
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: PickWidget(
                      bracket: "First Round B",
                      icon1: "assets/images/TorontoRaptors.jpg",
                      icon2: "assets/images/TorontoRaptors.jpg",
                      name1: pickNames[2],
                      name2: pickNames[3],
                      selected1: pickValue[2],
                      selected2: pickValue[3],
                      onTap1: () {
                        setState(() {
                          pickValue[2] = !pickValue[2];
                          if (pickValue[2] == true) pickValue[3] = false;
                        });
                      },
                      onTap2: () {
                        setState(() {
                          pickValue[3] = !pickValue[3];
                          if (pickValue[3] == true) pickValue[2] = false;
                        });
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: PickWidget(
                      bracket: "First Round C",
                      icon1: "assets/images/TorontoRaptors.jpg",
                      icon2: "assets/images/TorontoRaptors.jpg",
                      name1: pickNames[4],
                      name2: pickNames[5],
                      selected1: pickValue[4],
                      selected2: pickValue[5],
                      onTap1: () {
                        setState(() {
                          pickValue[4] = !pickValue[4];
                          if (pickValue[4] == true) pickValue[5] = false;
                        });
                      },
                      onTap2: () {
                        setState(() {
                          pickValue[5] = !pickValue[5];
                          if (pickValue[5] == true) pickValue[4] = false;
                        });
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: PickWidget(
                      bracket: "First Round D",
                      icon1: "assets/images/TorontoRaptors.jpg",
                      icon2: "assets/images/TorontoRaptors.jpg",
                      name1: pickNames[6],
                      name2: pickNames[7],
                      selected1: pickValue[6],
                      selected2: pickValue[7],
                      onTap1: () {
                        setState(() {
                          pickValue[6] = !pickValue[6];
                          if (pickValue[6] == true) pickValue[7] = false;
                        });
                      },
                      onTap2: () {
                        setState(() {
                          pickValue[7] = !pickValue[7];
                          if (pickValue[7] == true) pickValue[6] = false;
                        });
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: PickWidget(
                      bracket: "First Round E",
                      icon1: "assets/images/TorontoRaptors.jpg",
                      icon2: "assets/images/TorontoRaptors.jpg",
                      name1: pickNames[8],
                      name2: pickNames[9],
                      selected1: pickValue[8],
                      selected2: pickValue[9],
                      onTap1: () {
                        setState(() {
                          pickValue[8] = !pickValue[8];
                          if (pickValue[8] == true) pickValue[9] = false;
                        });
                      },
                      onTap2: () {
                        setState(() {
                          pickValue[9] = !pickValue[9];
                          if (pickValue[9] == true) pickValue[8] = false;
                        });
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: PickWidget(
                      bracket: "First Round F",
                      icon1: "assets/images/TorontoRaptors.jpg",
                      icon2: "assets/images/TorontoRaptors.jpg",
                      name1: pickNames[10],
                      name2: pickNames[11],
                      selected1: pickValue[10],
                      selected2: pickValue[11],
                      onTap1: () {
                        setState(() {
                          pickValue[10] = !pickValue[10];
                          if (pickValue[10] == true) pickValue[11] = false;
                        });
                      },
                      onTap2: () {
                        setState(() {
                          pickValue[11] = !pickValue[11];
                          if (pickValue[11] == true) pickValue[10] = false;
                        });
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: PickWidget(
                      bracket: "First Round G",
                      icon1: "assets/images/TorontoRaptors.jpg",
                      icon2: "assets/images/TorontoRaptors.jpg",
                      name1: pickNames[12],
                      name2: pickNames[13],
                      selected1: pickValue[12],
                      selected2: pickValue[13],
                      onTap1: () {
                        setState(() {
                          pickValue[12] = !pickValue[12];
                          if (pickValue[12] == true) pickValue[13] = false;
                        });
                      },
                      onTap2: () {
                        setState(() {
                          pickValue[13] = !pickValue[13];
                          if (pickValue[13] == true) pickValue[12] = false;
                        });
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: PickWidget(
                      bracket: "First Round H",
                      icon1: "assets/images/TorontoRaptors.jpg",
                      icon2: "assets/images/TorontoRaptors.jpg",
                      name1: pickNames[14],
                      name2: pickNames[15],
                      selected1: pickValue[14],
                      selected2: pickValue[15],
                      onTap1: () {
                        setState(() {
                          pickValue[14] = !pickValue[14];
                          if (pickValue[14] == true) pickValue[15] = false;
                        });
                      },
                      onTap2: () {
                        setState(() {
                          pickValue[15] = !pickValue[15];
                          if (pickValue[15] == true) pickValue[14] = false;
                        });
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: PickWidget(
                      bracket: "Conf. Semi Finals A",
                      icon1: "assets/images/TorontoRaptors.jpg",
                      icon2: "assets/images/TorontoRaptors.jpg",
                      name1: (() {
                        if (pickValue[0]) {
                          pickNames[16] = pickNames[0];
                          return pickNames[0];
                        } else if (pickValue[1]) {
                          pickNames[16] = pickNames[1];
                          return pickNames[1];
                        } else {return "Empty";}
                      }()),
                      name2: (() {
                        if (pickValue[2]) {
                          pickNames[17] = pickNames[2];
                          return pickNames[2];
                        } else if (pickValue[3]) {
                          pickNames[17] = pickNames[3];
                          return pickNames[3];
                        } else {return "Empty";}
                      }()),
                      selected1: pickValue[16],
                      selected2: pickValue[17],
                      onTap1: () {
                        setState(() {
                          pickValue[16] = !pickValue[16];
                          if (pickValue[16] == true) pickValue[17] = false;
                        });
                      },
                      onTap2: () {
                        setState(() {
                          pickValue[17] = !pickValue[17];
                          if (pickValue[17] == true) pickValue[16] = false;
                        });
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: PickWidget(
                      bracket: "Conf. Semi Finals B",
                      icon1: "assets/images/TorontoRaptors.jpg",
                      icon2: "assets/images/TorontoRaptors.jpg",
                      name1: (() {
                        if (pickValue[4]) {
                          pickNames[18] = pickNames[4];
                          return pickNames[4];
                        } else if (pickValue[5]) {
                          pickNames[18] = pickNames[5];
                          return pickNames[5];
                        } else {return "Empty";}
                      }()),
                      name2: (() {
                        if (pickValue[6]) {
                          pickNames[19] = pickNames[6];
                          return pickNames[6];
                        } else if (pickValue[7]) {
                          pickNames[19] = pickNames[7];
                          return pickNames[7];
                        } else {return "Empty";}
                      }()),
                      selected1: pickValue[18],
                      selected2: pickValue[19],
                      onTap1: () {
                        setState(() {
                          pickValue[18] = !pickValue[18];
                          if (pickValue[18] == true) pickValue[19] = false;
                        });
                      },
                      onTap2: () {
                        setState(() {
                          pickValue[19] = !pickValue[19];
                          if (pickValue[19] == true) pickValue[18] = false;
                        });
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: PickWidget(
                      bracket: "Conf. Semi Finals C",
                      icon1: "assets/images/TorontoRaptors.jpg",
                      icon2: "assets/images/TorontoRaptors.jpg",
                      name1: (() {
                        if (pickValue[8]) {
                          pickNames[20] = pickNames[8];
                          return pickNames[8];
                        } else if (pickValue[9]) {
                          pickNames[20] = pickNames[9];
                          return pickNames[9];
                        } else {return "Empty";}
                      }()),
                      name2: (() {
                        if (pickValue[10]) {
                          pickNames[21] = pickNames[10];
                          return pickNames[10];
                        } else if (pickValue[11]) {
                          pickNames[21] = pickNames[11];
                          return pickNames[11];
                        } else {return "Empty";}
                      }()),
                      selected1: pickValue[20],
                      selected2: pickValue[21],
                      onTap1: () {
                        setState(() {
                          pickValue[20] = !pickValue[20];
                          if (pickValue[20] == true) pickValue[21] = false;
                        });
                      },
                      onTap2: () {
                        setState(() {
                          pickValue[21] = !pickValue[21];
                          if (pickValue[21] == true) pickValue[20] = false;
                        });
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: PickWidget(
                      bracket: "Conf. Semi Finals D",
                      icon1: "assets/images/TorontoRaptors.jpg",
                      icon2: "assets/images/TorontoRaptors.jpg",
                      name1: (() {
                        if (pickValue[12]) {
                          pickNames[22] = pickNames[12];
                          return pickNames[12];
                        } else if (pickValue[13]) {
                          pickNames[22] = pickNames[13];
                          return pickNames[13];
                        } else {return "Empty";}
                      }()),
                      name2: (() {
                        if (pickValue[14]) {
                          pickNames[23] = pickNames[14];
                          return pickNames[14];
                        } else if (pickValue[15]) {
                          pickNames[23] = pickNames[15];
                          return pickNames[15];
                        } else {return "Empty";}
                      }()),
                      selected1: pickValue[22],
                      selected2: pickValue[23],
                      onTap1: () {
                        setState(() {
                          pickValue[22] = !pickValue[22];
                          if (pickValue[22] == true) pickValue[23] = false;
                        });
                      },
                      onTap2: () {
                        setState(() {
                          pickValue[23] = !pickValue[23];
                          if (pickValue[23] == true) pickValue[22] = false;
                        });
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: PickWidget(
                      bracket: "Conf. Finals A",
                      icon1: "assets/images/TorontoRaptors.jpg",
                      icon2: "assets/images/TorontoRaptors.jpg",
                      name1: (() {
                        if (pickValue[16]) {
                          pickNames[24] = pickNames[16];
                          return pickNames[16];
                        } else if (pickValue[17]) {
                          pickNames[24] = pickNames[17];
                          return pickNames[17];
                        } else {return "Empty";}
                      }()),
                      name2: (() {
                        if (pickValue[18]) {
                          pickNames[25] = pickNames[18];
                          return pickNames[18];
                        } else if (pickValue[19]) {
                          pickNames[25] = pickNames[19];
                          return pickNames[19];
                        } else {return "Empty";}
                      }()),
                      selected1: pickValue[24],
                      selected2: pickValue[25],
                      onTap1: () {
                        setState(() {
                          pickValue[24] = !pickValue[24];
                          if (pickValue[24] == true) pickValue[25] = false;
                        });
                      },
                      onTap2: () {
                        setState(() {
                          pickValue[25] = !pickValue[25];
                          if (pickValue[25] == true) pickValue[24] = false;
                        });
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: PickWidget(
                      bracket: "Conf. Finals B",
                      icon1: "assets/images/TorontoRaptors.jpg",
                      icon2: "assets/images/TorontoRaptors.jpg",
                      name1: (() {
                        if (pickValue[20]) {
                          pickNames[26] = pickNames[20];
                          return pickNames[20];
                        } else if (pickValue[21]) {
                          pickNames[26] = pickNames[21];
                          return pickNames[21];
                        } else {return "Empty";}
                      }()),
                      name2: (() {
                        if (pickValue[22]) {
                          pickNames[27] = pickNames[22];
                          return pickNames[22];
                        } else if (pickValue[23]) {
                          pickNames[27] = pickNames[23];
                          return pickNames[23];
                        } else {return "Empty";}
                      }()),
                      selected1: pickValue[26],
                      selected2: pickValue[27],
                      onTap1: () {
                        setState(() {
                          pickValue[26] = !pickValue[26];
                          if (pickValue[26] == true) pickValue[27] = false;
                        });
                      },
                      onTap2: () {
                        setState(() {
                          pickValue[27] = !pickValue[27];
                          if (pickValue[27] == true) pickValue[26] = false;
                        });
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: PickWidget(
                      bracket: "Finals",
                      icon1: "assets/images/TorontoRaptors.jpg",
                      icon2: "assets/images/TorontoRaptors.jpg",
                      name1: (() {
                        if (pickValue[24]) {
                          return pickNames[24];
                        } else if (pickValue[25]) {
                          return pickNames[25];
                        } else {return "Empty";}
                      }()),
                      name2: (() {
                        if (pickValue[26]) {
                          return pickNames[26];
                        } else if (pickValue[27]) {
                          return pickNames[27];
                        } else {return "Empty";}
                      }()),
                      selected1: pickValue[28],
                      selected2: pickValue[29],
                      onTap1: () {
                        setState(() {
                          pickValue[28] = !pickValue[28];
                          if (pickValue[28] == true) pickValue[29] = false;
                        });
                      },
                      onTap2: () {
                        setState(() {
                          pickValue[29] = !pickValue[29];
                          if (pickValue[29] == true) pickValue[28] = false;
                        });
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
