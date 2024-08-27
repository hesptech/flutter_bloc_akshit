part of 'consumer_bloc.dart';

@immutable
sealed class ConsumerEvent {}

class ConsumerIncrementevent extends ConsumerEvent{}

class ConsumerShowSnackbarEvent extends ConsumerEvent{}