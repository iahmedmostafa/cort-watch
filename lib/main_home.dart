import 'package:cortwatch/pages/alarms.dart';
import 'package:cortwatch/pages/heartbeats.dart';
import 'package:cortwatch/pages/homeScreen.dart';
import 'package:cortwatch/pages/notes.dart';
import 'package:cortwatch/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainHome extends StatefulWidget {
   MainHome({super.key});
  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int selectedIndex=2;

  @override
  Widget build(BuildContext context) {
    List <Widget> widgetOptions=[
      Notes(),
      Settings(),
      HomeScreen(),
      HeartbeatScreen(),
      Alarms(),
    ];
    void onItemTapped(int? index){
      setState(() {
        selectedIndex=index!;
      });
    }
    return Scaffold(
body: widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.black,
        currentIndex: selectedIndex,
          onTap: onItemTapped,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.note_outlined),label: "Notes"),
            BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Settings"),
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.monitor_heart_outlined),label: "Heartbeats"),
            BottomNavigationBarItem(icon: Icon(Icons.alarm),label: "Alarms"),

      ]),
    ) ;
  }
}
