import 'package:fpdart/fpdart.dart';
import 'package:khanakhazana/features/auth/domain/entities/user.dart';
import 'package:khanakhazana/features/auth/domain/repositories/auth_repositories.dart';
import 'package:khanakhazana/global/error/error_message.dart';
import 'package:khanakhazana/global/usecase/usecase.dart';

class UserSignup implements Usecase<User?, UserSignupParams> {

  final AuthRepository authRepository;
  UserSignup(this.authRepository);
  @override
  Future<Either<ErrorMessage, User?>> call(UserSignupParams params) async {
   return await authRepository.signupWithEmailandPassword(
        name: params.name, email: params.email, password: params.password);
  }
}

class UserSignupParams {
  final String name;
  final String email;
  final String password;
  UserSignupParams(
      {required this.name, required this.password, required this.email});
}
