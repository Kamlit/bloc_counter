import 'dart:async';

import 'package:bloc_counter/logic/cubit/internet_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';
part 'counter_observer.dart';

class CounterCubit extends Cubit<CounterState> {

  CounterCubit() : super(CounterState(counterValue: 0));

  void increment() => emit(CounterState(counterValue: state.counterValue + 1));

  void decrement() => emit(CounterState(counterValue: state.counterValue - 1));
}