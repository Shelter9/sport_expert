import 'package:flutter/material.dart';
import 'package:sport_expert/views/HomePage.dart';
import 'CalenderPage.dart';
import 'CreatePostPage.dart';
import 'GamePage.dart';
import 'MyPage.dart';
import 'PostDetailPage.dart';
import 'ShopPage.dart';


class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 3;

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
                        text: '热榜',
                      ),
                      Tab(
                        text: '推荐',
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
                HotListPage(), // 热榜页面
                PostRecommendationPage(), // 推荐页面
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
      ),
    );
  }
}


class HotListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        children: <Widget>[
          Container(
            // height: 100, // 设置横幅图片的高度
            child: Image.asset(
              'assets/images/jinrirebang.png', // 替换为你的横幅图片地址
              // fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20), // 添加上方横幅图片与下方列表的间距
          Column(
            children: <Widget>[
              InkWell(
                onTap: () {
                  // 在此处添加导航到指定课程页面的逻辑
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PostDetailPage()),
                  );
                },
                child: _buildHotListItem('1', '梅西转会迈阿密', '55.83w'),
              ),
              // _buildHotListItem('1', '梅西转会迈阿密', '55.83w'),
              _buildHotListItem('2', '欧冠决赛', '44.27w'),
              _buildHotListItem('3', '你是否支持哈登留在76人', '31.39w'),
              _buildHotListItem('4', 'WEG势不可挡2-0横扫LNG', '28.19w'),
              _buildHotListItem('5', '利物浦签下买麦卡利斯特', '26.87w'),
              _buildHotListItem('6', '贝林厄姆加盟皇马', '20.35w'),
              _buildHotListItem('7', '热火掘金G3预测', '16.70w'),
              _buildHotListItem('8', '本泽马加盟吉达联合', '14.28w'),
              _buildHotListItem('9', '盘点太阳老板的操作', '10.21w'),
              _buildHotListItem('10', '你看好乌兹的复出吗', '9.47w'),
              // 添加更多热搜条目
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHotListItem(String index, String title, String popularity) {
    final int indexNumber = int.parse(index);
    TextStyle indexTextStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: indexNumber <= 3 ? Colors.red : Colors.black54,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: <Widget>[
          Text(
            index,
            style: indexTextStyle,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(fontSize: 16),
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.local_fire_department_sharp,
                      color: Colors.orange,
                      size: 16,
                    ),
                    SizedBox(width: 4),
                    Text(
                      '热度：$popularity',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}



class PostRecommendationPage extends StatefulWidget {
  @override
  _PostRecommendationPageState createState() => _PostRecommendationPageState();
}

class _PostRecommendationPageState extends State<PostRecommendationPage> {
  List<Post> posts = [
    Post(
      userName: '云大官方资讯',
      publishTime: '2023-06-09',
      postTitle: '欧冠决赛巅峰夜，助威曼城抽球衣',
      postImages: ['ouguan.png', 'ouguan1.png','mancheng.png'],
      communityName: '足球话题区',
      likes: 46621,
      comments: 3005,
      shares: 1507,
    ),
    Post(
      userName: '云大官方资讯',
      publishTime: '2023-06-09',
      postTitle: '阿尔瓦雷斯：想成为阿奎罗本泽马苏亚雷斯那类型的前锋',
      postImages: ['aerwaleisi.png'],
      communityName: '足球话题区',
      likes: 46621,
      comments: 3005,
      shares: 1507,
    ),
    Post(
      userName: '云大官方资讯',
      publishTime: '2023-06-09',
      postTitle: '舒波-莫廷射门转化率高达42%，位于德甲球员之首',
      postImages: ['shubo.png', 'shubo1.png'],
      communityName: '足球话题区',
      likes: 46621,
      comments: 3005,
      shares: 1507,
    ),
    Post(
      userName: '云大官方资讯',
      publishTime: '2023-06-09',
      postTitle: '欧冠决赛后，国米将就卢卡库直接转会与切尔西谈判',
      postImages: ['lukaku.png', 'lukaku1.png'],
      communityName: '足球话题区',
      likes: 46621,
      comments: 3005,
      shares: 1507,
    ),
    Post(
      userName: '云大官方资讯',
      publishTime: '2023-06-09',
      postTitle: '麦卡利斯特：选择10号是因为喜欢，场上每个位置我都能打',
      postImages: ['mai.png', 'mai1.png','mai2.png'],
      communityName: '足球话题区',
      likes: 46621,
      comments: 3005,
      shares: 1507,
    ),
  ];

  void addPost(Post post) {
    setState(() {
      posts.add(post);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: List.generate(posts.length, (index) {
          final post = posts[index];
          return _buildPostItem(
            post.userName,
            post.publishTime,
            post.postTitle,
            post.postImages,
            post.communityName,
            post.likes,
            post.comments,
            post.shares,
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreatePostPage(onPostPublished: addPost)),
          );
        },
        backgroundColor: Color(0xFF816FFC),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildPostItem(
      String userName,
      String publishTime,
      String postTitle,
      List<String> postImages,
      String communityName,
      int likes,
      int comments,
      int shares,
      ) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/images/ynu.png'),
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    userName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    publishTime,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            postTitle,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(postImages.length, (index) {
                return Container(
                  width: 120,
                  height: 120,
                  margin: EdgeInsets.only(right: 8),
                  child: Image.asset(
                    'assets/images/${postImages[index]}',
                    fit: BoxFit.cover,
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                communityName,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: <Widget>[
                  _buildIconButton(Icons.thumb_up, likes),
                  SizedBox(width: 8),
                  _buildIconButton(Icons.comment, comments),
                  SizedBox(width: 8),
                  _buildIconButton(Icons.share, shares),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon, int count) {
    return Row(
      children: <Widget>[
        Icon(icon, size: 18),
        SizedBox(width: 4),
        Text(count.toString()),
      ],
    );
  }
}

class Post {
  final String userName;
  final String publishTime;
  final String postTitle;
  final List<String> postImages;
  final String communityName;
  final int likes;
  final int comments;
  final int shares;

  Post({
    required this.userName,
    required this.publishTime,
    required this.postTitle,
    required this.postImages,
    required this.communityName,
    required this.likes,
    required this.comments,
    required this.shares,
  });
}











