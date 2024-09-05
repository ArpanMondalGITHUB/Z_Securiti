import 'package:fpdart/fpdart.dart';
import 'package:khanakhazana/features/auth/domain/entities/user.dart';
import 'package:khanakhazana/global/error/error_message.dart';

abstract interface class AuthRepository{
 
  Future<Either<ErrorMessage, User?>> signupWithEmailandPassword({
    required String name,
    required String email,
    required String password,

    });
     Future<Either<ErrorMessage, User?>> signinWithEmailandPassword({
    required String email,
    required String password,

    });

    

 }