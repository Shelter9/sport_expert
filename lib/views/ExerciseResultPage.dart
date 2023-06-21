import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ExerciseResultPage extends StatelessWidget {
  final double distance;
  final double calories;
  final String pace;
  final String duration;
  List<HeartRateData> heartRateData = [
    HeartRateData(0, 70),
    HeartRateData(1, 75),
    HeartRateData(2, 80),
    HeartRateData(3, 75),
    HeartRateData(4, 70),
    HeartRateData(5, 72),
    HeartRateData(6, 66),
    HeartRateData(7, 80),
    // 添加更多的数据点...
  ];

  ExerciseResultPage({
    required this.distance,
    required this.calories,
    required this.pace,
    required this.duration,
  });

  List<charts.Series<HeartRateData, int>> _createSeriesData() {
    return [
      charts.Series<HeartRateData, int>(
        id: 'HeartRate',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (HeartRateData data, _) => data.time,
        measureFn: (HeartRateData data, _) => data.heartRate,
        data: heartRateData,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/map1.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.3),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.popUntil(context, ModalRoute.withName('/'));
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${distance.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '公里',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$duration',
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '时长',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${calories.toStringAsFixed(0)}',
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '卡路里',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '$pace',
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '配速',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    SizedBox(width: 8),
                    Text(
                      '心率',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),

              Container(
                height: 200,
                padding: EdgeInsets.all(16),
                child: charts.LineChart(
                  _createSeriesData(),
                  animate: true,
                  domainAxis: charts.NumericAxisSpec(
                    tickProviderSpec: charts.BasicNumericTickProviderSpec(
                      desiredTickCount: 5,
                    ),
                  ),
                  primaryMeasureAxis: charts.NumericAxisSpec(
                    tickProviderSpec: charts.BasicNumericTickProviderSpec(
                      desiredTickCount: 5,
                    ),
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

class HeartRateData {
  final int time;
  final int heartRate;

  HeartRateData(this.time, this.heartRate);
}
