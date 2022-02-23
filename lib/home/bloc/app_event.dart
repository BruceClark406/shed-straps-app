part of 'app_bloc.dart';

@immutable
abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object?> get props => [];
}

class AddToCounter extends AppEvent {
  const AddToCounter({this.value});

  final int? value;

  @override
  List<Object?> get props => [value];
}

class DecrementFromCounter extends AppEvent {
  const DecrementFromCounter({this.value});

  final int? value;

  @override
  List<Object?> get props => [value];
}
