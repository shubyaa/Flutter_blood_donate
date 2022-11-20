import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? uid, email, firstName, secondName;

  UserModel({
    this.uid,
    this.email,
    this.firstName,
    this.secondName,
  });

  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map('uid'),
      email: map('email'),
      firstName: map('firstName'),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
    };
  }
}
