


import 'package:brew/screens/authenticate/sign_in.dart';
import 'package:brew/screens/home/home.dart';
import 'package:brew/screens/model/brews.dart';
import 'package:brew/screens/model/user.dart';
import 'package:brew/screens/services/auth.dart';
import 'package:brew/screens/services/databases.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_application_1/model/usermodel.dart';
// import 'package:flutter_application_1/screen/homeScreen.dart';
// import 'package:flutter_application_1/screen/loginScreen.dart';
// import 'package:flutter_application_1/services/auth.dart';
// import 'package:flutter_application_1/services/auth.dart';
import 'package:provider/provider.dart';

// import 'model/user.dart';

class wrapper extends StatelessWidget {
  const wrapper({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // BY THIS WE WILL ARE ABLE TO USE THE METHODS WHICH ARE IN AUTHSERVICE CLASS
    final authService=Provider.of<AuthService>(context);
    // print("auth service ${authService.user}");
    print("our user ${User}");
    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<User?> snapshot){
        if (snapshot.connectionState==ConnectionState.active) {
          final User? user = snapshot.data;
          return user==null?Signin():Home();
          
        }else{
          return Scaffold(body: Center(child: CircularProgressIndicator(),),);
        }
        
      },
    );
  }
}












// import 'package:brew/screens/authenticate/authenticate.dart';
// import 'package:brew/screens/authenticate/sign_in.dart';
// import 'package:brew/screens/home/home.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

// class Wrapper extends StatelessWidget {
//   const Wrapper({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context,snapshot){
//         if (snapshot.hasData) {
//           return Home();
//         } else {
//           return authenticate();
//         }
//       }
    
//     );
//   }
// }