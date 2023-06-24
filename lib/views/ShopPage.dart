import 'package:flutter/material.dart';

import 'CalenderPage.dart';
import 'CommunityPage.dart';
import 'CoursePage.dart';
import 'GamePage.dart';
import 'HomePage.dart';
import 'MyPage.dart';
import 'ProductDetailPage.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _buildSearchBar(),
          _buildSlider(),
          _buildMenu(),
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

  Widget _buildSearchBar() {
    return Container(
      padding: EdgeInsets.all(16),
      height: 70,
      child: TextField(
        textAlignVertical: TextAlignVertical.center, // 文字垂直居中
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          // hintText: '搜索商品',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
    );
  }


  Widget _buildSlider() {
    // 假设有三张轮播图
    List<String> sliderImages = [
      'lunbo1.jpg',
      'lunbo2.jpg',
      'lunbo3.jpg',
    ];

    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: sliderImages.length,
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/images/${sliderImages[index]}',
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }

  Widget _buildMenu() {
    List<MenuOption> menuOptions = [
      MenuOption('jiang.png', '运动奖品'),
      MenuOption('qixie.png', '家庭器械'),
      MenuOption('shouhuan.png', '身体数据'),
      MenuOption('dianzi.png', '运动装备'),
      MenuOption('huju.png', '运动护具'),
      MenuOption('shiping.jpg', '健康食品'),
      MenuOption('nvyi.png', '女子服饰'),
      MenuOption('nanyi.png', '男子服饰'),
      MenuOption('lian.png', '周边礼品'),
      MenuOption('gengduo.png', '全部分类'),
    ];

    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16),
          height: 240,
          child: Wrap(
            spacing: 19.8,
            runSpacing: 25,
            children: menuOptions.map((option) {
              return Column(
                children: <Widget>[
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image(
                        image: AssetImage('assets/images/${option.image}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 9),
                    child: Text(option.name),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
        Container(
          padding: EdgeInsets.all(12),
          height: 400,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 8),
                        height: 200,
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8), // 添加圆角效果
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10), // 添加圆角效果
                          child: Image.asset(
                            'assets/images/ad1.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 100,
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8), // 添加圆角效果
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(13), // 添加圆角效果
                          child: Image.asset(
                            'assets/images/ad2.jpg',
                            // fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(width: 16),
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(bottom: 8),
                        height: 100,
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8), // 添加圆角效果
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10), // 添加圆角效果
                          child: Image.asset(
                            'assets/images/ad3.jpg',
                            // fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(bottom: 8),
                        height: 100,
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8), // 添加圆角效果
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10), // 添加圆角效果
                          child: Image.asset(
                            'assets/images/ad4.jpg',
                            // fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 100,
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8), // 添加圆角效果
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(13), // 添加圆角效果
                          child: Image.asset(
                            'assets/images/ad5.jpg',
                            // fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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
                childAspectRatio: 0.67,
                children: [
                  InkWell(
                    onTap: () {
                      // 在此处添加导航到指定课程页面的逻辑
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProductDetailPage()),
                      );
                    },
                    child:ShopModule(
                          image: AssetImage('assets/images/shang1.png'),
                          title: '即食低脂牛油50g',
                          description1: '限时直降',
                          price: '¥19',
                          sales: '3w+',
                          description2: '运动专享',
                          ),
                    ),
                  ShopModule(
                    image: AssetImage('assets/images/shang2.png'),
                    title: '加宽加厚健身垫',
                    description1: '限时秒杀',
                    description2: '运动专享',
                    // description3: '课程描述3',
                    price: '¥84',
                    sales: '2w+',
                  ),
                  ShopModule(
                    image: AssetImage('assets/images/shang3.png'),
                    title: '智能运动手环 B4',
                    description1: '限时秒杀',
                    description2: '运动专享',
                    // description3: '课程描述3',
                    price: '¥259',
                    sales: '2w+',
                  ),
                  ShopModule(
                    image: AssetImage('assets/images/shang4.png'),
                    title: '智能运动手环 B3',
                    description1: '限时秒杀',
                    description2: '运动专享',
                    // description3: '课程描述3',
                    price: '¥199',
                    sales: '1w+',
                  ),
                  ShopModule(
                    image: AssetImage('assets/images/shang5.png'),
                    title: '男士训练垫',
                    description1: '限时秒杀',
                    description2: '运动福利',
                    // description3: '课程描述3',
                    price: '¥98',
                    sales: '1076',
                  ),
                  ShopModule(
                    image: AssetImage('assets/images/shang6.png'),
                    title: '凝胶掌垫健身手套',
                    description1: '限时秒杀',
                    description2: '运动专享',
                    // description3: '课程描述3',
                    price: '¥62.1',
                    sales: '751',
                  ),
                  ShopModule(
                    image: AssetImage('assets/images/shang7.png'),
                    title: '超薄可触控透气跑步臂包',
                    description1: '限时秒杀',
                    description2: '运动专享',
                    // description3: '课程描述3',
                    price: '¥44.1',
                    sales: '583',
                  ),
                  ShopModule(
                    image: AssetImage('assets/images/shang8.png'),
                    title: 'Onesize 无尺码瑜伽紧身裤',
                    description1: '限时秒杀',
                    description2: '运动专享',
                    // description3: '课程描述3',
                    price: '¥169.1',
                    sales: '740',
                  ),

                  // 添加更多的课程模块...
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }






}
class ShopModule extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final String description1;
  final String price;
  final String sales;
  final String description2;


  ShopModule({
    required this.image,
    required this.title,
    required this.description1,
    required this.price,
    required this.sales,
    required this.description2,


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
                fit: BoxFit.fill,
                height: 170.0,
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
                          Color(0xFFF5E7E7),
                          Color(0xFFF5E7E7)
                        ],
                      ),
                    ),
                    child: Text(
                      description1,
                      style: TextStyle(fontSize: 10.0, color: Color(0xFFFD656E)),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  Row(
                    children: <Widget>[
                      Text(
                        price,
                        style: TextStyle(
                          fontSize: 18, // 设置文本大小，可以根据需要调整大小
                          color: Color(0xFFFD666E), // 设置文本颜色为红色
                        ),
                      ),

                      SizedBox(width: 16), // 添加间距，可以根据需要调整宽度
                      Text(
                        '月销 $sales',
                        style: TextStyle(
                          fontSize: 10, // 设置文本大小，可以根据需要调整大小
                          color: Color(0xFFBCBCBC), // 设置文本颜色为红色
                        ),
                      ),
                    ],
                  ),



                  Container(
                    padding: EdgeInsets.all(1.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.0), // 添加圆角边框
                      color: Color(0xFF8571FC), // 设置淡绿色背景颜色
                    ),
                    child: Text(
                      description2,
                      style: TextStyle(fontSize: 12.0, color: Color(0xFFF7F1F1)), // 设置深绿色字体颜色
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
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
class MenuOption {
  final String image;
  final String name;

  MenuOption(this.image, this.name);
}
