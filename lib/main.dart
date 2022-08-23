import 'dart:async';
import 'package:Flutter_Study/chapter1/screens/first_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainWidget());
}

class MainWidget extends StatelessWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Theme.of(context).textTheme;
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.lightGreen),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainHomeScreen(),
        '/moveScreen': (context) => const FirstScreen(),
        '/tutorial': (context) => const Tutorial(),
        '/app': (context) => const App(),
        '/card': (context) => const CardWidget(),
      },
    );
  }
}

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({Key? key}) : super(key: key);

  _move(context, name) {
    Navigator.of(context).pushNamed(name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Study'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                  onPressed: () => _move(context, '/moveScreen'),
                  child: const Text("MoveScreen")),
              ElevatedButton(
                  onPressed: () => _move(context, '/tutorial'),
                  child: const Text("Tutorial")),
              ElevatedButton(
                  onPressed: () => _move(context, '/app'),
                  child: const Text("App")),
              ElevatedButton(
                  onPressed: () => _move(context, '/card'),
                  child: const Text("Card")),
            ],
          ),
        ),
      ),
    );
  }
}

class Tutorial extends StatelessWidget {
  const Tutorial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tutorial'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Image.network(
              "https://images.unsplash.com/photo-1657672733400-0be1bb102ecc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&auto=format&fit=crop&w=1600&q=60",
            ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Title",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        Text(
                          "description",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  const FavoriteIcon(),
                  const Text("41"),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _button(Icons.call, "CALL", Colors.blue),
                _button(Icons.near_me, "ROUTE", Colors.blue),
                _button(Icons.share, "SHARE", Colors.blue),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(32),
              child: Text(
                'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
                'Alps. Situated 1,578 meters above sea level, it is one of the '
                'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
                'half-hour walk through pastures and pine forest, leads you to the '
                'lake, which warms to 20 degrees Celsius in the summer. Activities '
                'enjoyed here include rowing, and riding the summer toboggan run.',
                softWrap: true,
              ),
            )
          ],
        ),
      ),
    );
  }

  GestureDetector _button(IconData icon, String text, Color tint) {
    return GestureDetector(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: tint,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              text,
              style: TextStyle(color: tint, fontSize: 12),
            ),
          )
        ],
      ),
      onTap: () {},
    );
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("title"),
      ),
      body: Wrap(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Expanded(
                flex: 2,
                child: BlueBox(
                  color: Colors.brown,
                ),
              ),
              Expanded(
                flex: 1,
                child: BlueBox(color: Colors.blue),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FavoriteIcon extends StatefulWidget {
  const FavoriteIcon({Key? key}) : super(key: key);

  @override
  State createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  bool _isFavorite = false;
  int _count = 1;
  Timer? _timer;

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _count += 1;
        _isFavorite = _count % 2 == 0;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  void toggleFavorite(count) {
    setState(() {
      _isFavorite = count % 2 == 0;
    });
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          toggleFavorite(_count);
        },
        child: ((_isFavorite
            ? const Icon(Icons.star, color: Colors.red)
            : const Icon(Icons.star_border, color: Colors.grey))),
      );
}

class BlueBox extends StatelessWidget {
  final Color mainColor;

  const BlueBox({required Color color, super.key}) : mainColor = color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: Container(
        decoration: BoxDecoration(
          color: mainColor,
          border: Border.all(),
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.account_circle, size: 50),
              ),
              Expanded(
                  child: Column(
                children: [
                  Text(
                    'Flutter McFlutter',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const Text('Experienced App Developer'),
                ],
              )),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('123 Main Street'),
              Text('415-555-0198'),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: const [],
          ),
        ],
      ),
    );
  }
}
