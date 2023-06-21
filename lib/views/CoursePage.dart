import 'package:flutter/material.dart';

import 'FitnessTrainingPage.dart';

class CoursePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 课程图片
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/course1.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                      onPressed: () {
                        // 返回操作
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.share),
                          color: Colors.white,
                          onPressed: () {
                            // 分享操作
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.more_vert),
                          color: Colors.white,
                          onPressed: () {
                            // 更多操作
                          },
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      // color: Colors.black54,
                      child: Row(
                        children: [
                          Icon(
                            Icons.camera_outlined,
                            color: Colors.white,
                            size: 18,
                          ),
                          SizedBox(width: 8),
                          Text(
                            '腹肌塑造 · 经典系列  >',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),

                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),
            // 标签
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF595061),
                          Color(0xFF7D7186),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.all(4), // 设置内边距
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.diamond_rounded,
                          color: Color(0xFFE9C587),
                          size: 11,
                        ),
                        SizedBox(width: 5),
                        Text(
                          '会员',
                          style: TextStyle(
                            color: Color(0xFFE9C587),
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 6),

                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF8272FD),
                          Color(0xFF9E95FD),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.all(4), // 设置内边距
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.video_collection_sharp,
                          color: Color(0xFFFFFFFF),
                          size: 11,
                        ),
                        SizedBox(width: 5),
                        Text(
                          '系列课',
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 6),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFE8F9F3),
                          Color(0xFFE8F9F3),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.all(4), // 设置内边距
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '无深蹲',
                          style: TextStyle(
                            color: Color(0xFF2AC289),
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 6),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFE8F9F3),
                          Color(0xFFE8F9F3),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.all(4), // 设置内边距
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '低噪音',
                          style: TextStyle(
                            color: Color(0xFF2AC289),
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            // 课程标题和收藏图标
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '腹肌塑造 · 腹肌训练入门',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // 点击收藏的操作
                    },
                    icon: Icon(Icons.star_border_rounded),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            // 描述1和练习人数
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    'K1',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(width: 2),
                  Text(
                    '零基础',
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  SizedBox(width: 6),
                  Text(
                    '12',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(width: 2),
                  Text(
                    '分钟',
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      '9259.7万人次练过',
                      textAlign: TextAlign.right, // 设置文本右对齐
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                  ),
                ],
              ),

            ),
            SizedBox(height: 8),
            // 描述2
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '经典腹肌系列课入门必练课，10 个基础训练动作，3 组循环，全面掌握上、下、侧腹的基础动作模式。',
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
            ),
            SizedBox(height: 16),

            Container(

              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(

                color: Color(0xFFE1F6F0),
                borderRadius: BorderRadius.circular(20),
                // boxShadow: [
                //   BoxShadow(
                //     color: Color(0xFFEAF9F4).withOpacity(0.3),
                //     spreadRadius: 2,
                //     blurRadius: 5,
                //     offset: Offset(0, 2),
                //   ),
                // ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '预估消耗',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(width: 2),
                          Text(
                            '(千卡)',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),

                          ),
                        ],
                      ),

                      SizedBox(height: 8),
                      Text(
                        '38 - 56',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16),
                  Row(
                    children: [
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '平均心率',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                              ),
                              SizedBox(width: 2),
                              Text(
                                '(次/分)',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),

                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(
                            '120 bpm',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(width: 80),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.watch_rounded,
                        color: Color(0xFF4CD9A2),
                      ),
                      SizedBox(width: 8),
                      Text(
                        '绑定手环',
                        style: TextStyle(fontSize: 16,color: Color(0xFF24C589)),
                      ),
                    ],
                  ),

                ],
              ),
            ),

        Container(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildCourseTip(
                icon: Icons.fitness_center,
                title: '器械',
                description: '无',
              ),
              _buildCourseTip(
                icon: Icons.calendar_today,
                title: '练习频次',
                description: '不限',
              ),
              _buildCourseTip(
                icon: Icons.accessibility,
                title: '辅助装备',
                description: '健身弹力带',
              ),
            ],
          ),
        ),
            // SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Course price
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '¥99.00',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFFE9C587),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '连续包月首月 >',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),


                  // "开始练习" button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FitnessTrainingPage()),
                      );
                    },

                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF4CD9A2)), // 设置背景颜色
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0), // 设置圆角半径
                        ),
                      ),
                    ),
                    child: Text('开通会员免费练'),
                  ),


                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
Widget _buildCourseTip({required IconData icon, required String title, required String description}) {
  return Container(
    width: 150,
    margin: EdgeInsets.all(8),
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Color(0xFFDCD9D9),
      borderRadius: BorderRadius.circular(8),

    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20,
              // color: Colors.blue,
            ),
            SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        SizedBox(height: 4),
        Text(
          description,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
          textAlign: TextAlign.start,
        ),
      ],
    ),
  );
}
