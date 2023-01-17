import 'dart:developer';

import 'package:bloc_counter/logic/cubit/counter_cubit.dart';
import 'package:bloc_counter/presentation/screens/first_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/cubit/internet_cubit.dart';
import 'presentation/screens/second_screen.dart';

void main() {
  Bloc.observer = CounterObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(
            connectivity: Connectivity(),
          ),
        ),
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'BLoC Counter',
        initialRoute: '/',
        routes: {
          '/': (context) => const FirstScreen(),
          '/second_screen': (context) => const SecondScreen(),
        },
      ),
    );
  }
}
