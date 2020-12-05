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
  List<String> triviaHistory = [];
  List<String> debateHistory = [];
  List<String> picksHistory = [];
  List<String> participationHistory = [];

  double getACS() {
    return newACS;
  }

  List<String> getTriviaHistory() {
    return triviaHistory;
  }

  List<String> getDebateHistory() {
    return debateHistory;
  }

  List<String> getPicksHistory() {
    return picksHistory;
  }

  List<String> getParticipationHistory() {
    return participationHistory;
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
      triviaHistory.insert(0, '$change');
    } else if (connection == 'debate') {
      change = 0.3 * points;
      debateScore = getDebateScore(change);
      debateHistory.insert(0, '$change');
    } else if (connection == 'picks') {
      change = 0.5 * points;
      picksScore = getPicksScore(change);
      picksHistory.insert(0, '$change');
    } else if (connection == 'participation') {
      change = 0.1 * points;
      participationScore = getParticipationScore(change);
      participationHistory.insert(0, '$change');
    }
    newACS+=change;
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

  OutlinedButton historyButton(String activity) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
          ),
        ),
        onPressed: () {
          List<String> history;
          if (activity == 'Trivia History') {
            history = myACS.getTriviaHistory();
          } else if (activity == 'Debate History') {
            history = myACS.getDebateHistory();
          } else if (activity == 'Picks History') {
            history = myACS.getPicksHistory();
          } else if (activity == 'Participation History') {
            history = myACS.getParticipationHistory();
          }
          Navigator.push(context, MaterialPageRoute(builder: (context) => ACSHistory(activityTitle: activity, history: history)));
        },
        child: Text(
          activity,
          style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 15.0,
              color: Colors.white,
              fontWeight: FontWeight.w300
          )
        )
    );
  }

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
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child:_getACSChart(myACS),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: GridView.count(
                //physics: NeverScrollableScrollPhysics(),
                childAspectRatio: 3,
                crossAxisCount: 2,
                mainAxisSpacing: 15.0,
                crossAxisSpacing: 15.0,
                children: [
                  historyButton('Trivia History'),
                  historyButton('Picks History'),
                  historyButton('Debate History'),
                  historyButton('Participation History'),
                ],
              )
            )
          )
        ]
      )
    );
  }

  ///Doughnut chart from Syncfusion
  SfCircularChart _getACSChart(ACSWidget myACS) {
    List<Color> colors = <Color>[
      Colors.green[100],
      Colors.green[300],
      Colors.green[600],
      Colors.green[900],
    ];
    return SfCircularChart(
      title: ChartTitle(
        text: 'A.C.S: ${myACS.newACS.round()}',
        textStyle: TextStyle(
            fontFamily: 'Lato',
            fontSize: 18.0,
            fontStyle: FontStyle.italic,
            color: Colors.white,
            fontWeight: FontWeight.w600
        )
      ),
      legend: Legend(
        isVisible: true,
        overflowMode: LegendItemOverflowMode.wrap,
        position: LegendPosition.bottom,
        legendItemBuilder: (String name, dynamic series, dynamic point, int index) {
          return Container(
              alignment: Alignment.center,
              height: 30,
              width: 300,
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
        }
      ),
      annotations: <CircularChartAnnotation>[
        CircularChartAnnotation(
          radius: '0%',
          height: '100%',
          width: '100%',
          widget: CircleAvatar(
              backgroundImage: NetworkImage('https://cdn.vox-cdn.com/thumbor/7XTizfDBsdR0oSDhhGHyTAD5cSc=/11x0:628x411/1200x800/filters:focal(11x0:628x411)/cdn.vox-cdn.com/assets/945137/anonymous.jpg')
            ),
        ),
      ],
      series: _getACSSeries(myACS)
    );
  }

  List<DoughnutSeries<ACSSection, String>> _getACSSeries(ACSWidget myACS) {
    final List<ACSSection> chartData = <ACSSection>[
      ACSSection(
          title: 'Trivia',
          percentage: myACS.getTriviaPercentage(),
          score: myACS.triviaScore.toStringAsFixed(1),
          pointColor: Colors.green[100]
      ),
      ACSSection(
          title: 'Picks and Predictions',
          percentage: myACS.getPicksPercentage(),
          score: myACS.picksScore.toStringAsFixed(1),
          pointColor: Colors.green[300]
      ),
      ACSSection(
          title: 'Analyses/Debates',
          percentage: myACS.getDebatePercentage(),
          score: myACS.debateScore.toStringAsFixed(1),
          pointColor: Colors.green[600]
      ),
      ACSSection(
          title: 'Participation',
          percentage: myACS.getParticipationPercentage(),
          score: myACS.participationScore.toStringAsFixed(1),
          pointColor: Colors.green[900]
      )
    ];
    return <DoughnutSeries<ACSSection, String>>[
      DoughnutSeries<ACSSection,String>(
        radius: '100%',
        dataSource: chartData,
        xValueMapper: (ACSSection data, _) => data.title,
        yValueMapper: (ACSSection data, _) => data.percentage,
        dataLabelMapper: (ACSSection data, _) => data.score,
        pointColorMapper: (ACSSection data, _) => data.pointColor,
        dataLabelSettings: DataLabelSettings(
          isVisible: true,
          textStyle: TextStyle(
            fontSize: 18,
            fontFamily: 'Lato',
          )
        )
      )
    ];
  }
}
