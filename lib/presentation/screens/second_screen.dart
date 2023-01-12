import 'package:bloc_counter/logic/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counterProvider = BlocProvider.of<CounterCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
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
        ],
      ),
    );
  }
}
