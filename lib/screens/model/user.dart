import 'package:firebase_auth/firebase_auth.dart';

class User {

  final String uid;
  final String? email;
  User( this.uid, this.email);
}

class UserData {
  final String uid;
  final String name;
  final String suger;
  final int strength;
  UserData({required this.uid,required this.name,required this.suger,required this.strength});
}