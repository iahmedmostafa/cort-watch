import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cortwatch/pages/date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/dateTime.dart';

class Settings extends StatefulWidget {

   Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool currentVal=true;
  bool currentVal2=true;
  bool currentVal3=true;
  bool currentVal4=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body:Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SizedBox(height: 20.h,),
            Container(
            height: 150.h,
            width: 300.w,
            child: DateTimeWidget()),
            SizedBox(height: 10.h,),
            Container(
              margin: EdgeInsets.all(7),
              width: MediaQuery.of(context).size.width,
              height: 50.h,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white70,width: .3.w),
                borderRadius: BorderRadius.circular(7.r),
              ),
              child: ListTile(
                trailing:
                Switch(value:currentVal , onChanged:(val){
                  currentVal=val;
                  if(val==false){
                    AwesomeDialog(
                      context:context,
                    dialogType: DialogType.warning,
                      title: "Are you sure for turning off bluetooth ?",
                      titleTextStyle: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.normal),
                      btnCancelOnPress: (){
                        currentVal=true;
                        setState(() {});
                      },
                      btnOkOnPress: (){
                        currentVal=val;
                        setState(() {});
                      },
                      btnCancelText: "No",
                      btnOkText: "Yes",
                      dialogBackgroundColor: Colors.white70
                    ).show();
                  }
                  setState(() {});
                },
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Colors.black12,
                  activeTrackColor: Colors.green,
                  activeColor: Colors.white,),
                title: Text("Bluetooth",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                leading: Icon(Icons.bluetooth,color: Colors.blue,size: 40,) ,

              ),
            ),
            SizedBox(height: 10.h,),
            Container(
              margin: EdgeInsets.all(7),
              width: MediaQuery.of(context).size.width,
              height: 50.h,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white70,width: .3.w),
                borderRadius: BorderRadius.circular(7.r),
              ),
              child: ListTile(
                trailing:
                Switch(
                  value:currentVal2 , onChanged:(val){
                  currentVal2=val;
                  if(val==false){
                    AwesomeDialog(
                        context:context,
                        dialogType: DialogType.warning,
                        title: "Are you sure for turning off Wi-Fi ?",
                        titleTextStyle: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.normal),
                        btnCancelOnPress: (){
                          currentVal2=true;
                          setState(() {});
                        },
                        btnOkOnPress: (){
                          currentVal2=val;
                          setState(() {});
                        },
                        btnCancelText: "No",
                        btnOkText: "Yes",
                        dialogBackgroundColor: Colors.white70
                    ).show();
                  }
                  setState(() {});
                },
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Colors.black12,
                  activeTrackColor: Colors.green,
                  activeColor: Colors.white,),
                title: Text("Wi-Fi",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                leading: Icon(Icons.wifi,color: Colors.white,size: 40,),

              ),
            ),
            SizedBox(height: 10.h,),
            Container(
              margin: EdgeInsets.all(7),
              width: MediaQuery.of(context).size.width,
              height: 50.h,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white70,width: .3.w),
                borderRadius: BorderRadius.circular(7.r),
              ),
              child: ListTile(
                trailing:
                Switch(
                  value:currentVal3 , onChanged:(val){
                  currentVal3=val;
                  setState(() {});
                },
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Colors.black12,
                  activeTrackColor: Colors.green,
                  activeColor: Colors.white,),
                title: Text("Notifications",style: TextStyle(color: Colors.black,fontSize: 26,fontWeight: FontWeight.bold),),
                leading: Icon(Icons.notifications_active,color: Colors.orange,size: 40,),

              ),
            ),
            SizedBox(height: 10.h,),
            Container(
              margin: EdgeInsets.all(7),
              width: MediaQuery.of(context).size.width,
              height: 50.h,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white70,width: .3.w),
                borderRadius: BorderRadius.circular(7.r),
              ),
              child: ListTile(
                trailing:
                Switch(
                  value:currentVal4 , onChanged:(val){
                  currentVal4=val;
                  setState(() {});
                },
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Colors.black12,
                  activeTrackColor: Colors.green,
                  activeColor: Colors.white,),
                title: Text("Battery Saver ",style: TextStyle(color: Colors.black,fontSize: 23,fontWeight: FontWeight.bold),),
                leading: Icon(Icons.battery_saver,color: Colors.green,size: 40,),

              ),
            ),
            SizedBox(height: 10.h,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> CalendarPage()));
              },
              child: Container(
                margin: EdgeInsets.all(7),
                width: MediaQuery.of(context).size.width,
                height: 50.h,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white70,width: .3.w),
                  borderRadius: BorderRadius.circular(7.r),
                ),
                child: ListTile(
                  trailing: Icon(Icons.remove_red_eye,color: Colors.deepOrangeAccent,size: 28,),
                  title:Text("Show Calender  ",style: TextStyle(color: Colors.black,fontSize: 23,fontWeight: FontWeight.bold),),
                  leading: Icon(Icons.date_range,color: Colors.white,size: 30,),

                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
