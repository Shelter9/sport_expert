import 'package:flutter/material.dart';
import 'package:sport_expert/views/CommunityPage.dart';
import 'package:sport_expert/views/MyPage.dart';
import 'CalenderPage.dart';
import 'CourseCategoryPage.dart';
import 'CoursePage.dart';
import 'GamePage.dart';


import 'RunningPage.dart';
import 'ShopPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void navigateToPage1(BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RunningPage()),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 顶部固定模块
            Container(
              height: 110.0, // 调整高度
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Stack(
                children: [
                  // 分类标签栏
                  Positioned(
                    top: 10,
                    left: 0,
                    right: MediaQuery.of(context).size.width * 0.1, // 使用屏幕宽度的一半作为宽度
                    child: TabBar(
                      controller: _tabController,
                      indicatorColor: Colors.black,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      isScrollable: true,
                      labelStyle: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      unselectedLabelStyle: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                      tabs: [
                        Tab(
                          text: '推荐',
                        ),
                        Tab(
                          text: '会员',
                        ),
                        Tab(
                          text: '活动',
                        ),
                      ],
                    ),
                  ),
                  // 搜索框
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 45.0, // 调整高度
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: '搜索',
                          hintStyle: TextStyle(color: Colors.grey), // 设置提示文字的颜色为浅灰色
                          prefixIcon: Padding(
                            padding: EdgeInsets.only(left: 8.0), // 调整左边距
                            child: Icon(Icons.search, color: Colors.grey), // 将搜索图标置于搜索框内部的最右侧
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: BorderSide(color: Colors.grey), // 设置边框颜色为浅灰色
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 10.0), // 设置垂直方向的内边距为10.0
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            // 可横向拖动的菜单模块
            Container(
              height: 70.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  MenuItem(
                    icon: Icons.directions_run,
                    title: '跑步',
                    backgroundColors: [
                      Color(0xFF31C38B).withOpacity(1),
                      Color(0xFF5FEBB5).withOpacity(1), // 渐变色起点
                       // 渐变色终点
                    ],
                    onTap: () => navigateToPage1(context),
                  ),
                  MenuItem(
                    icon: Icons.directions_walk,
                    title: '行走',
                    backgroundColors: [
                      Color(0xFF5D87F0).withOpacity(1),
                      Color(0xFF7DA0FC).withOpacity(1),
                    ],
                    onTap: () => navigateToPage1(context),
                  ),
                  MenuItem(
                    icon: Icons.fitness_center,
                    title: '全身燃脂',
                    backgroundColors: [
                      Color(0xFFF9525A).withOpacity(1),
                      Color(0xFFFB6B80).withOpacity(1),
                    ],
                    onTap: () => navigateToPage1(context),
                  ),
                  MenuItem(
                    icon: Icons.directions_bike,
                    title: '骑行',
                    backgroundColors: [
                      Color(0xFF6B51F1).withOpacity(1),
                      Color(0xFF816EFA).withOpacity(1),
                    ],
                    onTap: () => navigateToPage1(context),
                  ),
                  MenuItem(
                    icon: Icons.spa,
                    title: '瑜伽',
                    backgroundColors: [
                      Color(0xFFF9525A).withOpacity(1),
                      Color(0xFFFB6B80).withOpacity(1),
                    ],
                    onTap: () => navigateToPage1(context),
                  ),
                  MenuItem(
                    icon: Icons.snooze,
                    title: '助眠冥想',
                    backgroundColors: [
                      Color(0xFF6B51F1).withOpacity(1),
                      Color(0xFF816EFA).withOpacity(1),
                    ],
                    onTap: () => navigateToPage1(context),
                  ),
                ],
              ),
            ),
            // 新添加的资讯板块
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 2.3,
                physics: NeverScrollableScrollPhysics(), // Disable scrolling for GridView
                shrinkWrap: true,
                children: [
                  InkWell(
                    onTap: () {
                      // 在此处添加导航到指定课程页面的逻辑
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CourseCategoryPage()),
                      );
                    },
                    child:
                    InformationModule(
                      title: '全部课程',
                      description: '分类·排行·详解',
                      image: AssetImage('assets/images/img1.jpg'),
                    ),
                  ),

                  InformationModule(
                    title: '燃脂计划',
                    description: '7天冲刺全身燃脂',
                    image: AssetImage('assets/images/img4.jpg'),
                  ),
                  InformationModule(
                    title: '直播课',
                    description: '午间甩脂有氧操',
                    image: AssetImage('assets/images/img2.jpg'),
                  ),
                  InformationModule(
                    title: '六月赛事',
                    description: 'Biu快乐光波',
                    image: AssetImage('assets/images/img3.jpg'),
                  ),
                ],
              ),
            ),
            // 新添加的课程板块
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // SizedBox(height: 16.0),
                  GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 0.7,
                    children: [
                      InkWell(
                        onTap: () {
                          // 在此处添加导航到指定课程页面的逻辑
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CoursePage()),
                          );
                        },
                        child:CourseModule(
                            image: AssetImage('assets/images/course1.png'),
                            title: '腹部线条初显·HIIT暴汗瘦身腰腹强效系列',
                            description1: '官方精品',
                            description2: '“锁死这节课，腰围瘦了5cm了”',
                            userImage: AssetImage('assets/images/user.png'),
                            userName: '减脂塑性的keep君',
                          ),
                      ),
                      CourseModule(
                        image: AssetImage('assets/images/course2.png'),
                        title: '15分钟改善假胯宽/小腿外翻骨盆前倾',
                        description1: '官方精品',
                        description2: '“不夸张练完瑜伽垫都是汗水”',
                        // description3: '课程描述3',
                        userImage: AssetImage('assets/images/user.png'),
                        userName: '减脂塑性的keep君',
                      ),
                      CourseModule(
                        image: AssetImage('assets/images/course3.png'),
                        title: '徒手全身·肌肉凸显',
                        description1: '官方精品',
                        description2: '”练完肚子硬硬的“',
                        // description3: '课程描述3',
                        userImage: AssetImage('assets/images/user.png'),
                        userName: '减脂塑性的keep君',
                      ),
                      CourseModule(
                        image: AssetImage('assets/images/course5.png'),
                        title: '八段锦完整版·专家出品',
                        description1: '官方精品',
                        description2: '”坚持做完，哪儿哪儿都不疼了“',
                        // description3: '课程描述3',
                        userImage: AssetImage('assets/images/user.png'),
                        userName: '减脂塑性的keep君',
                      ),
                      CourseModule(
                        image: AssetImage('assets/images/course6.png'),
                        title: '5-9公里跑后拉伸',
                        description1: '官方精品',
                        description2: '”超级喜欢这门课，拉完很舒服“',
                        // description3: '课程描述3',
                        userImage: AssetImage('assets/images/user2.png'),
                        userName: '爱跑步的的keep君',
                      ),
                      CourseModule(
                        image: AssetImage('assets/images/course7.png'),
                        title: '4分钟加速瘦肚子·腹部速燃Tabata·霸气哥',
                        description1: '官方精品',
                        description2: '”可以练腹肌，一个星期肚子就小了“',
                        // description3: '课程描述3',
                        userImage: AssetImage('assets/images/user.png'),
                        userName: '减脂塑性的keep君',
                      ),
                      CourseModule(
                        image: AssetImage('assets/images/course8.png'),
                        title: '音乐减压跑·享受安静·田野蝉鸣',
                        description1: '官方精品',
                        description2: '”跟跑一点都不累，真的很解压“',
                        // description3: '课程描述3',
                        userImage: AssetImage('assets/images/user2.png'),
                        userName: '爱跑步的的keep君',
                      ),
                      CourseModule(
                        image: AssetImage('assets/images/course9.png'),
                        title: '手环·2公里心率燃脂跑',
                        description1: '官方精品',
                        description2: '”放松的手环跑“',
                        // description3: '课程描述3',
                        userImage: AssetImage('assets/images/user2.png'),
                        userName: '爱跑步的的keep君',
                      ),
                      // 添加更多的课程模块...
                    ],
                  ),
                ],
              ),
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
class InformationModule extends StatelessWidget {
  final String title;
  final String description;
  final AssetImage image;

