
import 'package:khanakhazana/features/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.uid,
    required super.email,
    required super.name,
  });

  factory UserModel.fromjson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] ?? '',
      email: json['email'] ?? '',
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> tojson() {
    return {'uid': uid, 'email': email, 'name': name};
  }

    Map<String, dynamic> toFirestore() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      
    };
  }

  factory UserModel.fromFirestore(Map<String, dynamic> firestoreData) {
    return UserModel(
      uid: firestoreData['uid'] ?? '',
      email: firestoreData['email'] ?? '',
      name: firestoreData['name'] ?? '',
      
    );
  }
}
