import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dudar/pages/Calendar/components/SingleChoice.dart';
import 'package:flutter/material.dart';
import 'package:dudar/pages/Calendar/components/global.dart' as global;
import 'package:intl/intl.dart'; // for date format
import 'package:intl/date_symbol_data_local.dart';

class Modal extends StatefulWidget {
  const Modal({Key? key}) : super(key: key);

  @override
  _ModalState createState() => _ModalState();
}

class _ModalState extends State<Modal> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.8,
        maxChildSize: 0.8,
        minChildSize: 0.6,
        builder: (BuildContext context, ScrollController scrollController) =>
            Container(
              //color: Colors.grey.shade200,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0))),

              child: Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(padding: const EdgeInsets.only(left: 40)),
                      const Text(
                        'Симптомы',
                        style:
                            TextStyle(fontFamily: 'RobotoBold', fontSize: 20),
                      ),
                      IconButton(
                          icon: const Icon(Icons.cancel_rounded),
                          color: Colors.grey,
                          onPressed: () =>
                              {} /*async {
                          int flag = (isSwitched) ? 1 : 0;
                          await DatabaseHelper.instance.add(Symptoms(
                            selectedDay:
                                DateFormat.yMd().format(global.selectedDay),
                            ill: flag,
                          ));
                          setState(() {});
                          Navigator.pop(context);
                        },*/
                          ),
                    ]),
                Expanded(
                  child: ListView(
                    children: [
                      const Divider(
                        color: Color.fromARGB(255, 87, 86, 86),
                        indent: 12,
                        endIndent: 12,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 16),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Я болею',
                                  style: TextStyle(
                                      fontFamily: 'RobotoBold', fontSize: 16)),
                              Switch(
                                value: isSwitched,
                                onChanged: (value) {
                                  setState(() => isSwitched = value);
                                },
                              ),
                            ]),
                      ),
                      const Divider(
                        color: Color.fromARGB(255, 87, 86, 86),
                        indent: 12,
                        endIndent: 12,
                      ),
                      buildSymptom(),
                      ElevatedButton(
                        onPressed: () {
                          createSymptom();
                        },
                        child: Text('Tap'),
                      )
                    ],
                  ),
                )
              ]),
            ));
  }

  Container buildText(String title) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
        child: Text(title,
            style: TextStyle(fontFamily: 'RobotoBold', fontSize: 16)));
  }

  ListBody buildSymptom() {
    return ListBody(children: [
      for (var item in global.listSymptom.entries) SingleChoice(list: item.key)
    ]);
  }

  @override
  Future createSymptom() async {
    var url = Uri.parse(
        "http://api.c9113991.beget.tech/v1.0/api/symptom/saveData.php");
    var response = await http.post(url, body: {
      "user_id": "1",
      "sick": ((isSwitched) ? 1 : 0).toString(),
      "symptoms": jsonEncode(global.listTag),
      "dates": DateFormat('yyyy-MM-dd').format(global.selectedDay),
    });
  }
}
