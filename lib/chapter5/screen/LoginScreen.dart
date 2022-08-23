import 'package:Flutter_Study/chapter4/screen/TimerScreen.dart';
import 'package:Flutter_Study/chapter5/screen/TodoListScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  Future setLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogin', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('로그인'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          width: context.getWidthRatio(0.85),
          child: ElevatedButton(
            onPressed: () {
              setLogin().then((_) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => TodoListScreen(),
                ));
              });
            },
            child: Text('로그인'),
          ),
        ),
      ),
    );
  }
}
