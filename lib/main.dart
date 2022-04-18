import 'package:brew/screens/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_application_1/services/auth.dart';
// import 'package:flutter_application_1/wrapper.dart';
import 'package:provider/provider.dart';

import 'screens/wrapper.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(create: (_)=>AuthService(),)
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Auth",
        home: wrapper(),
      ),
    );
  }
}