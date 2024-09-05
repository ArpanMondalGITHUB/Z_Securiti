import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:khanakhazana/features/auth/data/models/user_model.dart';
import 'package:khanakhazana/global/error/exception.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> signUpWithEmailandPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<UserModel> signInWithEmailandPassword({
    required String email,
    required String password,
  });

  Future<void> signOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  AuthRemoteDataSourceImpl(
      {required this.firebaseAuth, required this.firebaseFirestore});
  @override
  Future<UserModel> signInWithEmailandPassword(
      {required String email, required String password}) async {
    try {
      final UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = userCredential.user;
      if (user == null) {
        throw const ServerException('user is null!');
      }
      final userModel = UserModel(
        uid: user.uid,
        email: user.email ?? '',
        name: user.displayName ?? 'Anonymous',
      );
      return userModel;
    } on FirebaseAuthException catch (e) {
      throw ServerException(e.message ?? 'Authentication error');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<UserModel> signUpWithEmailandPassword(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = userCredential.user;
      if (user == null) {
        throw const ServerException('User is null');
      }
      final userModel = UserModel(
        uid: user.uid,
        email:user. email,
        name: name ,
      );
      await firebaseFirestore
          .collection('users')
          .doc(userModel.uid)
          .set(userModel.toFirestore());
      await userCredential.user?.updateDisplayName(name);
      return userModel;
    } on FirebaseAuthException catch (e) {
      throw ServerException(e.message ?? 'Authentication error');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  Stream<User?> get user => firebaseAuth.authStateChanges();
}
