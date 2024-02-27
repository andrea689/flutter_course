import 'package:flutter_application_1/cubits/counter_cubit/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState());

  void incrementCounter1() => emit(state.copyWith(counter: state.counter + 1));

  void incrementCounter2() =>
      emit(state.copyWith(counter2: state.counter2 + 1));
}
