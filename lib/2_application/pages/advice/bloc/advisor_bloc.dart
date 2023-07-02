import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'advisor_event.dart';
part 'advisor_state.dart';

class AdvisorBloc extends Bloc<AdvisorEvent, AdvisorState> {
  AdvisorBloc() : super(AdvisorInitial()) {
    on<AdviceRequestedEvent>((event, emit) async {
      emit(AdvisorLoadingState());
      debugPrint('Loading fake data');
      await Future.delayed(const Duration(seconds: 1), () {});
      debugPrint('Got some fake data');
      emit(AdvisorLoadedState(advice: 'Some fake data'));
      // emit(AdvisorErrorState(error: 'some error msg'));
    });
  }
}
