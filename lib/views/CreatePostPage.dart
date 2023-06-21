import 'package:flutter/material.dart';

import 'CommunityPage.dart';

class CreatePostPage extends StatefulWidget {
  final Function(Post) onPostPublished;

  CreatePostPage({required this.onPostPublished});

  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  String postTitle = '';
  List<String> postImages = [];
  String communityName = '';

  void _publishPost() {
    final post = Post(
      userName: '云南大学',
      publishTime: DateTime.now().toString(),
      postTitle: postTitle,
      postImages: postImages,
      communityName: communityName,
      likes: 0,
      comments: 0,
      shares: 0,
    );

    widget.onPostPublished(post);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF816FFC),
        title: Text('发布帖子'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView( // 添加SingleChildScrollView包裹Column
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: '发布的社区',
                ),
                onChanged: (value) {
                  setState(() {
                    communityName = value;
                  });
                },
              ),
              SizedBox(height: 12.0),
              TextField(
                maxLines: null,
                decoration: InputDecoration(
                  labelText: '分享你的心情、观点和经历...',
                  contentPadding: EdgeInsets.only(bottom: 120.0), // 增加上下内边距
                  alignLabelWithHint: true, // 将labelText位于输入框顶部
                ),
                onChanged: (value) {
                  setState(() {
                    postTitle = value;
                  });
                },
              ),



              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _publishPost,
                child: Text('发布'),
                style: ElevatedButton.styleFrom(
                  primary:  Color(0xFF816FFC), // 设置按钮背景颜色
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
