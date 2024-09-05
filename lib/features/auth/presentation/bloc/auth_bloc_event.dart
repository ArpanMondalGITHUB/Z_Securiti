part of 'auth_bloc_bloc.dart';

abstract class AuthBlocEvent extends Equatable {
  const AuthBlocEvent();

  @override
  List<Object> get props => [];
}

class Signup extends AuthBlocEvent {
  final String name;
  final String email;
  final String password;

  const Signup(
      {required this.name, required this.email, required this.password});

  @override
  List<Object> get props => [name, email, password];
}

class Signin extends AuthBlocEvent {
  final String email;
  final String password;

  const Signin({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

class Signout extends AuthBlocEvent {}
