import 'package:bloc_counter/constants/enums.dart';
import 'package:bloc_counter/logic/cubit/counter_cubit.dart';
import 'package:bloc_counter/logic/cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counterProvider = BlocProvider.of<CounterCubit>(context);

    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetConnected &&
            state.connectionType == ConnectionType.wifi) {
          counterProvider.increment();
        } else if (state is InternetConnected &&
            state.connectionType == ConnectionType.mobile) {
          counterProvider.decrement();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('First Screen'),
        ),
        body: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  child: Material(
                    color: Colors.red,
                    child: InkWell(
                      onTap: () => counterProvider.decrement(),
                      splashColor: const Color.fromARGB(255, 151, 42, 34),
                      child: const Center(
                        child: Icon(
                          Icons.remove,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  width: 15,
                  height: double.infinity,
                ),
                Expanded(
                  child: Material(
                    color: Colors.green,
                    child: InkWell(
                      onTap: () => counterProvider.increment(),
                      splashColor: const Color.fromARGB(255, 33, 77, 35),
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(90),
                ),
                child: BlocBuilder<CounterCubit, CounterState>(
                  builder: (context, state) => Center(
                    child: Text(
                      '${state.counterValue}',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              bottom: 150,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Next page'),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                    onPressed: () =>
                        Navigator.of(context).pushNamed('/second_screen'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