  InformationModule({
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 6, // 60% width
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4, // 40% width
            child: Container(
              width: 50.0, // Adjust the width as needed
              height: 50.0, // Adjust the height as needed
              child: Image(image: image),
            ),
          ),
        ],
      ),
    );
  }
}
class CourseModule extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final String description1;
  final String description2;
  final ImageProvider userImage;
  final String userName;

  CourseModule({
    required this.image,
    required this.title,
    required this.description1,
    required this.description2,
    required this.userImage,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4.0, // 添加阴影效果
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
              child: Image(
                image: image,
                fit: BoxFit.cover,
                height: 120.0,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.0,
                      // fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.0),
                  Container(
                    padding: EdgeInsets.all(1.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.0), // 添加圆角
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xFF5A5162).withOpacity(1),
                          Color(0xFF7D7186).withOpacity(1),
                        ],
                      ),
                    ),
                    child: Text(
                      description1,
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),


                  Container(
                    padding: EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0), // 添加圆角边框
                      color: Color(0xFFE8F9F3), // 设置淡绿色背景颜色
                    ),
                    child: Text(
                      description2,
                      style: TextStyle(fontSize: 12.0, color: Color(0xFF3CB889)), // 设置深绿色字体颜色
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                ],
              ),
            ),
            Divider(
              color: Colors.grey,
              height: 1.0,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: userImage,
                    radius: 12.0,
                  ),
                  SizedBox(width: 4.0),
                  Text(
                    userName,
                    style: TextStyle(fontSize: 12.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<Color> backgroundColors;
  final VoidCallback onTap;

  MenuItem({
    required this.icon,
    required this.title,
    required this.backgroundColors,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      margin: EdgeInsets.only(left: 16.0),
      child: Column(
        children: [
          SizedBox(
            width: 68.0,
            child: InkWell(
              onTap: onTap,
              child: Container(
                height: 50.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: backgroundColors,
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                  ),
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Icon(icon, size: 40.0, color: Colors.white),
                ),
              ),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}