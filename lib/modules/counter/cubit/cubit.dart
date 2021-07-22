import 'package:bloc/bloc.dart';
import 'package:flutter_app/modules/counter/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates>{

  CounterCubit() : super(CounterInitialState());

  static CounterCubit get(context) => BlocProvider.of(context); // de el fun eli h3mlha 3shan a5od obj bkol shola mn el CounterCubit da

  int counter = 1;

  void plus(){
    counter++;
    emit(CounterPlusState(counter));
  }

  void minus(){
    counter--;
    emit(CounterMinusState(counter));
  }
}