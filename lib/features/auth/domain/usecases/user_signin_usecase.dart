import 'package:fpdart/fpdart.dart';
import 'package:khanakhazana/features/auth/domain/entities/user.dart';
import 'package:khanakhazana/features/auth/domain/repositories/auth_repositories.dart';
import 'package:khanakhazana/global/error/error_message.dart';
import 'package:khanakhazana/global/usecase/usecase.dart';

class UserSignin implements Usecase<User?, UserLoginParams> {
  final AuthRepository authRepository;
  UserSignin(this.authRepository);
  @override
  Future<Either<ErrorMessage, User?>> call(UserLoginParams params) async {
    return await authRepository.signinWithEmailandPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class UserLoginParams {
  final String email;
  final String password;

  UserLoginParams({required this.email, required this.password});
}
