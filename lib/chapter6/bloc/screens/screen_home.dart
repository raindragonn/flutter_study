import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/counter/counter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        buildWhen: (previous, current) => previous.count != current.count,
        builder: (context, state) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('count: ${state.count.toString()}'),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/counter');
                },
                child: const Text('Go to CounterScreen'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
