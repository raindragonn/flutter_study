import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(0)) {
    on<CounterIncrement>(_onIncrement);
    on<CounterDecrement>(_onDecrement);
  }

  _onIncrement(CounterIncrement event, Emitter<CounterState> emitter) {
    // emitter(CounterState(state.count + 1));
    emitter.call(CounterState(state.count + 1));
  }

  _onDecrement(CounterDecrement event, Emitter<CounterState> emitter) {
    // emitter(CounterState(state.count - 1));
    emitter.call(CounterState(state.count - 1));
  }
}
