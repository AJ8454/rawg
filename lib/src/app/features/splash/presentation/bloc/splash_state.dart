part of 'splash_bloc.dart';

abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

class SplashInitial extends SplashState {}

class LoadedSplashState extends SplashState {
  final bool isLog;
  const LoadedSplashState({required this.isLog});

  @override
  List<Object> get props => [isLog];
}
