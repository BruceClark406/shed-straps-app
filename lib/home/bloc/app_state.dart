part of 'app_bloc.dart';

class AppState extends Equatable {
  const AppState({this.value = 0});

  final int value;

  @override
  List<Object> get props => [value];

  AppState copyWith({
    int? value,
  }) {
    return AppState(
      value: value ?? this.value,
    );
  }
}
