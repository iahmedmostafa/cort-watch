import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Alarms extends StatefulWidget {
   Alarms({super.key});

  @override
  State<Alarms> createState() => _AlarmsState();
}

class _AlarmsState extends State<Alarms> {
  bool currentValue=true ;
  List alarms=[
    {"text":"  Every day","status":true,"time":"7:00 am"}
    ,{"text":"  Sunday , Monday , Wednesday","status":false,"time":"12:00 pm"},
    {"text":"  Today ","status":false,"time":"02.00 am"},
    {"text":"  Saturday , Monday , Wednesday","status":true,"time":"07:10 am"},
    {"text":"  Tomorrow ","status":true,"time":"09:09 pm"},
    {"text":"  Sunday , Tuesday , Thursday","status":false,"time":"8:15 am"},
    {"text":"  Every day","status":false,"time":"05:30 am"},
    {"text":"","status":true,"time":"09:00 am"},
    {"text":"  Today ","status":false,"time":"03.00 am"},

  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: Text("Your Alarms!"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
             // SizedBox(height: 30.h,),
              Container(
                height:560.h ,
                width: 400.w,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: alarms.length,
                  itemBuilder: (context, i) {
                    return Container(
                      margin: EdgeInsets.all(5),
                      height:65.h ,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white70, width: .3.w),
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: ListTile(
                        title: Text("${alarms[i]["time"]}", style: TextStyle(fontSize: 23, color: Colors.white, fontWeight: FontWeight.normal),),
                        subtitle: Text(alarms[i]["text"], style: TextStyle(color: Colors.white, fontSize: 15),),
                        trailing:
                        Switch(
                          value: alarms[i]["status"],
                          onChanged: (newVal) {
                            setState(() {
                              alarms[i]["status"] = newVal;
                            });
                          },
                          inactiveThumbColor: Colors.white,
                          inactiveTrackColor: Colors.black12,
                          activeTrackColor: Colors.green,
                          activeColor: Colors.white,
                        ),
                      ),
                    );
                  }),
              )
            ],
          )
        ),
      ),
    );
  }
}
