part of 'splash_bloc.dart';


abstract class SplashEvent extends Equatable {
  const SplashEvent();

  @override
  List<Object> get props => [];
}

class GetUserLoggedEvent extends SplashEvent {}

class SetUserLoggedEvent extends SplashEvent {
  final bool isLog;
  const SetUserLoggedEvent({required this.isLog});

  @override
  List<Object> get props => [isLog];
}
