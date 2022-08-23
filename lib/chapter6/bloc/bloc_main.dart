import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/counter/counter_bloc.dart';

import 'screens/screens.dart';

class BlocApp extends StatelessWidget {
  const BlocApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => CounterBloc(),
        child: MaterialApp(
          theme: ThemeData(primarySwatch: Colors.brown),
          title: 'Bloc',
          routes: {
            '/': (context) => const HomeScreen(),
            '/counter': (context) => const CounterScreen()
          },
          initialRoute: '/',
        ),
      );
}
