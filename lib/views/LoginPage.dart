import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'RegisterPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isLoggedIn = false;
  void _goToRegisterPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterPage()),
    );
  }

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // 这里可以添加验证账号和密码的逻辑
    if (username == '1' && password == '123') {
      setState(() {
        _isLoggedIn = true;
      });
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('错误'),
          content: Text('账号或密码不正确，请重试'),
          actions: [
            TextButton(
              child: Text('确定'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    }
  }

  // 在StatefulWidget的build方法中定义一个FocusNode
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    if (_isLoggedIn) {
      return HomePage();
    } else {
      return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 150.0,
                  height: 150.0,
                ),
                Text(
                  '登录',
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _usernameController,
                  focusNode: _usernameFocusNode,
                  style: TextStyle(
                    color: _usernameFocusNode.hasFocus ? Colors.purple : Colors.black,
                  ),
                  decoration: InputDecoration(
                    labelText: '账号',
                    labelStyle: TextStyle(
                      color: _usernameFocusNode.hasFocus ? Colors.grey : Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide(
                        color: Color(0xFF8272FD),
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _passwordController,
                  focusNode: _passwordFocusNode,
                  obscureText: true,
                  style: TextStyle(
                    color: _passwordFocusNode.hasFocus ? Color(0xFF8272FD) : Colors.black,
                  ),
                  decoration: InputDecoration(
                    labelText: '密码',
                    labelStyle: TextStyle(
                      color: _passwordFocusNode.hasFocus ? Color(0xFF8272FD) : Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      borderSide: BorderSide(
                        color: Color(0xFF8272FD),
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _login,
                  child: Text(
                    '登录',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    primary: Color(0xFF8272FD),
                    minimumSize: Size(400.0, 45.0),
                  ),
                ),
                SizedBox(height: 16.0),
                GestureDetector(
                  onTap: _goToRegisterPage,
                  child: Text(
                    '没有账号？注册',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color(0xFF8272FD),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

    }
  }

}


