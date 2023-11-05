part of 'sign_in_bloc.dart';

sealed class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends SignInEvent {
  final String email, password;  

  const LoginEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class VisiblePasswordEvent extends SignInEvent{
  final bool visible;
  const VisiblePasswordEvent({required this.visible});

  @override
  List<Object> get props => [visible];
}
