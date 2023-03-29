part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class SignUpEvent extends AuthenticationEvent {
  final UserEntity userEntity;
  const SignUpEvent(this.userEntity);
}

class LoginEvent extends AuthenticationEvent {
  final String userName, password;
  const LoginEvent(this.userName, this.password);
}

class ForgetPasswordEvent extends AuthenticationEvent {
  final String email, password;
  const ForgetPasswordEvent(this.email, this.password);
}
