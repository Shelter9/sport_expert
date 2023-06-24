import 'package:flutter/material.dart';

class CourseCategoryPage extends StatefulWidget {
  @override
  _CourseCategoryPageState createState() => _CourseCategoryPageState();
}

class _CourseCategoryPageState extends State<CourseCategoryPage> {
  // 当前选中的分类索引
  int _selectedIndex = 0;

  // 分类列表
  List<String> _categories = [
    '全部课程',
    '会员课',
    '户外跑步',
    '热身放松',
    'HIT训练',
    '跳绳燃脂',
    '健身操',
    '瑜伽',
    '健康改善',
    '助眠冥想',
    '单车燃脂',
    '球类训练',
  ];

  // 课程列表
  Map<String, List<Course?>> _courseMap = {
    '全部课程': [
      Course(
        '腹部线条初显·HIIT暴汗',
        'assets/images/course1.png',
        '2小时',
        100,
      ),
      Course(
        '15分钟改善假胯宽',
        'assets/images/course2.png',
        '1小时',
        80,
      ),
      Course(
        '徒手全身·肌肉凸显',
        'assets/images/course3.png',
        '3小时',
        120,
      ),
      Course(
        '手环·2公里心率燃脂跑',
        'assets/images/course9.png',
        '2小时',
        90,
      ),
      Course(
        '音乐减压跑·享受安静',
        'assets/images/course8.png',
        '1.5小时',
        60,
      ),
      Course(
        '5-9公里跑后拉伸',
        'assets/images/course6.png',
        '1小时',
        50,
      ),
      Course(
        '4分钟加速瘦肚子',
        'assets/images/course7.png',
        '1.5小时',
        60,
      ),
      Course(
        '八段锦完整版·专家出品',
        'assets/images/course5.png',
        '1小时',
        50,
      ),
      // 其他课程...
    ],
    '会员课': [
      Course(
        '徒手全身·肌肉凸显',
        'assets/images/course3.png',
        '3小时',
        120,
      ),
      Course(
        '手环·2公里心率燃脂跑',
        'assets/images/course9.png',
        '2小时',
        90,
      ),
      // 其他课程...
    ],
    '户外跑步': [
      Course(
        '音乐减压跑·享受安静',
        'assets/images/course8.png',
        '1.5小时',
        60,
      ),
      Course(
        '5-9公里跑后拉伸',
        'assets/images/course6.png',
        '1小时',
        50,
      ),
      // 其他课程...
    ],
    '热身放松': [
      Course(
        '4分钟加速瘦肚子',
        'assets/images/course7.png',
        '1.5小时',
        60,
      ),
      Course(
        '八段锦完整版·专家出品',
        'assets/images/course5.png',
        '1小时',
        50,
      ),
      // 其他课程...
    ],
    'HIT训练': [
      Course(
        '腹部线条初显·HIIT暴汗',
        'assets/images/course1.png',
        '2小时',
        100,
      ),
      Course(
        '15分钟改善假胯宽',
        'assets/images/course2.png',
        '1小时',
        80,
      ),
      // 其他课程...
    ],
    // 其他分类的课程列表...
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          '课程分类',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),

      body: Row(
        children: [
          // 侧边栏
          Container(
            width: 100.0,
            color: Colors.grey[200],
            child: ListView.builder(
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    _categories[index],
                    style: TextStyle(
                      fontWeight: _selectedIndex == index ? FontWeight.bold : null,
                      color: _selectedIndex == index ? Color(0xFF816FFC) : null,
                    ),
                  ),
                  selected: _selectedIndex == index,
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                );
              },
            ),
          ),
          // 课程内容
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 16.0),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _courseMap[_categories[_selectedIndex]]?.length ?? 0,
                      itemBuilder: (context, index) {
                        Course? course = _courseMap[_categories[_selectedIndex]]?[index];
                        return ListTile(
                          contentPadding: EdgeInsets.symmetric(vertical: 16.0), // 调整每个课程的高度
                          leading: Image.asset(
                            course?.imagePath ?? '',
                            // width: 80.0,
                            // height: 80.0,
                            fit: BoxFit.cover,
                          ),
                          title: Text(course?.title ?? ''),
                          subtitle: Text(
                            '用时: ${course?.duration ?? ''} 人数: ${course?.traineeCount ?? ''}',
                          ),
                          onTap: () {
                            // 处理点击课程的操作
                          },
                        );
                      },
                    ),
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

class Course {
  final String title;
  final String imagePath;
  final String duration;
  final int traineeCount;

  Course(this.title, this.imagePath, this.duration, this.traineeCount);
}


