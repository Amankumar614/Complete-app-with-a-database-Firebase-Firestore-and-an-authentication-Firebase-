import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loader extends StatelessWidget {
  const loader({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200.withOpacity(0.2),
      body: Container(
        child: Center(child: SpinKitDoubleBounce(color: Colors.pink),),
      ),
    );
  }
}