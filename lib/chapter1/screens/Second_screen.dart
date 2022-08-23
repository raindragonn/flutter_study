import 'package:Flutter_Study/chapter4/screen/TimerScreen.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  String data = "empty";

  SecondScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: GestureDetector(
            onTap: () {},
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('data = $data'),
                  OutlinedButton(
                      onPressed: () =>
                          Navigator.of(context).pop({'result': "check"}),
                      child: Text('Go to First Screen'))
                ],
              ),
            ),
          ),
        ),
      );
}
