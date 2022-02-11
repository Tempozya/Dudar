import 'package:dudar/Other/FadeRoute.dart';
import 'package:dudar/pages/Home/home.dart';
import 'package:dudar/pages/Profile/profile.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;
import 'package:dudar/pages/Registration/Registrarion.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:dudar/Other/outlinedButton.dart';
import 'package:dudar/Other/textField.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "/login";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> {
  late TapGestureRecognizer registerOnTap;

  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future auth() async {
    var url = Uri.parse("http://api.c9113991.beget.tech/api/Auth/auth.php");
    var response = await http.post(url, body: {
      "login": user.text,
      "password": pass.text,
    });

    var data = json.decode(response.body);
    if (data == "AuthSuccess") {
      Fluttertoast.showToast(
          msg: "Вы успешно авторизированы",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16);

      Navigator.pushAndRemoveUntil(context, FadeRoute(page: ProfileScreen()),
          (Route<dynamic> route) => false);
    } else {
      Fluttertoast.showToast(
          msg: "Неверные данные",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16);
    }
  }

  @override
  void initState() {
    registerOnTap = TapGestureRecognizer();
    registerOnTap.onTap = () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => SignUpScreen(),
        ),
      );
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: ListView(
          children: [
            Image.asset(
              "assets/images/login.jpg",
              height: 250,
            ),
            const Text(
              "Вход",
              style: TextStyle(
                fontFamily: 'RobotoBold',
                color: Color(0xff172b4d),
                fontSize: 32,
              ),
            ),
            SizedBox(height: 12),
            AppTextField(
              controller: user,
              hint: "Логин",
              icon: Icon(Icons.email),
              helpOnTap: () {},
              helpContent: Container(),
              obscureText: false,
            ),
            SizedBox(height: 12),
            AppTextField(
              controller: pass,
              obscureText: true,
              hint: "Пароль",
              icon: Icon(Icons.email),
              helpContent: const Text(
                "Забыли?",
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff0065ff),
                    fontFamily: 'RobotoBold'),
              ),
              helpOnTap: () {},
            ),
            const SizedBox(height: 12),
            FlatButton(
              color: Color(0xff0065ff),
              padding: EdgeInsets.all(16),
              child: const Text(
                "Вход",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'RobotoBold'),
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              onPressed: () {
                auth();
                /* Navigator.pushAndRemoveUntil(
                    context,
                    FadeRoute(page: CalendarScreen()),
                    (Route<dynamic> route) => false);*/
              },
            ),
            SizedBox(height: 24),
            const Text(
              "или войдите с помощью",
              style: TextStyle(color: Colors.black38, fontFamily: 'RobotoBold'),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: AppOutlineButton(
                    asset: "assets/images/sber.png",
                    onTap: () {},
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: AppOutlineButton(
                    asset: "assets/images/Gosuslugi.png",
                    onTap: () {},
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Text.rich(
              TextSpan(
                text: "Нет аккаунта? ",
                children: [
                  TextSpan(
                    text: "Регистрация",
                    style: TextStyle(
                      color: Color(0xff0065ff),
                      fontFamily: 'RobotoBold',
                    ),
                    recognizer: registerOnTap,
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
