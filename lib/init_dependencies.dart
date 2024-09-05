import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:khanakhazana/features/auth/data/datasources/remote_datasource.dart';
import 'package:khanakhazana/features/auth/data/repositories/authrepository_impl.dart';
import 'package:khanakhazana/features/auth/domain/repositories/auth_repositories.dart';
import 'package:khanakhazana/features/auth/domain/usecases/signup_usecases.dart';
import 'package:khanakhazana/features/auth/domain/usecases/user_signin_usecase.dart';
import 'package:khanakhazana/features/auth/presentation/bloc/auth_bloc_bloc.dart';
import 'package:khanakhazana/firebase_options.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  serviceLocator
      .registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  serviceLocator.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance);
}

void _initAuth() {
  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        firebaseAuth: serviceLocator(),
        firebaseFirestore: serviceLocator(),
      ),
    )
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => UserSignup(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => UserSignin(
        serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => AuthBlocBloc(
        userSignup: serviceLocator(),
        userSignin: serviceLocator(),
        authRemoteDataSource: serviceLocator()
      ),
    );
}
