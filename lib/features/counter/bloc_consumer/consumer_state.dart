part of 'consumer_bloc.dart';

@immutable
sealed class ConsumerState {}

final class ConsumerInitial extends ConsumerState {}

abstract class ConsumerActionState extends ConsumerState{}

class ConsumerShowSnackbarActionState extends ConsumerActionState{}

class ConsumerIncrementState extends ConsumerState{
  final int val;

  ConsumerIncrementState({
    required this.val
  });
}

class ConsumerIncrementActionState extends ConsumerState{}