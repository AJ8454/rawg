part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final UserModel userModel;
  const HomeLoadedState({required this.userModel});
  @override
  List<Object> get props => [userModel];
}

class HomeFailureState extends HomeState {
  final String error;
  const HomeFailureState(this.error);
  @override
  List<Object> get props => [error];
}

class UserLoggetOutState extends HomeState {}
