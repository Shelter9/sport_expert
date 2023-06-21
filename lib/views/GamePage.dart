import 'package:flutter/material.dart';
import 'package:sport_expert/views/CommunityPage.dart';
import 'package:sport_expert/views/HomePage.dart';
import 'CalenderPage.dart';
import 'FootballMatchDetailPage.dart';
import 'MyPage.dart';

import 'ShopPage.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 2;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 58,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Stack(
              children: [
                Positioned(
                  top: 10,
                  left: 0,
                  right: MediaQuery.of(context).size.width * 0.1,
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
                        text: '足球',
                      ),
                      Tab(
                        text: '篮球',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // SizedBox(height: 10),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                FootballPage(), // 足球页面
                BasketballPage(), // 篮球页面
              ],
            ),
          ),
        ],
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
      ), // bottomNavigationBar...
    );
  }
}

class FootballPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        InkWell(
          onTap: () {
            // 在此处添加导航到指定课程页面的逻辑
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FootballMatchDetailPage()),
            );
          },
          child:MatchWidget(
            match: Match(
              time: '12:00',
              description: '英超第1轮',
              homeLogo: 'assets/icon/qierxi.webp',
              homeName: '切尔西',
              homeGoals: '2',
              awayLogo: 'assets/icon/laisitechen.webp',
              awayName: '莱斯特城',
              awayGoals: '1',
              status: '已结束',
            ),
          ),
        ),
        // 足球比赛模块1

        // 足球比赛模块2
        MatchWidget(
          match: Match(
            time: '14:30',
            description: '英超第1轮',
            homeLogo: 'assets/icon/liwupu.webp',
            homeName: '利物浦',
            homeGoals: '3',
            awayLogo: 'assets/icon/reci.webp',
            awayName: '热刺',
            awayGoals: '0',
            status: '已结束',
          ),
        ),
        MatchWidget(
          match: Match(
            time: '14:30',
            description: '英超第1轮',
            homeLogo: 'assets/icon/bulaidun.webp',
            homeName: '布莱顿',
            homeGoals: '1',
            awayLogo: 'assets/icon/manlian.webp',
            awayName: '曼联',
            awayGoals: '0',
            status: '已结束',
          ),
        ),
        MatchWidget(
          match: Match(
            time: '14:30',
            description: '英超第1轮',
            homeLogo: 'assets/icon/manchen.webp',
            homeName: '曼城',
            homeGoals: '4',
            awayLogo: 'assets/icon/asengna.webp',
            awayName: '阿森纳',
            awayGoals: '1',
            status: '已结束',
          ),
        ),
        MatchWidget(
          match: Match(
            time: '14:30',
            description: '英超第1轮',
            homeLogo: 'assets/icon/shuijinggong.webp',
            homeName: '水晶宫',
            homeGoals: '0',
            awayLogo: 'assets/icon/niukasier.webp',
            awayName: '纽卡斯尔联',
            awayGoals: '6',
            status: '已结束',
          ),
        ),
        MatchWidget(
          match: Match(
            time: '14:30',
            description: '英超第1轮',
            homeLogo: 'assets/icon/xihanmu.webp',
            homeName: '西汉姆联',
            homeGoals: '-',
            awayLogo: 'assets/icon/weila.webp',
            awayName: '维拉',
            awayGoals: '-',
            status: '未开始',
          ),
        ),
        MatchWidget(
          match: Match(
            time: '14:30',
            description: '英超第1轮',
            homeLogo: 'assets/icon/bulunte.webp',
            homeName: '布伦特福德',
            homeGoals: '-',
            awayLogo: 'assets/icon/langdui.webp',
            awayName: '狼队',
            awayGoals: '-',
            status: '未开始',
          ),
        ),
        MatchWidget(
          match: Match(
            time: '14:30',
            description: '英超第1轮',
            homeLogo: 'assets/icon/sengling.webp',
            homeName: '诺丁汉森林',
            homeGoals: '-',
            awayLogo: 'assets/icon/aifudun.webp',
            awayName: '狼队',
            awayGoals: '-',
            status: '未开始',
          ),
        ),
        // 添加更多足球比赛模块...
      ],
    );
  }
}

class BasketballPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // 篮球比赛模块1
        MatchWidget(
          match: Match(
            time: '15:00',
            description: '季后赛',
            homeLogo: 'assets/icon/rehuo.webp',
            homeName: '热火',
            homeGoals: '100',
            awayLogo: 'assets/icon/kaierte.webp',
            awayName: '凯尔特人',
            awayGoals: '98',
            status: '已结束',
          ),
        ),
        // 篮球比赛模块2
        MatchWidget(
          match: Match(
            time: '19:30',
            description: '季后赛',
            homeLogo: 'assets/icon/huren.webp',
            homeName: '湖人',
            homeGoals: '99',
            awayLogo: 'assets/icon/yongshi.webp',
            awayName: '勇士',
            awayGoals: '112',
            status: '已结束',
          ),
        ),
        MatchWidget(
          match: Match(
            time: '19:30',
            description: '季后赛',
            homeLogo: 'assets/icon/xionglu.webp',
            homeName: '雄鹿',
            homeGoals: '108',
            awayLogo: 'assets/icon/qishi.webp',
            awayName: '骑士',
            awayGoals: '98',
            status: '已结束',
          ),
        ),
        MatchWidget(
          match: Match(
            time: '19:30',
            description: '季后赛',
            homeLogo: 'assets/icon/laoying.webp',
            homeName: '老鹰',
            homeGoals: '110',
            awayLogo: 'assets/icon/feicheng.webp',
            awayName: '76人',
            awayGoals: '112',
            status: '已结束',
          ),
        ),
        MatchWidget(
          match: Match(
            time: '19:30',
            description: '季后赛',
            homeLogo: 'assets/icon/nikesi.webp',
            homeName: '尼克斯',
            homeGoals: '115',
            awayLogo: 'assets/icon/juejin.webp',
            awayName: '掘金',
            awayGoals: '123',
            status: '已结束',
          ),
        ),
        // 添加更多篮球比赛模块...
      ],
    );
  }
}

// MatchWidget 和 Match 类的代码与之前提供的示例代码保持不变

class Match {
  final String time;
  final String description;
  final String homeLogo;
  final String homeName;
  final String homeGoals;
  final String awayLogo;
  final String awayName;
  final String awayGoals;
  final String status;

  Match({
    required this.time,
    required this.description,
    required this.homeLogo,
    required this.homeName,
    required this.homeGoals,
    required this.awayLogo,
    required this.awayName,
    required this.awayGoals,
    required this.status,
  });
}

class MatchWidget extends StatelessWidget {
  final Match match;

  MatchWidget({required this.match});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(5),
          // margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      match.time,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      match.description,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          match.homeLogo,
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text('${match.homeName}'),
                        ),
                        Text('${match.homeGoals}'),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Image.asset(
                          match.awayLogo,
                          height: 30,
                          width: 30,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text('${match.awayName}'),
                        ),
                        Text('${match.awayGoals}'),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Text(
                      match.status,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12, // 修改字体大小为20
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
        Divider(
          color: Colors.black12,
          height: 0.5,
          thickness: 1,
        ),
      ],
    );
  }
}







