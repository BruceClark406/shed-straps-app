import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState());

  void addToCounter(
    Emitter<AppState> emit,
  ) {
    emit(state.copyWith(value: state.value + 1));
  }

  void decrementFromCounter(
    Emitter<AppState> emit,
  ) {
    emit(state.copyWith(value: state.value - 1));
  }
}
