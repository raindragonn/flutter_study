import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'Second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int count = 1;

  moveSecond(BuildContext context) async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);
    Map result = await Navigator.of(context).push(_createRoute(formattedDate));

    if (result.containsKey('result')) {
      setState(() {
        count++;
      });
    }
  }

  a(BuildContext context) {
    Future a = moveSecond(context);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('First Screen')),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(count.toString()),
                ElevatedButton(
                    onPressed: () => moveSecond(context),
                    child: Text('Go to second Screen'))
              ],
            ),
          ),
        ),
      );
}

Route _createRoute(formatDate) {
  return MyRoute(
      pageBuilder: (context, animation, secondaryAnimation) =>
          SecondScreen(data: formatDate),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.linear;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      });
}

class MyRoute extends PageRouteBuilder {
  MyRoute({required super.pageBuilder, required super.transitionsBuilder});

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);
}
