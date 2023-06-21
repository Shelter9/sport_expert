import 'package:flutter/material.dart';

import 'CalenderPage.dart';
import 'CommunityPage.dart';
import 'GamePage.dart';
import 'HomePage.dart';
import 'ShopPage.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF816FFC), // AppBar的背景色为紫色
        automaticallyImplyLeading: false, // 去除返回键
        leading: Icon(Icons.menu), // 在最左侧添加列表图标
        actions: [
          IconButton(
            onPressed: () {
              // 衣服图标点击事件
            },
            icon: Icon(Icons.palette), // 衣服图标
          ),
          IconButton(
            onPressed: () {
              // 添加图标点击事件
            },
            icon: Icon(Icons.add), // 添加图标
          ),
          IconButton(
            onPressed: () {
              // 信息图标点击事件
            },
            icon: Icon(Icons.message), // 信息图标
          ),
        ],
      ),
      body: Container(
        color: Color(0xFFF9F9F9), // 页面的背景色为紫色
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              UserInfoSection(),
              SizedBox(height: 8),
              ButtonSection(),
              SizedBox(height: 10),
              MenuSection(),
              SizedBox(height: 10),
              CourseSection(),
              SizedBox(height: 10),
              SportsDashboard(duration: '2,755', calories: '2,016', weight: '62.0', lastRecorded: '2',),
            ],
          ),
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


class UserInfoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    // 用户头像
                    backgroundImage: AssetImage('assets/images/ynu.png'),
                  ),
                  SizedBox(width: 16),
                ],
              ),
              SizedBox(height: 16),
              Text(
                '云南大学',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '男',
                    style: TextStyle(fontSize: 12,color: Colors.black54),
                  ),
                  SizedBox(width: 8),
                  Text(
                    '|',
                    style: TextStyle(fontSize: 12,color: Colors.black54),
                  ),
                  SizedBox(width: 8),
                  Text(
                    '云南省，昆明市',
                    style: TextStyle(fontSize: 12,color: Colors.black54),
                  ),
                  SizedBox(width: 8),
                  Text(
                    '|',
                    style: TextStyle(fontSize: 12,color: Colors.black54),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'IP 属地云南',
                    style: TextStyle(fontSize: 12,color: Colors.black54),
                  ),
                ],
              ),
            ],
          ),



          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              UserInfoStat(label: '关注', value: '100'),
              UserInfoStat(label: '粉丝', value: '200'),
              UserInfoStat(label: '获赞', value: '300'),
            ],
          ),
        ],
      ),
    );
  }
}

class UserInfoStat extends StatelessWidget {
  final String label;
  final String value;

  const UserInfoStat({Key? key, required this.label, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 30), // 增加label与label之间的间距，可以根据需要调整间距大小
          child: Text(
            value,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 30), // 增加label与label之间的间距，可以根据需要调整间距大小
          child: Text(
            label,
            style: TextStyle(fontSize: 14,color: Colors.black54),
          ),
        ),
      ],
    );
  }
}


class ButtonSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: OutlinedButton(
              onPressed: () {
                // 修改资料按钮点击事件
              },
              style: OutlinedButton.styleFrom(
                primary: Color(0xFF2DC68D),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                side: BorderSide(color: Color(0xFF2DC68D)),
                elevation: 0,
              ),
              child: Text('修改资料'),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            flex: 2,
            child: OutlinedButton(
              onPressed: () {
                // 添加好友按钮点击事件
              },
              style: OutlinedButton.styleFrom(
                primary: Color(0xFF2DC68D),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                side: BorderSide(color: Color(0xFF2DC68D)),
                elevation: 0,
              ),
              child: Text('添加好友'),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            flex: 1,
            child: OutlinedButton(
              onPressed: () {
                // 二维码按钮点击事件
              },
              style: OutlinedButton.styleFrom(
                primary: Color(0xFF2DC68D),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60),
                ),
                side: BorderSide(color: Color(0xFF2DC68D)),
                elevation: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.qr_code, size: 18), // 使用二维码图标
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



class MenuSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5, // 设置阴影
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // 设置圆角
      ),
      shadowColor: Color(0xFFF6F6F6),
      child: Container(
        height: 70, // 增大高度为60
        padding: EdgeInsets.symmetric(horizontal: 35),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildMenuItem(Icons.assignment_outlined, '我的订单'),
            _buildMenuItem(Icons.emoji_events_outlined, '我的活动'),
            _buildMenuItem(Icons.star_outline_outlined, '收藏和赞'),
            _buildMenuItem(Icons.backpack_outlined, '我的装备'),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          SizedBox(height: 4),
          Text(title),
        ],
      ),
    );

  }
}

class CourseSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5, // Adjust the elevation for the desired shadow intensity
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // Set the border radius
      ),
      shadowColor: Color(0xFFF6F6F6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              '我的课程',
              style: TextStyle(
                fontSize: 15,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 70,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: [
                CourseCard(
                  image: 'assets/course/xin.jpg',
                  description: '想练',
                ),
                CourseCard(
                  image: 'assets/course/c1.png',
                  description: '练过',
                ),
                CourseCard(
                  image: 'assets/course/c2.png',
                  description: '订阅',
                ),
                CourseCard(
                  image: 'assets/course/c3.png',
                  description: '计划',
                ),
                CourseCard(
                  image: 'assets/course/c4.png',
                  description: '更多',
                ),
                // 添加更多课程卡片...
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class CourseCard extends StatelessWidget {
  final String image;
  final String description;

  const CourseCard({
    Key? key,
    required this.image,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: EdgeInsets.only(right: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 4),
                Text(
                  '2个合集',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




class SportsDashboard extends StatelessWidget {
  final String duration;
  final String calories;
  final String weight;
  final String lastRecorded;

  SportsDashboard({
    required this.duration,
    required this.calories,
    required this.weight,
    required this.lastRecorded,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Card(
              elevation: 4, // Controls the shadow depth
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
              ),
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '总运动                           >',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        Text(
                          '$duration',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          ' 分钟',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '本周消耗 $calories 千卡',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Expanded(
            flex: 1,
            child: Card(
              elevation: 4, // Controls the shadow depth
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
              ),
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '体重                             >',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        Text(
                          '$weight',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          ' 公斤',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '上次记录: $lastRecorded 天前',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}














