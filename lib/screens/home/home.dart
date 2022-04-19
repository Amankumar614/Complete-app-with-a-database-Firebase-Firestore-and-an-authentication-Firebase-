import 'package:brew/screens/home/brewList.dart';
import 'package:brew/screens/home/setting_Form.dart';
import 'package:brew/screens/services/auth.dart';
import 'package:brew/screens/services/databases.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/brews.dart';

class Home extends StatelessWidget {
  // const Home({ Key? key }) : super(key: key);

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingPanel(){
      showModalBottomSheet(
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.only(top:8.0),
        child: settingForm(),
      );
    });
    }
    return StreamProvider< List<Brew> ?>.value(
      value: DatabaseService(uid: '').brews,
      initialData: null,
      child: Scaffold(
          
         resizeToAvoidBottomInset: false,
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          title: Text("Brew Crew"),
          backgroundColor: Colors.brown[400],
          elevation: 0,
          actions: [
             IconButton(
               
                onPressed: ()  {
                  _showSettingPanel();
                },
                icon: Icon(Icons.settings)),
            IconButton(
                onPressed: () async {
                  await _auth.signout();
                },
                icon: Icon(Icons.logout)),

          ],
        ),
        body:Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/coffee_bg.png'),fit: BoxFit.cover)
          ),
          child: Brewlist())
      ),
    );
  }
}
