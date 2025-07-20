import 'package:cortwatch/main_home.dart';
import 'package:cortwatch/pages/homeScreen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  void initState() {
    super.initState();
   Future.delayed(Duration(seconds: 2),(){
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainHome()));
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
       child: Image(image: AssetImage('image/applogo.jpg'),fit: BoxFit.fill,),
      ),
    );
  }
}
