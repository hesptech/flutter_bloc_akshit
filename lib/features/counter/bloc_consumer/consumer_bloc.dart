import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'consumer_event.dart';
part 'consumer_state.dart';

class ConsumerBloc extends Bloc<ConsumerEvent, ConsumerState> {
  ConsumerBloc() : super(ConsumerInitial()) {
    on<ConsumerIncrementevent>(consumerIncrementevent);
    on<ConsumerShowSnackbarEvent>(consumerShowSnackbarEvent);
  }

  int value = 0;

  FutureOr<void> consumerIncrementevent(
    ConsumerIncrementevent event, Emitter<ConsumerState> emit) {
      value = value + 1;

      emit(ConsumerIncrementState(val: value));
      //emit(CounterIncrementActionState());
    }

  FutureOr<void> consumerShowSnackbarEvent(ConsumerShowSnackbarEvent event, Emitter<ConsumerState> emit) {
    emit(ConsumerShowSnackbarActionState());
  }
}
