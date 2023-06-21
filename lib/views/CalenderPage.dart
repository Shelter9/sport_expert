import 'package:flutter/material.dart';
import 'package:sport_expert/views/CommunityPage.dart';
import 'package:sport_expert/views/GamePage.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'HomePage.dart';
import 'MyPage.dart';
import 'ShopPage.dart';

class SportCalendarPage extends StatefulWidget {
  @override
  _SportCalendarPageState createState() => _SportCalendarPageState();
}

class SportPerformance {
  final int calories;
  final Duration duration;
  final int steps;
  final String weather;
  final int T;
  final String desc;
  SportPerformance({required this.calories, required this.duration, required this.steps,required this.weather,required this.T,required this.desc});
}



class SportPerformanceWidget extends StatelessWidget {
  final DateTime selectedDay;
  final Map<DateTime, SportPerformance> sportData;

  SportPerformanceWidget({required this.selectedDay, required this.sportData});

  @override
  Widget build(BuildContext context) {
    DateTime compareDate = DateTime(selectedDay.year, selectedDay.month, selectedDay.day);
    final performance = sportData[compareDate];

    if (performance != null) {
      double stepsPercent = performance.steps / 20000; // 计算步数百分比
      double durationPercent = performance.duration.inMinutes / 60.0; // 计算时长百分比
      double caloriesPercent = performance.calories /200;
      return Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2.0,
              blurRadius: 4.0,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.wb_sunny_outlined, // 替换为适当的天气图标
                        size: 18,
                        color: Colors.black, // 根据需要设置图标的颜色
                      ),
                      SizedBox(width: 8), // 用于在图标和文本之间添加间距
                      Text(
                        '${performance.weather}',
                        style: TextStyle(
                          fontSize: 18,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 20),
                      Icon(
                        Icons.thermostat_auto, // 替换为适当的温度图标
                        size: 18,
                        color: Colors.black, // 根据需要设置图标的颜色
                      ),
                      SizedBox(width: 8), // 用于在图标和文本之间添加间距
                      Text(
                        '${performance.T}℃',
                        style: TextStyle(
                          fontSize: 18,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),

            Text(
              '${performance.desc}',
              style: TextStyle(
                fontSize: 18,
                // fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircularPercentIndicator(
                  radius: 80.0,
                  lineWidth: 10.0,
                  percent: caloriesPercent,
                  center: Text(
                    '${(caloriesPercent * 100).toStringAsFixed(0)}%',
                    style: TextStyle(fontSize: 16),
                  ),
                  progressColor: Color(0xFFFC6126),
                  backgroundColor: Color(0xFFFCDFD4),
                ),
                CircularPercentIndicator(
                  radius: 80.0,
                  lineWidth: 10.0,
                  percent: durationPercent,
                  center: Text(
                    '${(durationPercent * 100).toStringAsFixed(0)}%',
                    style: TextStyle(fontSize: 16),
                  ),
                  progressColor: Color(0xFFFDBD26),
                  backgroundColor: Color(0xFFFDF0D3),
                  // backgroundColor: Colors.grey[300],
                ),
                CircularPercentIndicator(
                  radius: 80.0,
                  lineWidth: 10.0,
                  percent: stepsPercent,
                  center: Text(
                    '${(stepsPercent * 100).toStringAsFixed(0)}%',
                    style: TextStyle(fontSize: 16),
                  ),
                  progressColor: Color(0xFF34D46E),
                  backgroundColor: Color(0xFFD6F6E1),
                  // backgroundColor: Colors.grey[300],
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.local_fire_department_rounded,
                          color: Color(0xFFFC6126),
                          // 设置icon的大小和颜色等属性
                        ),
                        Text(
                          '卡路里(千卡)',
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '${performance.calories}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          '/200',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.run_circle_outlined,
                          color: Color(0xFFFDBD26),
                          // 设置icon的大小和颜色等属性
                        ),
                        Text(
                          '步数(步)',
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '${performance.steps}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '/20000',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    )

                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.access_time_filled,
                          color: Color(0xFF34D46E),
                          // 设置icon的大小和颜色等属性
                        ),
                        Text(
                          '时长(分钟)',
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '${performance.duration.inMinutes}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '/60',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    )

                  ],
                ),

              ],
            )



          ],
        ),
      );
    } else {
      return Text(
        '这一天没有运动哦',
        style: TextStyle(fontSize: 18),
      );
    }
  }
}





