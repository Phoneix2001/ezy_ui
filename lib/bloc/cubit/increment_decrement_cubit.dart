


import 'package:flutter_bloc/flutter_bloc.dart';

class IncrementDecrementCubit extends Cubit<double> {
  IncrementDecrementCubit() : super(0.0);
  void increment() {
    emit(state + 1);
  }
  void decrement() {
    if (state <= 0) {
      emit(0.0);
      return;
    }
    emit(state - 1);
    print(state);
  }

  void setValue(double value) {
    emit(value);
  }
}
