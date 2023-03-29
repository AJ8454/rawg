part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthLoadingState extends AuthenticationState {}

class AuthLoggedInState extends AuthenticationState {
  final UserModel userModel;
  const AuthLoggedInState(this.userModel);

  @override
  List<Object> get props => [userModel];
}

class AuthSignedUpState extends AuthenticationState {
  const AuthSignedUpState();
}

class AuthFailureState extends AuthenticationState {
  final String error;
  const AuthFailureState(this.error);

  @override
  List<Object> get props => [error];
}

class AuthPasswordChangedState extends AuthenticationState {}
