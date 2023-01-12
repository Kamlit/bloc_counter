import 'dart:developer';

import 'package:bloc_counter/logic/cubit/counter_cubit.dart';
import 'package:bloc_counter/presentation/screens/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/screens/second_screen.dart';

void main() {
  Bloc.observer = CounterObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final CounterCubit counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BLoC Counter',
      initialRoute: '/',
      routes: {
        '/': (context) => BlocProvider.value(
              value: counterCubit,
              child: const FirstScreen(),
            ),
        '/second_screen': (context) => BlocProvider.value(
              value: counterCubit,
              child: const SecondScreen(),
            ),
      },
    );
  }
}
