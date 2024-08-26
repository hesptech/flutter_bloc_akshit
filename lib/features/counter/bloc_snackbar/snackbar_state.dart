part of 'snackbar_bloc.dart';

@immutable
sealed class SnackbarState {}

final class SnackbarInitial extends SnackbarState {}

abstract class SnackbarActionState extends SnackbarState{}

class SnackbarShowSnackbarActionState extends SnackbarActionState{}

