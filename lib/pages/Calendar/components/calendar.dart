import 'package:dudar/Other/httpRequest.dart';
import 'package:dudar/pages/Calendar/components/symptomMain.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'global.dart' as global;

class Calendar extends StatefulWidget {
  @override
  CalendarState createState() => CalendarState();
}

class CalendarState extends State<Calendar> {
  CalendarFormat format = CalendarFormat.week;
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TableCalendar(
            locale: 'ru-RU',
            focusedDay: global.selectedDay,
            firstDay: DateTime(2021),
            lastDay: DateTime.now(),
            calendarFormat: format,
            startingDayOfWeek: StartingDayOfWeek.monday,
            daysOfWeekVisible: true,

            //Day Changed

            onDaySelected: (DateTime selectDay, DateTime focusDay) {
              setState(() {
                global.selectedDay = selectDay;
                focusedDay = focusDay;
                GetSymptoms().getData();
                print('tap');
                symptomMain();
              });
            },
            selectedDayPredicate: (DateTime date) {
              return isSameDay(global.selectedDay, date);
            },

            onPageChanged: (focusedDay) {
              focusedDay = focusedDay;
            },

            //To style the Calendar
            calendarStyle: const CalendarStyle(
              outsideDaysVisible: true,
              isTodayHighlighted: true,
              markerDecoration: BoxDecoration(color: Colors.deepOrange),
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
                //borderRadius: BorderRadius.circular(25.0),
              ),
              selectedTextStyle: TextStyle(color: Colors.white),
              todayDecoration: BoxDecoration(
                //color: Colors.indigo,
                shape: BoxShape.circle,
                //borderRadius: BorderRadius.circular(25.0),
              ),
              todayTextStyle: TextStyle(color: Colors.deepOrangeAccent),
              defaultDecoration: BoxDecoration(
                shape: BoxShape.circle,
                //borderRadius: BorderRadius.circular(25.0),
              ),
              weekendDecoration: BoxDecoration(
                shape: BoxShape.circle,
                //borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              formatButtonShowsNext: false,
            ),
          ),
          symptomMain()
        ],
      ),
    );
  }
}
