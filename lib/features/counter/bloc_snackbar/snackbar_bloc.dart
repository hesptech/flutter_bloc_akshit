import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'snackbar_event.dart';
part 'snackbar_state.dart';

class SnackbarBloc extends Bloc<SnackbarEvent, SnackbarState> {
  SnackbarBloc() : super(SnackbarInitial()) {
    on<SnackbarShowSnackbarEvent>(snackbarShowSnackbarEvent);
  }

  FutureOr<void> snackbarShowSnackbarEvent(SnackbarShowSnackbarEvent event, Emitter<SnackbarState> emit) {
    emit(SnackbarShowSnackbarActionState());
  }
}
