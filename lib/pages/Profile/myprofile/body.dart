import 'package:dudar/Other/notification_api.dart';
import 'package:dudar/Other/textFieldProfile.dart';
import 'package:dudar/pages/Profile/components/profile_pic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:dudar/UserData/alluserdata.dart' as UserData;
import 'package:dudar/UserData/getAPIdata.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController fullname = TextEditingController(text: UserData.fio);
  TextEditingController email = TextEditingController(text: UserData.email);
  TextEditingController birth =
      TextEditingController(text: UserData.birthday.toString());
  TextEditingController phone = TextEditingController(text: UserData.phone);

  TextEditingController passport =
      TextEditingController(text: UserData.passport);
  TextEditingController snils = TextEditingController(text: UserData.snils);
  TextEditingController polis = TextEditingController(text: UserData.polis);

  int? _gen = int.parse(UserData.sex);

  var birthday = UserData.birthday;
  void initState() {
    super.initState();

    tz.initializeTimeZones();
  }

  @override
  Widget build(BuildContext context) {
    getData();
    NotificationService()
        .showNotification(1, "Профиль", "Вы зашли в профиль", 10);
    return SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(children: [
          ProfilePic(),
          SizedBox(height: 15),
          SizedBox(height: 15),
          AppTextField(
            controller: fullname,
            hint: "ФИО",
            icon: Icon(Icons.person, color: Color(0xFF5166FC)),
            actionOnTap: () => {},
          ),
          SizedBox(height: 15),
          AppTextField(
            controller: email,
            hint: "Почта",
            icon: Icon(Icons.email, color: Color(0xFF5166FC)),
            actionOnTap: () => {},
          ),
          SizedBox(height: 15),
          InkWell(
            onTap: () => {
              DatePicker.showDatePicker(context,
                  showTitleActions: true,
                  minTime: DateTime(1900, 1, 1),
                  maxTime: DateTime.now(),
                  onChanged: (date) {}, onConfirm: (date) {
                setState(() => birthday = date);
                birth.text = DateFormat.d('ru').format(birthday) +
                    " " +
                    DateFormat.LLLL('ru').format(birthday) +
                    " " +
                    DateFormat.y('ru').format(birthday);
              }, currentTime: DateTime.now(), locale: LocaleType.ru)
            },
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                border: Border.all(color: Colors.black12),
                color: Color.fromARGB(66, 184, 184, 184),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.calendar_today_outlined, color: Color(0xFF5166FC)),
                  SizedBox(
                    width: 10,
                  ),
                  birthday == null
                      ? Text("Дата рождения",
                          style: TextStyle(
                              color: Colors.black38,
                              fontFamily: 'RobotoBold',
                              fontSize: 14))
                      : Text(
                          DateFormat.d('ru').format(birthday) +
                              " " +
                              DateFormat.LLLL('ru').format(birthday) +
                              " " +
                              DateFormat.y('ru').format(birthday),
                          style: TextStyle(
                              color: Color.fromARGB(200, 0, 0, 0),
                              fontFamily: 'RobotoBold',
                              fontSize: 14),
                        ),
                ],
              ),
            ),
          ),
          SizedBox(height: 15),
          AppTextField(
            controller: phone,
            hint: "+7 (999) 999-99-99",
            icon: Icon(Icons.phone, color: Color(0xFF5166FC)),
            actionOnTap: () => {},
            mask: "+# (###) ###-##-##",
          ),
          SizedBox(height: 15),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(
              'Пол',
              style: TextStyle(fontSize: 16),
            ),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ListTile(
                  title: const Text('Муж'),
                  leading: Radio(
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => Color(0xFF5166FC)),
                    value: 1,
                    groupValue: _gen,
                    onChanged: (int? value) {
                      setState(() {
                        _gen = value;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: const Text('Жен'),
                  leading: Radio(
                    fillColor: MaterialStateColor.resolveWith(
                        (states) => Color(0xFF5166FC)),
                    value: 0,
                    groupValue: _gen,
                    onChanged: (int? value) {
                      setState(() {
                        _gen = value;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(
              'Документы',
              style: TextStyle(fontSize: 16),
            ),
          ]),
          SizedBox(height: 15),
          AppTextField(
            controller: passport,
            hint: "Паспорт",
            icon: Icon(Icons.document_scanner, color: Color(0xFF5166FC)),
            actionOnTap: () => {},
            mask: "#### ######",
          ),
          SizedBox(height: 15),
          AppTextField(
            controller: snils,
            hint: "СНИЛС",
            icon: Icon(Icons.article, color: Color(0xFF5166FC)),
            actionOnTap: () => {},
            mask: "###-###-### ##",
          ),
          SizedBox(height: 15),
          AppTextField(
            controller: polis,
            hint: "Полис ОМС",
            icon: Icon(Icons.wysiwyg, color: Color(0xFF5166FC)),
            actionOnTap: () => {},
            mask: "###########",
          ),
          SizedBox(height: 15),
          Container(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => {update()}, child: Text("Сохранить")))
        ]));
  }

  Future<void> update() async {
    UserData.fio = fullname.text;
    UserData.email = email.text;
    UserData.birthday = birthday;
    UserData.phone = phone.text;
    UserData.passport = passport.text;
    UserData.snils = snils.text;
    UserData.polis = polis.text;
    UserData.sex = _gen.toString();
    setData();
  }
}
