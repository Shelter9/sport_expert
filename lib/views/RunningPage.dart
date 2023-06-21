import 'dart:async';

import 'package:flutter/material.dart';

import 'ExerciseResultPage.dart';

class RunningPage extends StatefulWidget {
  @override
  _RunningPageState createState() => _RunningPageState();
}

class _RunningPageState extends State<RunningPage> {
  bool isRunning = false;
  bool isFinished = false;
  int hours = 0;
  int minutes = 0;
  int seconds = 0;
  late String formattedTime;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    formattedTime = formatTime(hours, minutes, seconds);
  }

  void toggleRunning() {
    setState(() {
      if (!isRunning && !isFinished) {
        // 开始跑步
        isRunning = true;
        startTimer();
      } else if (isRunning) {
        // 暂停跑步
        isRunning = false;
        stopTimer();
      } else if (isFinished) {
        // 清零并重新开始跑步
        isFinished = false;
        hours = 0;
        minutes = 0;
        seconds = 0;
        formattedTime = formatTime(hours, minutes, seconds);
      }
    });
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        seconds++;
        if (seconds >= 60) {
          seconds = 0;
          minutes++;
        }
        if (minutes >= 60) {
          minutes = 0;
          hours++;
        }
        formattedTime = formatTime(hours, minutes, seconds);
      });
    });
  }

  void stopTimer() {
    timer.cancel();
  }

  void resetTimer() {
    timer.cancel();
    setState(() {
      isRunning = false;
      isFinished = true;
      hours = 0;
      minutes = 0;
      seconds = 0;
      formattedTime = formatTime(hours, minutes, seconds);
    });
  }

  String formatTime(int hours, int minutes, int seconds) {
    String hoursStr = hours.toString().padLeft(2, '0');
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');
    return '$hoursStr:$minutesStr:$secondsStr';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/map.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.3), // 设置透明的淡黑色背景
                      ),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        color: Colors.white, // 将颜色设置为白色
                        onPressed: () {
                          // 处理返回按钮点击事件
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16),

              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30), // Add left and right padding
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '0',
                          style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '米',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$formattedTime',
                              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '用时',
                              style: TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          ],
                        ),
                        SizedBox(width: 50),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '00"',
                              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
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
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '0',
                              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '卡路里',
                              style: TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: toggleRunning,
                    child: Ink(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF16C07E),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(
                          isRunning ? Icons.pause_rounded : Icons.play_arrow_rounded,
                          size: 48,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  if (!isRunning && !isFinished && formattedTime != '00:00:00')
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text('确定'),
                            content: Text('你确定要结束运动吗？'),
                            actions: [
                              TextButton(
                                child: Text(
                                  '继续运动',
                                  style: TextStyle(
                                    color: Color(0xFF816FFC),
                                  ),
                                ),

                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              TextButton(
                                child: Text(
                                  '结束运动',
                                  style: TextStyle(
                                    color: Color(0xFF816FFC),
                                  ),
                                ),
                                onPressed: () {

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ExerciseResultPage(
                                        // mapImage: 'assets/images/map.jpg',
                                        distance: 0, // Replace with the actual distance
                                        calories: 0, // Replace with the actual calories burned
                                        pace: '0’00”', // Replace with the actual pace
                                        duration: formattedTime, // Pass the current exercise duration
                                      ),
                                    ),
                                  );
                                  // resetTimer();
                                },
                              ),

                            ],
                          ),
                        );
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFFC5D53),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Icon(
                            Icons.stop_rounded,
                            size: 48,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                ],
              ),

            ],
          ),
        ),
      ),
    );

  }
}
