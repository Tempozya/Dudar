import 'dart:convert' show json;
import 'package:flutter/material.dart';
import 'package:dudar/Other/outlinedButton.dart';
import 'package:dudar/Other/textField.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatelessWidget {
  static String routeName = "/signup";
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future registration() async {
    var url = Uri.parse("http://api.c9113991.beget.tech/api/Auth/register.php");
    var response = await http.post(url, body: {
      "login": user.text,
      "password": pass.text,
    });

    var data = json.decode(response.body);
    if (data == "LoginBusy") {
      Fluttertoast.showToast(
          msg: "Данный логин занят",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16);
    } else {
      Fluttertoast.showToast(
          msg: "Аккаунт успешно создан",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView(
          children: [
            Image.asset(
              "assets/images/login.jpg",
              height: 250,
            ),
            const Text(
              "Регистрация",
              style: TextStyle(
                color: Color(0xff172b4d),
                fontSize: 32,
                fontFamily: 'RobotoBold',
              ),
            ),
            const SizedBox(height: 12),
            AppTextField(
              controller: user,
              hint: "Логин",
              icon: const Icon(Icons.email),
              helpOnTap: () {},
              obscureText: false,
              helpContent: Container(),
            ),
            const SizedBox(height: 12),
            AppTextField(
              controller: pass,
              hint: "Пароль",
              icon: const Icon(Icons.lock),
              obscureText: true,
              helpContent: Container(),
              helpOnTap: () {},
            ),
            const SizedBox(height: 12),
            FlatButton(
              color: const Color(0xff0065ff),
              padding: const EdgeInsets.all(16),
              child: const Text(
                "Создать",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'RobotoBold'),
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  const Radius.circular(16),
                ),
              ),
              onPressed: () {
                registration();
              },
            ),
            const SizedBox(height: 24),
            const Text(
              "или зарегистрируйтесь с помощью",
              style: TextStyle(color: Colors.black38),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: AppOutlineButton(
                    asset: "assets/images/sber.png",
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: AppOutlineButton(
                    asset: "assets/images/Gosuslugi.png",
                    onTap: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text.rich(
              TextSpan(
                text: "Уже есть аккаунт? ",
                children: [
                  TextSpan(
                    text: "Вход",
                    style: TextStyle(
                      color: Color(0xff0065ff),
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: null,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54),
            )
          ],
        ),
      ),
    );
  }
}
