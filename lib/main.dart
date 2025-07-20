import 'package:cortwatch/onboarding/chatappscreen.dart';
import 'package:cortwatch/onboarding/on_boarding_screen.dart';
import 'package:cortwatch/pages/homeScreen.dart';
import 'package:cortwatch/welcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
   runApp(
  ScreenUtilInit(
    minTextAdapt: true, // Optional, adjust text sizes
    splitScreenMode: true, // Optional, handle split screen devices
    builder: (context, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
       // theme: ThemeData(primarySwatch: Colors.blue),
        home: OnboardingScreen(),
      );
    },
  ));
}
