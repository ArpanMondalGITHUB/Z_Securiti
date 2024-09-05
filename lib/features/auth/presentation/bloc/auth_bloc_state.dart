part of 'auth_bloc_bloc.dart';

abstract class AuthBlocState extends Equatable {
  const AuthBlocState();

  @override
  List<Object> get props => [];
}

final class AuthBlocInitial extends AuthBlocState {}

final class AuthLoading extends AuthBlocState {}

final class AuthSuccess extends AuthBlocState {
  final User? user;
  const AuthSuccess(this.user);
  
}

final class AuthFailure extends AuthBlocState {
  final String message;

  const AuthFailure(this.message);
}
class AuthUnauthenticated extends AuthBlocState {} 