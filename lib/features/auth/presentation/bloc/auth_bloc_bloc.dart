import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khanakhazana/features/auth/data/datasources/remote_datasource.dart';
import 'package:khanakhazana/features/auth/domain/entities/user.dart';
import 'package:khanakhazana/features/auth/domain/usecases/signup_usecases.dart';
import 'package:khanakhazana/features/auth/domain/usecases/user_signin_usecase.dart';
part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBlocBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final UserSignup _userSignup;
  final UserSignin _userSignin;
  final AuthRemoteDataSource _authRemoteDataSource;
  AuthBlocBloc(
      {required UserSignup userSignup,
      required UserSignin userSignin,
      required AuthRemoteDataSource authRemoteDataSource})
      : _userSignup = userSignup,
        _userSignin = userSignin,
        _authRemoteDataSource = authRemoteDataSource,
        super(AuthBlocInitial()) {
    on<Signup>(_onSignup);
    on<Signin>(_onSignin);
    on<Signout>(_onsignout);
  }
  void _onSignup(Signup event, Emitter<AuthBlocState> emit) async {
    emit(AuthLoading());
    final resp = await _userSignup(UserSignupParams(
      name: event.name,
      password: event.password,
      email: event.email,
    ));
    resp.fold(
      (l) => emit(
        AuthFailure(l.meassage),
      ),
      (user) => emit(
        AuthSuccess(user),
      ),
    );
  }

  void _onSignin(Signin event, Emitter<AuthBlocState> emit) async {
    emit(AuthLoading());
    final resp = await _userSignin(UserLoginParams(
      email: event.email,
      password: event.password,
    ));
    resp.fold(
      (l) => emit(
        AuthFailure(l.meassage),
      ),
      (user) => emit(
        AuthSuccess(user),
      ),
    );
  }

  void _onsignout(Signout event, Emitter<AuthBlocState> emit) async {
    emit(AuthLoading()); // Emit loading state
    try {
      await _authRemoteDataSource.signOut(); // Call the logout method
      emit(AuthUnauthenticated()); // Emit unauthenticated state
    } catch (e) {
      emit(AuthFailure(e.toString())); // Handle errors
    }
  }
}
