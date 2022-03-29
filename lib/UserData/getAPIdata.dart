import 'package:dudar/UserData/alluserdata.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json, jsonDecode;
import 'package:shared_preferences/shared_preferences.dart';

Future getData() async {
  final prefs = await SharedPreferences.getInstance();
  final success = await prefs.getString('logged');
  var url =
      Uri.parse("http://api.c9113991.beget.tech/v1.0/api/Auth/UserData.php");
  var response = await http.post(url, body: {
    "login": success,
  });

  Map data = jsonDecode(response.body);
  fio = data['FIO'];
  if (fio != "") {
    List<String> fio = data['FIO'].split(' ');
    surname = fio[0];
    name = fio[1];
    await prefs.setString('name', name);
    patronymic = fio[2];
    //print(name);
  }
  birthday = DateTime.parse(data['birthday']);
  passport = data['passport'];
  snils = data['snils'];
  polis = data['medicalPolicy'];
  email = data['email'];
  phone = data['phone'];
  sex = data['sex'];
}

Future setData() async {
  final prefs = await SharedPreferences.getInstance();
  final login = await prefs.getString('logged');
  var url = Uri.parse(
      "http://api.c9113991.beget.tech/v1.0/api/Auth/UpdateUserData.php");
  var response = await http.post(url, body: {
    "FIO": fio,
    "birthday": birthday.toString(),
    "sex": sex,
    "passport": passport,
    "snils": snils,
    "medicalPolicy": polis,
    "email": email,
    "phone": phone,
    "login": login
  });

  var data = json.decode(response.body);
  if (data == "Success") {
    Fluttertoast.showToast(
        msg: "Данные успешно обновлены",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16);
  } else {
    Fluttertoast.showToast(
        msg: "Неверная попытка",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16);
  }
}

Future setSettings() async {
  var url = Uri.parse(
      "http://api.c9113991.beget.tech/v1.0/api/Auth/UpdateUserSettings.php");
  var response = await http.post(url,
      body: {"login": login, "countNotificate": userCountNotificate});
}
