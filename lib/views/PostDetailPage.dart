import 'package:flutter/material.dart';

class PostDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          '云南大学',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            // 处理返回键的点击事件
            Navigator.pop(context);
          },
        ),
      ),


      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              // 发帖用户的头像
                              backgroundImage: AssetImage('assets/images/ynu.png'),
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              '云南大学',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // 处理关注按钮的点击事件
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Color(0xFF816FFC),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: BorderSide(
                                color: Color(0xFF816FFC),
                              ),
                            ),
                            elevation: 0.0,
                          ),
                          child: Text(
                            '关注',
                            style: TextStyle(
                              color: Color(0xFF816FFC),
                            ),
                          ),
                        ),


                      ],
                    ),
                  ),


                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '球王的下一站：迈阿密',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Image.asset(
                    'assets/head/meixi.jpg',
                    fit: BoxFit.cover,
                  ),

                  Text(
                    '面对年薪5亿欧和年薪5千万刀，梅西选择了后者。原因很简单，对于早已拥有几辈子都花不完的钱的梅西来说，金钱远不如快乐重要。能带给梅西快乐的，足球也只排第二位，家庭才是第一位的。常年在西方国家生活，要适应沙特的生活（伊斯兰文化、酷热的天气）是非常困难的。而美国是全球最自由的国家之一，也是教育最发达的国家，作为三个小男孩的父亲，梅西选择迈阿密是顺理成章的事情。',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '请输入评论',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.thumb_up),
                onPressed: () {
                  // 执行点赞操作
                },
              ),
              IconButton(
                icon: Icon(Icons.comment),
                onPressed: () {
                  // 执行评论操作
                },
              ),
              IconButton(
                icon: Icon(Icons.share),
                onPressed: () {
                  // 执行分享操作
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
