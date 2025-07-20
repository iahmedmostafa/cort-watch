import 'package:flutter/material.dart';

class Ourtext extends StatelessWidget {
  String text;
  FontWeight fontWeight;

   Ourtext({super.key,required this.text,this.fontWeight=FontWeight.bold});

  @override
  Widget build(BuildContext context) {
    return Text("$text", style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: fontWeight),);
  }
}
