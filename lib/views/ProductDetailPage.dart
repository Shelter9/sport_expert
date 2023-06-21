import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 商品详情的现有代码
                Stack(
                  children: [
                    Container(
                      height: 412, // 调整图片板块的高度
                      child: PageView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          // 这里可以动态添加商品图片
                          Image.asset('assets/prod/p1.png'),
                          Image.asset('assets/prod/p2.png'),
                          Image.asset('assets/prod/p3.png'),
                          Image.asset('assets/prod/p4.png'),
                          Image.asset('assets/prod/p5.png'),
                        ],
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
                    Positioned(
                      top: 16,
                      right: 16,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(0.3), // 设置透明的淡黑色背景
                        ),
                        child: IconButton(
                          icon: Icon(Icons.share),
                          color: Colors.white, // 将颜色设置为白色
                          onPressed: () {
                            // 处理分享按钮点击事件
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween, // 将两个文本放置在最左边和最右边
                        children: [
                          Text(
                            '¥19', // 商品价格
                            style: TextStyle(fontSize: 24, color: Colors.redAccent),
                          ),
                          Text(
                            '月销 5399', // 月销量
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFFDECEE), // 设置背景颜色
                              borderRadius: BorderRadius.circular(5), // 设置圆角边框
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(1),
                              child: Text(
                                '满139减10', // 商品标签描述
                                style: TextStyle(fontSize: 14, color: Colors.redAccent),
                              ),
                            ),
                          ),
                          SizedBox(width: 8), // 添加一个间距
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFFDECEE), // 设置背景颜色
                              borderRadius: BorderRadius.circular(5), // 设置圆角边框
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(1),
                              child: Text(
                                '满400减50', // 商品标签描述
                                style: TextStyle(fontSize: 14, color: Colors.redAccent),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        '即食低脂牛肉（50克单包装）', // 商品名称
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '精选优质牛肉，低脂低糖高蛋白，保留纯正风味，大口吃肉好满足。', // 商品描述
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),

                    ],
                  ),
                ),
                Card(
                  elevation: 10, // 设置阴影
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // 设置圆角
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '活动',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(width: 8),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF816FFC), // 设置背景颜色
                                borderRadius: BorderRadius.circular(5), // 设置圆角边框
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(1), // 设置内边距
                                child: Text(
                                  '运动福利',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                '运动币兑换 ¥25 福利额外再省                      >',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '规格',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                '口味                                                                                      >',
                                style: TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '送至',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                '云南大学呈贡校区                                                              >',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '服务',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                '不支持起点无理由退换货·低脂肪·高蛋白                       >',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: Text(
                    '—— 图文详情 ——',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                // 图文详情的现有代码
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/prod/a1.png',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/prod/a2.png',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/prod/a3.png',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/prod/a4.png',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/prod/a5.png',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/prod/a6.png',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/prod/a7.png',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/prod/a8.png',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/prod/a9.png',
                        fit: BoxFit.cover,
                      ),

                      // 添加更多图片
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 50, // 设置底部栏的高度
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: Offset(0, -3), // 设置阴影的偏移量
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.chat_bubble_outline), // 使用客服图标
                    onPressed: () {
                      // 处理客服按钮点击事件
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.shopping_cart_outlined), // 使用客服图标
                    onPressed: () {
                      // 处理客服按钮点击事件
                    },
                  ),
                  // Column(
                  //   children: [
                  //     IconButton(
                  //       icon: Icon(Icons.chat_bubble_outline), // 使用客服图标
                  //       onPressed: () {
                  //         // 处理客服按钮点击事件
                  //       },
                  //     ),
                  //     // Text(
                  //     //   '客服',
                  //     //   style: TextStyle(fontSize: 14, color: Colors.grey),
                  //     // ),
                  //   ],
                  // ),
                  // Column(
                  //   children: [
                  //     IconButton(
                  //       icon: Icon(Icons.shopping_cart_outlined), // 使用客服图标
                  //       onPressed: () {
                  //         // 处理客服按钮点击事件
                  //       },
                  //     ),
                  //     // Text(
                  //     //   '购物车',
                  //     //   style: TextStyle(fontSize: 14, color: Colors.grey),
                  //     // ),
                  //   ],
                  // ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF574E5F), // 设置背景颜色
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50), // 设置圆角半径
                      ),
                    ),
                    child: Text('加入购物车'),
                  ),

                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF816FFC), // 设置背景颜色
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50), // 设置圆角半径
                      ),
                    ),
                    child: Text('立即购买'),
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


