import 'package:flutter/material.dart';

class StateScreen extends StatefulWidget {
  const StateScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StateScreenState();
}

class _StateScreenState extends State<StateScreen> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.brown),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Counter'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Counte: $count',
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(width: double.infinity, height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: decrease, child: const Text('- decrease')),
                  ElevatedButton(
                      onPressed: increase, child: const Text('+ increase')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void decrease() {
    setState(() {
      count -= 1;
    });
  }

  void increase() {
    setState(() {
      count += 1;
    });
  }
}
