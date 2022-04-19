import 'package:brew/screens/authenticate/register.dart';
import 'package:brew/screens/model/uid.dart';
import 'package:brew/screens/model/user.dart';
import 'package:brew/screens/services/databases.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;


class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  String? gloabalUid;

  // this function will take the email and uid form the firebase output when user reach to it and save it in our model

  User? _userfromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    } else {
      print(user);
      OwnUid=user.uid;
      return User(user.uid, user.email);
    }
  }
  
  // using stream to check the user state
  Stream<User?>? get user {
    // print("myuid $OwnUid");
    return _firebaseAuth.authStateChanges().map(_userfromFirebase);
  }

  Future<User?> signInWithEmailPassword(String email, String password) async {
    try {
      print("ownuid $OwnUid");
      final Credential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return _userfromFirebase(Credential.user);  
    } on Exception catch (e) {
      print("this is the error $e");
     return null;
    }
  }

  Future<User?> createuserWithEmailAndPassword(
    
      String email, String password,String name) async {
        try {
             final Credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
        // THIS WILL MAKE THE NEW DOCUMENT FOR THE NEW USERS
        await DatabaseService(uid: Credential.user!.uid).UpdateUserData('3', name,500);
        // await DatabaseService(uid: Credential.user!.uid).brewcollection.
    return _userfromFirebase(Credential.user);
        } catch (e) {
          return null;
        }
 
  }

  Future<void> signout()async{
    return await _firebaseAuth.signOut();
  }

}