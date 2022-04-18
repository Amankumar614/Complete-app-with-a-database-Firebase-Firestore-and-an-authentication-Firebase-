import 'package:brew/screens/authenticate/register.dart';
import 'package:flutter/material.dart';

class authenticate extends StatefulWidget {
  const authenticate({ Key? key }) : super(key: key);

  @override
  State<authenticate> createState() => _authenticateState();
}

class _authenticateState extends State<authenticate> {

  @override
  Widget build(BuildContext context) {
    
    return register();
  }
}