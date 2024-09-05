import 'package:fpdart/fpdart.dart';
import 'package:khanakhazana/features/auth/data/datasources/remote_datasource.dart';
import 'package:khanakhazana/features/auth/domain/entities/user.dart';
import 'package:khanakhazana/features/auth/domain/repositories/auth_repositories.dart';
import 'package:khanakhazana/global/error/error_message.dart';
import 'package:khanakhazana/global/error/exception.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<ErrorMessage, User?>> signinWithEmailandPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userId = await remoteDataSource.signInWithEmailandPassword(
        email: email,
        password: password,
      );
      return right(userId);
    } on ServerException catch (e) {
      return left(ErrorMessage(e.message));
    }
  }

  @override
  Future<Either<ErrorMessage, User?>> signupWithEmailandPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userId = await remoteDataSource.signUpWithEmailandPassword(
        name: name,
        email: email,
        password: password,
      );
      return right(userId);
    } on ServerException catch (e) {
      return left(ErrorMessage(e.message));
    }
  }


  
}


