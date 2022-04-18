import 'package:brew/screens/model/brews.dart';
import 'package:brew/shared/loding.dart';
import 'package:flutter/material.dart';

class BrewTitle extends StatelessWidget {
  // const BrewTitle({ Key? key }) : super(key: key);
  final Brew ?brews;
  BrewTitle({this.brews});

 
  @override
  Widget build(BuildContext context) {
    
    return Padding(padding: EdgeInsets.only(top: 8,bottom: 8)
    ,child: Card(margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
    child: ListTile(
      leading: CircleAvatar(radius: 25,backgroundColor: Colors.brown[brews?.strength],backgroundImage: AssetImage('assets/coffee_icon.png'),),
      title: Text(brews?.name),
      subtitle: Text("Takes ${brews?.sugar} suger's"),
    ),),
    );
  }
}