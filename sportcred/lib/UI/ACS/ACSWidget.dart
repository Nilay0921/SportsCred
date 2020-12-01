import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sportcred/models/global.dart';
import 'package:sportcred/UI/ACS/ACSSection.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:sportcred/UI/ACS/HistoryPage.dart';

class ACSWidget extends StatelessWidget {

  double newACS = 200;
  double change;
  double triviaScore = 0;
  double debateScore = 0;
  double picksScore = 0;
  double participationScore = 0;
  List<String> history = [];

  double getACS() {
    return newACS;
  }

  List<String> getHistory() {
    return history;
  }

  double getTriviaScore(double change) {
    return triviaScore + change;
  }

  double getDebateScore(double change) {
    return debateScore + change;
  }

  double getPicksScore(double change) {
    return picksScore + change;
  }

  double getParticipationScore(double change) {
    return participationScore + change;
  }

  int getTriviaPercentage() {
    int triviaPercentage;
    if (newACS - 200 == 0 ) {
      triviaPercentage = 0;
    } else {
      //if keeping percentages as double, use: triviaPercentage = double.parse((debateScore/(newACS - 200) * 100).toStringAsFixed(1));
      triviaPercentage = (triviaScore/(newACS - 200) * 100).round();
    }
    return triviaPercentage;
  }

  int getDebatePercentage() {
    int debatePercentage;
    if (newACS - 200 == 0 ) {
      debatePercentage = 0;
    } else {
      debatePercentage = (debateScore/(newACS - 200) * 100).round();
    }
    return debatePercentage;
  }

  int getPicksPercentage() {
    int picksPercentage;
    if (newACS - 200 == 0 ) {
      picksPercentage = 0;
    } else {
      picksPercentage = (picksScore/(newACS - 200) * 100).round();
    }
    return picksPercentage;
  }

  int getParticipationPercentage() {
    int participationPercentage;
    if (newACS - 200 == 0 ) {
      participationPercentage = 0;
    } else {
      participationPercentage = (participationScore/(newACS - 200) * 100).round();
    }
    return participationPercentage;
  }

  void updateACS(String connection, double points) {
    if (connection == 'trivia') {
      change = 0.1 * points;
      triviaScore = getTriviaScore(change);
    } else if (connection == 'debate') {
      change = 0.3 * points;
      debateScore = getDebateScore(change);
    } else if (connection == 'picks') {
      change = 0.5 * points;
      picksScore = getPicksScore(change);
    } else if (connection == 'participation') {
      change = 0.1 * points;
      participationScore = getParticipationScore(change);
    }
    newACS+=change;
    history.insert(0, '$connection $change');
  }

@override
  Widget build(BuildContext context) {
  ACSWidget myACS = new ACSWidget();

  myACS.updateACS('trivia', 8);
  myACS.updateACS('debate', 15);
  myACS.updateACS('picks', -20);
  myACS.updateACS('participation', 25);
  myACS.updateACS('trivia', -2);
  myACS.updateACS('picks', 30);

    return Scaffold(
      backgroundColor: AppTheme.backgroundGray,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "ACS Breakdown",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontFamily: 'Lato',
            fontSize: 20
          ),
        ),
        actions: <Widget>[
            IconButton(
              icon: Icon(Icons.more_horiz),
              color: Colors.white,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ACSHistory(history: myACS.getHistory())));
              }
            )
          ]
      ),
      body: _getCustomizedRadialBarChart(myACS)
    );
  }

  ///Radial bar chart from Syncfusion
  SfCircularChart _getCustomizedRadialBarChart(ACSWidget myACS) {
    List<Color> colors = <Color>[
      Colors.green[100],
      Colors.green[300],
      Colors.green[600],
      Colors.green[900],
    ];
    return SfCircularChart(
      legend: Legend(
        isVisible: true,
        overflowMode: LegendItemOverflowMode.wrap,
        legendItemBuilder: (String name, dynamic series, dynamic point, int index) {
          return Container(
            height: 30,
            width: 325,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                      '${point.x}',
                      style: TextStyle(
                        color: colors[index],
                        fontSize: 18,
                        fontFamily: 'Lato',
                      )
                  ),
                  Text(
                      '${point.y}%',
                      style: TextStyle(
                        color: colors[index],
                        fontSize: 15,
                        fontFamily: 'Lato',
                      )
                  )
                ]
            )
          );
        },
      ),
      series: _getRadialBarCustomizedSeries(myACS), 
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
          radius: '0%',
          height: '90%',
          width: '90%',
          widget: CircleAvatar(
            backgroundImage: NetworkImage('https://cdn.vox-cdn.com/thumbor/7XTizfDBsdR0oSDhhGHyTAD5cSc=/11x0:628x411/1200x800/filters:focal(11x0:628x411)/cdn.vox-cdn.com/assets/945137/anonymous.jpg')
          ),
        ),
      ],
    );
  }

  List<RadialBarSeries<ACSSection, String>> _getRadialBarCustomizedSeries(ACSWidget myACS) {
    final List<ACSSection> chartData = <ACSSection>[
      ACSSection(
          title: 'Trivia',
          percentage: myACS.getTriviaPercentage(),
          text: '100%',
          pointColor: Colors.green[100]
      ),
      ACSSection(
          title: 'Picks and Predictions',
          percentage: myACS.getPicksPercentage(),
          text: '100%',
          pointColor: Colors.green[300]
      ),
      ACSSection(
          title: 'Analysis and Debates',
          percentage: myACS.getDebatePercentage(),
          text: '100%',
          pointColor: Colors.green[600]
      ),
      ACSSection(
          title: 'Participation and History',
          percentage: myACS.getParticipationPercentage(),
          text: '100%',
          pointColor: Colors.green[900]
      )
    ];
    return <RadialBarSeries<ACSSection, String>>[
      RadialBarSeries<ACSSection, String>(
        maximumValue: 100,
        gap: '10%',
        radius: '100%',
        dataSource: chartData,
        cornerStyle: CornerStyle.bothCurve,
        innerRadius: '50%',
        xValueMapper: (ACSSection data, _) => data.title,
        yValueMapper: (ACSSection data, _) => data.percentage,
        pointRadiusMapper: (ACSSection data, _) => data.text,
        pointColorMapper: (ACSSection data, _) => data.pointColor,
      ),
    ];
  }
}
