part of 'advisor_bloc.dart';

@immutable
abstract class AdvisorState {}

class AdvisorInitial extends AdvisorState {}

class AdvisorLoadingState extends AdvisorState {}

class AdvisorLoadedState extends AdvisorState {
  final String advice;

  AdvisorLoadedState({required this.advice});
}

class AdvisorErrorState extends AdvisorState {
  final String error;

  AdvisorErrorState({required this.error});
}
