import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FootballMatchDetailPage extends StatefulWidget {
  @override
  _FootballMatchDetailPageState createState() => _FootballMatchDetailPageState();
}

class _FootballMatchDetailPageState extends State<FootballMatchDetailPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;
  List<String> _tabs = ['球员评分', '比赛统计'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildMatchScoreSection() {
    return Container(

      height: 200,
      // padding: EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/icon/bg.png'),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 16),
            // 比赛描述和比分
            Text(
              '英超第1轮',
              style: TextStyle(fontSize: 18,color: Colors.white),
            ),
            SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Column(
                  children: [
                    Image.asset('assets/icon/qierxi.webp', width: 60, height: 60),
                    SizedBox(height: 5),
                    Text(
                      '切尔西',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '已结束',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    // 比分
                    Text(
                      '2 : 1',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),

                Column(
                  children: [
                    Image.asset('assets/icon/laisitechen.webp', width: 60, height: 60),
                    SizedBox(height: 5),
                    Text(
                      '莱斯特城',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),

              ],
            ),
          ],
        ),
      ),

    );
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        body: Column(
          children: [
            // 比赛比分板块
            _buildMatchScoreSection(),
            // 标签栏
            TabBar(
              tabs: _tabs.map((tab) => Tab(text: tab)).toList(),
              controller: _tabController,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              labelColor: Colors.black,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 3.0, color: Color(0xFF816FFC)),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: PlayerRatingSection(),
                  ),
                  SingleChildScrollView(
                     child: _buildMatchStatsSection(),
                  ),
                ],
                controller: _tabController,
              ),
            ),
          ],
        ),
      ),
    );
  }

}

class Player {
  final String name;
  final String description;
  final String avatarPath;
  final double averageRating;
  double myRating;

  Player({required this.name, required this.description, required this.avatarPath,required this.averageRating, this.myRating = 0.0});
}

class PlayerRatingSection extends StatefulWidget {
  @override
  _PlayerRatingSectionState createState() => _PlayerRatingSectionState();
}

class _PlayerRatingSectionState extends State<PlayerRatingSection> {
  List<Player> players = [
    Player(name: '恩佐', description: '“表现五星”',averageRating: 8.7,avatarPath: 'assets/head/p1.png'),
    Player(name: '齐耶赫', description: '“超神”',averageRating: 9.7,avatarPath: 'assets/head/p2.png'),
    Player(name: '菲利克斯', description: '“牛的”',averageRating: 9.0,avatarPath: 'assets/head/p3.png'),
    Player(name: '坎特', description: '“一流”',averageRating: 9.5,avatarPath: 'assets/head/p4.png'),
    Player(name: '凯帕', description: '“门神”',averageRating: 9.9,avatarPath: 'assets/head/p5.png'),
    Player(name: '加拉格尔', description: '“糙汉”',averageRating: 7.7,avatarPath: 'assets/head/p6.png'),
    Player(name: '蒂亚戈·席尔瓦', description: '“猛男”',averageRating: 8.7,avatarPath: 'assets/head/p7.png'),
    Player(name: '哈弗茨', description: '“废柴”',averageRating: 5.7,avatarPath: 'assets/head/p8.png'),
    Player(name: '斯特林', description: '“吐饼侠”',averageRating: 6.5,avatarPath: 'assets/head/p9.png'),
    // Add more players as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Image.asset(
            'assets/icon/g1.jpg', // 图片路径
            fit: BoxFit.fill, // 图片高度
          ),
          // 添加球员评分列表
          ListView.builder(
            shrinkWrap: true,
            itemCount: players.length,
            itemBuilder: (context, index) {
              return PlayerRatingItem(player: players[index]);
            },
          ),
        ],
      ),
    );
  }
}

class PlayerRatingItem extends StatefulWidget {
  final Player player;

  PlayerRatingItem({required this.player});

  @override
  _PlayerRatingItemState createState() => _PlayerRatingItemState();
}

