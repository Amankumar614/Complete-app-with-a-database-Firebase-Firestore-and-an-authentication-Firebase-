// import 'dart:ffi';

import 'package:brew/screens/authenticate/sign_in.dart';
import 'package:brew/screens/services/auth.dart';
import 'package:brew/shared/contants.dart';
import 'package:flutter/material.dart';

import '../../shared/loding.dart';
import '../wrapper.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

final AuthService auth = AuthService();
final _formkey = GlobalKey<FormState>();

String name='';
String email = "";
String password = '';
bool loading = false;

class _registerState extends State<register> {
  @override
  Widget build(BuildContext context) {
    return loading
        ? loader()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown,
              title: Text("sign up brew crew"),
              actions: [
                TextButton.icon(
                  onPressed: (() {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: ((context) => Signin())));
                  }),
                  icon: Icon(
                    Icons.login_outlined,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Sign in",
                    style: TextStyle(color: Colors.white),
                  ),
                )
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
                        decoration:
                            ownstyledTextfeild.copyWith(hintText: 'Name'),
                        validator: (value) =>
                            value!.isEmpty ? "Enter your name" : null,
                        onChanged: (value) => name = value,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration:
                            ownstyledTextfeild.copyWith(hintText: 'Email'),
                        validator: (value) =>
                            value!.isEmpty ? "Enter an email" : null,
                        onChanged: (value) => email = value,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration:
                            ownstyledTextfeild.copyWith(hintText: 'Pssword'),
                        validator: (value) => value!.length < 6
                            ? "minimum char should be 6"
                            : null,
                        obscureText: true,
                        onChanged: (value) => password = value,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.pink),
                          onPressed: () async {
                            setState(() {
                              loading = true;
                            });
                            if (_formkey.currentState!.validate()) {
                              print("name $name");
                              print("email $email");
                              print("Password $password");
                              dynamic result =
                                  await auth.createuserWithEmailAndPassword(
                                      email, password,name);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => wrapper()));
                              if (result == null) {
                                var snackBar = SnackBar(
                                    content: Text(
                                        'Something went wrong!Try Again',
                                        style: TextStyle(color: Colors.red)));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            } else {
                              null;
                            }
                            setState(() {
                              loading = false;
                            });
                          },
                          child: Text("register"))
                    ],
                  ),
                ),
              ),
            ));
  }
}
