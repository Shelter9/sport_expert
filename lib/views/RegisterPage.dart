import 'package:flutter/material.dart';
import 'package:sport_expert/views/LoginPage.dart';

import 'HomePage.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  bool _isLoggedIn = false;
  void _goToRegisterPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  void _register() {

  }

  // 在StatefulWidget的build方法中定义一个FocusNode
  final FocusNode _usernameFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
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
                    '注册',
                    style: TextStyle(
                      fontSize: 24.0,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    // controller: _usernameController,
                    focusNode: _usernameFocusNode,
                    style: TextStyle(
                      color: _usernameFocusNode.hasFocus ? Colors.purple : Colors.black,
                    ),
                    decoration: InputDecoration(
                      labelText: '用户名',
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

                  SizedBox(height: 16.0),
                  TextField(
                    // controller: _passwordController,
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

                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _register,
                    child: Text(
                      '注册',
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
                ],
              ),
            ),
          ),
          Positioned(
            top: 16.0,
            right: 16.0,
            child: GestureDetector(
              onTap: _goToRegisterPage, // 点击时跳转到注册页面的回调函数
              child: Text(
                '返回登录',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Color(0xFF8272FD),
                  // decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }

}