class _SportCalendarPageState extends State<SportCalendarPage> {
  DateTime _selectedDay = DateTime.now(); // 选中的日期
  int _currentIndex = 1;
  // 运动数据（假设数据以Map的形式存储，键为日期，值为运动数据）
  Map<DateTime, SportPerformance> _sportData = {
    DateTime(2023, 6, 1): SportPerformance(calories: 100, duration: Duration(minutes: 30),steps:12022,weather: '晴天',T: 25,desc: '天气良好适合运动'),
    DateTime(2023, 6, 3): SportPerformance(calories: 150, duration: Duration(minutes: 45),steps:12302,weather: '晴天',T: 25,desc: '天气良好适合运动'),
    DateTime(2023, 6, 24): SportPerformance(calories: 120, duration: Duration(minutes: 35),steps:13022,weather: '晴天',T: 25,desc: '天气良好适合运动'),
    DateTime(2023, 6, 23): SportPerformance(calories: 100, duration: Duration(minutes: 23),steps:12007,weather: '晴天',T: 25,desc: '天气良好适合运动'),
    DateTime(2023, 6, 22): SportPerformance(calories: 120, duration: Duration(minutes: 35),steps:15642,weather: '晴天',T: 25,desc: '天气良好适合运动'),
    DateTime(2023, 6, 21): SportPerformance(calories: 90, duration: Duration(minutes: 44),steps:9547,weather: '晴天',T: 25,desc: '天气良好适合运动'),
    DateTime(2023, 6, 20): SportPerformance(calories: 135, duration: Duration(minutes: 60),steps:18034,weather: '晴天',T: 25,desc: '天气良好适合运动'),
    DateTime(2023, 6, 19): SportPerformance(calories: 120, duration: Duration(minutes: 35),steps:14522,weather: '晴天',T: 25,desc: '天气良好适合运动'),
  };

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now(); // 默认选中当前日期
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // 透明背景色
        automaticallyImplyLeading: false, // 去除返回键
        elevation: 0, // 去除阴影
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xFFEAE6FC), // 自定义颜色1
                Color(0xFFE3F1FC), // 自定义颜色2
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.share_outlined, color: Colors.black),
            onPressed: () {
              // 处理上传图标点击事件
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
              // 处理更多图标点击事件
            },
          ),
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // 处理搜索图标点击事件
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TableCalendar(
              // 日历的配置和样式
              firstDay: DateTime(2023, 1, 1),
              lastDay: DateTime(2023, 12, 31),
              focusedDay: _selectedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                });
              },
              // calendarFormat: CalendarFormat.twoWeeks,
              headerStyle: HeaderStyle(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                headerMargin: EdgeInsets.symmetric(vertical: 8),
              ),
            ),
            SizedBox(height: 15),
            SportPerformanceWidget(
              selectedDay: _selectedDay,
              sportData: _sportData,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Color(0xFF816FFC),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_sharp),
            label: '课程',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_sharp),
            label: '我的运动',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_soccer_rounded),
            label: '比赛',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: '社区',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: '运动购',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            label: '我的',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          }
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SportCalendarPage()),
            );
          }
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GamePage()),
            );
          }
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CommunityPage()),
            );
          }
          if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ShopPage()),
            );
          }
          if (index == 5) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyPage()),
            );
          }
        },
      ),
    );
  }
}
