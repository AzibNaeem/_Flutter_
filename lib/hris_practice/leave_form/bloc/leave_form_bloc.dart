import 'package:flutter_bloc/flutter_bloc.dart';
import 'leave_form_event.dart';
import 'leave_form_state.dart';

class LeaveFormBloc extends Bloc<LeaveFormEvent, LeaveFormState> {
  LeaveFormBloc() : super(LeaveFormState.initial()) {
    on<LeaveTypeChanged>((event, emit) {
      emit(state.copyWith(leaveType: event.leaveType));
    });

    on<LeaveReasonChanged>((event, emit) {
      emit(state.copyWith(reason: event.reason));
    });

    on<LeaveFormSubmitted>((event, emit) {
      // In real app, you'd call an API here
      emit(state.copyWith(isSubmitted: true));
    });
  }
}
