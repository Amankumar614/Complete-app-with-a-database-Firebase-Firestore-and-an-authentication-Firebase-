import 'package:brew/screens/home/brew_title.dart';
import 'package:brew/screens/model/brews.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Brewlist extends StatefulWidget {
  
  const Brewlist({ Key? key }) : super(key: key);

  @override
  State<Brewlist> createState() => _BrewlistState();
}

class _BrewlistState extends State<Brewlist> {
  
  @override
  Widget build(BuildContext context) {

    final brews = Provider.of<List<Brew>?>(context);  
    return brews == null?Center(child: Text("Loading...")): ListView.builder(itemBuilder: 
    ((context, index) => BrewTitle(brews:brews[index]))
    ,itemCount: brews.length,);
  }
}