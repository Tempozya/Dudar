import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'event.dart';
import 'global.dart' as global;

class sympDialog extends StatefulWidget {

  @override
  _FullScreenDialog createState() => _FullScreenDialog();
}


class _FullScreenDialog extends State<sympDialog> {
  TextEditingController _eventController = TextEditingController();
  bool isSwitched = false;
  List<Event> getEventsfromDay(DateTime date) {
    return global.selectedEvents[date] ?? [];
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6200EE),
        title: Text('Симптомы'),
        actions: [
          IconButton(

              onPressed: () {


                if (_eventController.text.isEmpty) {

                } else {
                  if (global.selectedEvents[global.selectedDay] != null) {
                    global.selectedEvents[global.selectedDay]?.add(
                      Event(title: _eventController.text,gb: isSwitched),
                    );
                  } else {
                    global.selectedEvents[global.selectedDay] = [
                      Event(title: _eventController.text,gb: isSwitched)
                    ];
                  }

                }
                Navigator.pop(context);
                _eventController.clear();
                setState((){});
                return;
              }
              , icon: Icon(Icons.check))

        ],

      ),
      body: Column(
        children: <Widget>[
          ...getEventsfromDay(global.selectedDay).map(
                (Event event) =>
                Column(
                  children: [
                    Text(event.title),
                    Switch(
                      value: event.gb,
                      onChanged: (value) {

                      },
                      activeTrackColor: Colors.lightGreenAccent,
                      activeColor: Colors.green,
                    )
                  ]
                )


          ),

          TextFormField(
            controller: _eventController,),
          Row(
            children: [
              Text('Головная боль'),
              Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  },
                activeTrackColor: Colors.lightGreenAccent,
                activeColor: Colors.green,
                )

            ])]
    ));
  }
}
