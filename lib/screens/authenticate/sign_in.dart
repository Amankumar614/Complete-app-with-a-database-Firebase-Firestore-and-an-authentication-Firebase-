import 'package:brew/screens/authenticate/register.dart';
import 'package:brew/screens/home/home.dart';
import 'package:brew/screens/wrapper.dart';
import 'package:brew/shared/contants.dart';
import 'package:brew/shared/loding.dart';
import 'package:flutter/material.dart';

import '../services/auth.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

String email = "";
String password = '';
String error='';
bool loading=false;

class _SigninState extends State<Signin> {
    final _formkey=GlobalKey<FormState>();
  final AuthService auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return loading?loader(): Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: Text("sign in brew crew"),
          actions: [
            TextButton.icon(
              
              onPressed: (() {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => register())));
                }),
                // onPressed: () async {
                //   dynamic result = await auth.signInAno();
                //   if (result == null) {
                //     print("error occur");
                //   } else {
                //     print("Signin");
                //     print(result.uid);
                //   }
                // },
                icon: Icon(Icons.login_outlined,color: Colors.white,), label: Text("Register",style: TextStyle(color: Colors.white),),)
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Container(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: ownstyledTextfeild.copyWith(hintText: 'Email'),

                     validator:(value) => value!.isEmpty?"enter the email":null,
                    onChanged: (value) => email = value,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: ownstyledTextfeild.copyWith(hintText: 'Password'),
                     validator:(value) => value!.length<6?"minimum char should be 6":null,
                    obscureText: true,
                    onChanged: (value) => password = value,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.pink),
                      onPressed: () async {
                        // setState(() {
                        //   loading=true;
                        // });
                        if (_formkey.currentState!.validate()) {
                          print("present email $email");
                          print("present password $password");
                          dynamic result=await auth.signInWithEmailPassword(email, password);
        //                   if(result==null){
                            
                              
        //                         var snackBar = SnackBar(content: Text('Something went wrong!Try Again',style: TextStyle(color: Colors.red),));
        // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            
        //                   }
                          // setState(() {
                          //   loading=false;
                          // });
                        } 
                      },
                      child: Text("sign in")),
            
                ],
              ),
            ),
          ),
        ));
  }
}