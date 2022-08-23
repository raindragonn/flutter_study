import 'package:Flutter_Study/chapter5/screen/NewScreen.dart';
import 'package:Flutter_Study/chapter5/screen/SplashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.green),
    home: NewsScreen(),
  ));
}
