part of 'sign_in_bloc.dart';

sealed class SignInState extends Equatable {
  const SignInState();
  
  @override
  List<Object> get props => [];
}

final class SignInInitial extends SignInState {}

final class LoginSuccess extends SignInState {}

final class SignInLoading extends SignInState {}

final class LoginException extends SignInState {
  final String message;
  const LoginException({required this.message});

  @override
  List<Object> get props => [message];
}

final class VisiblePasswordState extends SignInState{}

final class InVisiblePasswordState extends SignInState{}