class _PlayerRatingItemState extends State<PlayerRatingItem> {
  double rating = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // 球员头像
              CircleAvatar(
                // Replace with your image source
                backgroundImage: AssetImage(widget.player.avatarPath),
              ),
              SizedBox(width: 8),
              // 球员名称和我的打分
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 球员名称
                    Text(
                      widget.player.name,
                      style: TextStyle(

                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 4),
                    // 我的打分
                    RatingBar.builder(
                      initialRating: rating,
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 24.0,
                      itemBuilder: (context, _) => Icon(
                        Icons.star_purple500_sharp,
                        color: Color(0xFF00A2B6),
                      ),
                      onRatingUpdate: (newRating) {
                        setState(() {
                          rating = newRating;
                          widget.player.myRating = newRating;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8),
              // 平均得分
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 平均得分
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${widget.player.averageRating.toStringAsFixed(1)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Color(0xFF00A2B6),
                        ),
                      ),
                      Text(
                        '1.7万人评分',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

            ],
          ),
          SizedBox(height: 8),
          // 球员描述
          Text(widget.player.description,style: TextStyle(color: Colors.grey),),
          SizedBox(height: 16),
        ],
      ),
    );


  }
}

Widget _buildMatchStatsSection() {
  return Container(
    padding: EdgeInsets.all(16),
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0), // 设置内边距值
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '8',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                '5',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),

        _buildStatRow('射正', 8, 5), // 两队分别为 8 和 5
        // 射偏
        Padding(
          padding: EdgeInsets.all(8.0), // 设置内边距值
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '3',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                '2',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        _buildStatRow('射偏', 3, 2), // 两队分别为 3 和 2
        // 角球
        Padding(
          padding: EdgeInsets.all(8.0), // 设置内边距值
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '6',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                '4',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        _buildStatRow('角球', 6, 4), // 两队分别为 6 和 4
        // 控球率
        Padding(
          padding: EdgeInsets.all(8.0), // 设置内边距值
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '65%',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                '35%',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        _buildStatRow('控球率', 6, 3), // 两队分别为 65 和 35
        // 进攻
        Padding(
          padding: EdgeInsets.all(8.0), // 设置内边距值
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '12',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                '10',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        _buildStatRow('进攻', 12, 10), // 两队分别为 12 和 10
        // 危险进攻
        Padding(
          padding: EdgeInsets.all(8.0), // 设置内边距值
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '6',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                '8',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        _buildStatRow('危险进攻', 6, 8), // 两队分别为 6 和 8
        // 黄牌
        Padding(
          padding: EdgeInsets.all(8.0), // 设置内边距值
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '2',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                '3',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        _buildStatRow('黄牌', 2, 3), // 两队分别为 2 和 3
        // 红牌
        Padding(
          padding: EdgeInsets.all(8.0), // 设置内边距值
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '0',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                '0',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        _buildStatRow('红牌', 0, 0), // 两队分别为 0 和 1
        // 点球
        Padding(
          padding: EdgeInsets.all(8.0), // 设置内边距值
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '0',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                '0',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        _buildStatRow('点球', 0, 0), // 两队分别为 1 和 0
      ],
    ),
  );
}

Widget _buildStatRow(String statName, int team1Value, int team2Value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [

      SizedBox(width: 10),
      Expanded(
        child: Row(
          children: [
            _buildProgressBar(team1Value),
            SizedBox(width: 10),
            Text(
              statName,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(width: 10),
            _buildProgressBar(team2Value),
          ],
        ),
      ),
    ],
  );
}

Widget _buildProgressBar(int value) {
  return Expanded(
    child: Stack(
      children: [
        Container(
          height: 12,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        FractionallySizedBox(
          widthFactor: value / 20, // 这里假设最大值为 20
          child: Container(
            height: 12,
            decoration: BoxDecoration(
              color: Color(0xFF816FFC),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
      ],
    ),
  );
}







