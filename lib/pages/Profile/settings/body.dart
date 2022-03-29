import 'package:flutter/material.dart';


class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String dropdownValueLanguage = 'Русский';
  String dropdownValueTheme = 'Светлая';
  bool notificationState = false;
  bool notificationSound = false;
  bool notificationVibrate = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Настройки системы",
                style: TextStyle(
                    fontSize: 16, color: Color.fromARGB(255, 135, 135, 135)),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 216, 216, 216),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Язык",
                        style: TextStyle(fontSize: 16),
                      ),
                      DropdownButton<String>(
                        value: dropdownValueLanguage,
                        icon: const Icon(Icons.keyboard_arrow_right_rounded),
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        underline: Container(
                          height: 0,
                          color: Colors.grey,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValueLanguage = newValue!;
                          });
                        },
                        items: <String>['Русский', 'English', '中國人']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Тема",
                        style: TextStyle(fontSize: 16),
                      ),
                      DropdownButton<String>(
                        value: dropdownValueTheme,
                        icon: const Icon(Icons.keyboard_arrow_right_rounded),
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        underline: Container(
                          height: 0,
                          color: Colors.grey,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValueTheme = newValue!;
                          });
                        },
                        items: <String>['Светлая', 'Тёмная']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Уведомления",
                style: TextStyle(
                    fontSize: 16, color: Color.fromARGB(255, 135, 135, 135)),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 216, 216, 216),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Уведомления",
                          style: TextStyle(fontSize: 16),
                        ),
                        Switch(
                          value: notificationState,
                          onChanged: (value) {
                            setState(() {
                              notificationState = value;
                            });
                          },
                        ),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Звук",
                          style: TextStyle(fontSize: 16),
                        ),
                        Switch(
                          value: notificationSound,
                          onChanged: (value) {
                            setState(() {
                              notificationSound = value;
                            });
                          },
                        ),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Вибрация",
                          style: TextStyle(fontSize: 16),
                        ),
                        Switch(
                          value: notificationVibrate,
                          onChanged: (value) {
                            setState(() {
                              notificationVibrate = value;
                            });
                          },
                        ),
                      ]),
                ])),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Память",
                style: TextStyle(
                    fontSize: 16, color: Color.fromARGB(255, 135, 135, 135)),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 216, 216, 216),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Кэш",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "52,6 МБ",
                          style: TextStyle(fontSize: 16),
                        ),
                      ]),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    ElevatedButton(
                        child: Text("Очистить кэш"), onPressed: () {})
                  ]),
                ])),
          ],
        ));
  }
}
