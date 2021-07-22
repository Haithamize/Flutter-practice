

import 'package:flutter/material.dart';
import 'package:flutter_app/modules/counter/cubit/cubit.dart';
import 'package:flutter_app/modules/counter/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Counter extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context) {
        return CounterCubit();
      },
      child: BlocConsumer<CounterCubit, CounterStates>( //lazm el BlocConsumer ya5od el 2 params dol
        listener: (context, state){
          if(state is CounterPlusState){
            print('Plus State and the counter is now equal to ${state.counter}');
          }
          if(state is CounterMinusState){
            print('Minus State and the counter is now equal to ${state.counter}');
          }

        },
        builder: (context, state) =>Scaffold(
          appBar: AppBar(
            title: Text('Stateful Example with counter'),
          ),
          body: Center(

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children:
              [
                TextButton(onPressed: (){
                  CounterCubit.get(context).minus();
                },
                    child: Text('Minus')),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    '${CounterCubit.get(context).counter}',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 50,
                    ),
                  ),
                ),
                TextButton(onPressed: (){
                  CounterCubit.get(context).plus();
                },
                    child: Text('Plus')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

