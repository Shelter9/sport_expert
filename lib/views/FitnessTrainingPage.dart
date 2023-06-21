import 'package:flutter/material.dart';
import 'dart:async';

class FitnessTrainingPage extends StatefulWidget {
  @override
  _FitnessTrainingPageState createState() => _FitnessTrainingPageState();
}

class _FitnessTrainingPageState extends State<FitnessTrainingPage> {
  int count = 0;
  Timer? _timer;
  int _seconds = 0;
  List<Exercise> exercises = [
    Exercise(
      gifUrl: 'assets/gif/g1.gif',
      name: '侧卧举腿卷腹',
      requiredCount: 10,
      desc: '侧卧在瑜伽垫上，左手扶地，有手屈肘扶 耳；膝盖屈曲，双腿交叉放在瑜伽垫上'
    ),
    Exercise(
      gifUrl: 'assets/gif/g2.gif',
      name: '仰卧对角交替收膝',
      requiredCount: 15,
      desc: '卷腹起身时，将上身同时转向一侧，对侧手肘向该侧大腿靠近；至最高点后略作停顿，还原至起始位置'
    ),
    Exercise(
      gifUrl: 'assets/gif/g3.gif',
      name: '仰卧屈膝举腿',
      requiredCount: 15,
      desc: '仰卧在瑜伽垫上，双臂贴紧地面，双腿脚掌相对'
    ),
    Exercise(
      gifUrl: 'assets/gif/g4.gif',
      name: '反向卷腹',
      requiredCount: 15,
      desc: '双手放于臀部两侧，勾起脚尖，想象臀部与双腿是一个整体在运动'
    ),
    Exercise(
      gifUrl: 'assets/gif/g5.gif',
      name: '仰卧卷腹',
      requiredCount: 15,
      desc: '躺于垫上，手臂伸直放于头部两侧，脚底并拢，双腿打开，腹肌发力起身'
    ),
    Exercise(
      gifUrl: 'assets/gif/g6.gif',
      name: '平板支撑动作',
      requiredCount: 15,
      desc: '手肘朝脚的方向用力， 脚尖用力向前勾 起，与地面摩擦力对抗，小臂按紧地面'
    ),
    Exercise(
      gifUrl: 'assets/gif/g7.gif',
      name: '仰卧交替脚跟接触',
      requiredCount: 15,
      desc:'动作全程都保持腹部的紧绷感，交替摸脚时腹部两侧有灼烧感'
    ),
    Exercise(
      gifUrl: 'assets/gif/g8.gif',
      name: '仰卧核心卷腹',
      requiredCount: 15,
      desc: '卷腹起身时，将上身同时转向一侧，对侧手肘向该侧大腿靠近；至最高点后略作停顿，还原至起始位置'
    ),
    Exercise(
      gifUrl: 'assets/gif/g9.gif',
      name: '仰卧拉伸卷腹',
      requiredCount: 15,
      desc: '躺于垫上，手臂伸真放于头部两侧，脚底 并拢，双腿打开，腹肌发力起身'
    ),
    // Add more exercises as needed
  ];
  int currentExerciseIndex = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _seconds += 1;
        count =  count = _seconds ~/ 2;
      });
    });
  }

  void _pauseTimer() {
    if (_timer != null && !_timer!.isActive) {
      _startTimer();
    } else {
      _timer?.cancel();
    }
  }
  void _previousExercise() {
    if (currentExerciseIndex > 0) {
      setState(() {
        currentExerciseIndex--;
        count = 0;
        _seconds = 0;
      });
      _startTimer();
    }
  }


  void _nextExercise() {
    if (currentExerciseIndex < exercises.length - 1) {
      setState(() {
        currentExerciseIndex++;
        count = 0;
        _seconds = 0;
      });
      _startTimer();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.centerLeft,
            child: Text(
              '计时：$_seconds 秒',
              style: TextStyle(fontSize: 20,color: Colors.grey),
            ),
          ),
          Container(
            height: 200,
            width: double.infinity,
            child: Image.asset(
              exercises[currentExerciseIndex].gifUrl,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            alignment: Alignment.centerLeft,
            child: Text(
              '${exercises[currentExerciseIndex].requiredCount}',
              style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              Container(
                child: Container(
                  padding: EdgeInsets.all(16),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '$count / ${exercises[currentExerciseIndex].requiredCount}',
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                child: Container(
                  padding: EdgeInsets.all(16),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${exercises[currentExerciseIndex].name}',
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          Container(
            child: Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.centerLeft,
              child: Text(
                '动作要点',
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            child: Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.centerLeft,
              child: Text(
                '${exercises[currentExerciseIndex].desc}',
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),

        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _previousExercise, // New onPressed callback for the new button
            child: Icon(Icons.skip_previous_sharp),
          ),
          SizedBox(width: 16),
          FloatingActionButton(
            onPressed: _pauseTimer,
            child: _timer != null && _timer!.isActive
                ? Icon(Icons.pause)
                : Icon(Icons.play_arrow),
          ),
          SizedBox(width: 16),
          FloatingActionButton(
            onPressed: _nextExercise,
            child: Icon(Icons.skip_next),
          ),
        ],
      ),
    );
  }
}

class Exercise {
  final String gifUrl;
  final String name;
  final int requiredCount;
  final String desc;

  Exercise({
    required this.gifUrl,
    required this.name,
    required this.requiredCount,
    required this.desc,
  });
}

void main() {
  runApp(MaterialApp(
    home: FitnessTrainingPage(),
  ));
}
