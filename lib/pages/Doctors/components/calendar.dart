import 'package:dudar/pages/Doctors/components/symptomMain.dart';
import 'package:flutter/cupertino.dart';

import 'event.dart';
import 'symptomDialog.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'global.dart' as global;

class Calendar extends StatefulWidget {
  @override
  CalendarState createState() => CalendarState();
}

class CalendarState extends State<Calendar> {
  @override
  CalendarFormat format = CalendarFormat.week;
  DateTime focusedDay = DateTime.now();
  @override
  List<Event> getEventsfromDay(DateTime date) {
    return global.selectedEvents[date] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TableCalendar(
            locale: 'ru-RU',
            focusedDay: global.selectedDay,
            firstDay: DateTime(1990),
            lastDay: DateTime.now(),
            calendarFormat: format,
            startingDayOfWeek: StartingDayOfWeek.monday,
            daysOfWeekVisible: true,

            //Day Changed
            onDaySelected: (DateTime selectDay, DateTime focusDay) {
              setState(() {
                global.selectedDay = selectDay;
                focusedDay = focusDay;
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => StatefulBuilder(
                        builder: (context, setState) => sympDialog()),
                    fullscreenDialog: true,
                  ),
                );
              });
            },
            selectedDayPredicate: (DateTime date) {
              return isSameDay(global.selectedDay, date);
            },

            eventLoader: getEventsfromDay,

            //To style the Calendar
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
              markerDecoration: BoxDecoration(color: Colors.deepOrange),
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
                //shape: BoxShape.circle,
                borderRadius: BorderRadius.circular(25.0),
              ),
              selectedTextStyle: TextStyle(color: Colors.white),
              todayDecoration: BoxDecoration(
                //color: Colors.indigo,
                //shape: BoxShape.circle,
                borderRadius: BorderRadius.circular(25.0),
              ),
              todayTextStyle: TextStyle(color: Colors.deepOrangeAccent),
              defaultDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(25.0),
              ),
              weekendDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              formatButtonShowsNext: false,
              formatButtonDecoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5.0),
              ),
              formatButtonTextStyle: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          symptomMain()
        ],
      ),

      /*floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(

                  builder: (BuildContext context) => StatefulBuilder(
                      builder: (context, setState) => sympDialog()
                  ) ,
                  fullscreenDialog: true,
                ),
              );
            },
            label: Text('Отметить'))*/

      /*floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(

            title: Text("Симптомы"),
            content: Column(
              children: <Widget>[
                TextFormField(
                controller: _eventController,),
                Row(
                children: [
                  Text('Головная боль'),
                  ValueListenableBuilder<bool>(
                    valueListenable: isSwitched,
                    builder: (context, currentState, child) {
                      return Switch(
                        value: currentState,
                        onChanged: (value) {
                          isSwitched.value = value;
                        },
                        activeTrackColor: Colors.lightGreenAccent,
                        activeColor: Colors.green,
                      );
                    }),
                ]




                )
                ,]
          ),
            actions: [
              TextButton(
                child: Text("Закрыть"),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                child: Text("Сохранить"),
                onPressed: () {
                  if (_eventController.text.isEmpty) {

                  } else {
                    if (selectedEvents[selectedDay] != null) {
                      selectedEvents[selectedDay]?.add(
                        Event(title: _eventController.text),
                      );
                    } else {
                      selectedEvents[selectedDay] = [
                        Event(title: _eventController.text)
                      ];
                    }

                  }
                  Navigator.pop(context);
                  _eventController.clear();
                  setState((){});
                  return;
                },
              ),
            ],
          ),
        ),
        label: Text("Отметить"),
        icon: Icon(Icons.add_rounded),

      ),*/
    );
  }
}
