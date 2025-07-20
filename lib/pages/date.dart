import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';


class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(' Calendar',style: TextStyle(fontSize: 30,fontWeight: FontWeight.normal),),
        backgroundColor: Colors.orange,
      ),
      body: SfCalendar(
        view: CalendarView.month,
        dataSource: MeetingDataSource(_getDataSource()),
      ),
    );
  }

  List<Appointment> _getDataSource() {
    return [
      Appointment(
        startTime: DateTime.now(),
        endTime: DateTime.now().add(Duration(hours: 2)),
        subject: 'Team Meeting',
        color: Colors.blue,
      ),
    ];
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
