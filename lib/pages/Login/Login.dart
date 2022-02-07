import 'package:dudar/Other/FadeRoute.dart';
import 'package:dudar/pages/Home/home.dart';
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
  @override
  void initState() {
    registerOnTap = TapGestureRecognizer();
    registerOnTap
      ..onTap = () {
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
              hint: "Логин",
              icon: Icon(Icons.email), helpOnTap: () {  }, helpContent: Container(),
              obscureText: false,
            ),
            SizedBox(height: 12),
            AppTextField(
              obscureText: true,
              hint: "Пароль",
              icon:Icon(Icons.email) ,

              helpContent: const Text(
                "Забыли?",
                style: TextStyle(fontSize: 16, color:  Color(0xff0065ff),fontFamily: 'RobotoBold'),
              ),
              helpOnTap: () {},
            ),
            const SizedBox(height: 12),
            FlatButton(
              color:  Color(0xff0065ff),
              padding: EdgeInsets.all(16),
              child: const Text(
                "Вход",
                style: TextStyle(color: Colors.white, fontSize: 18,fontFamily: 'RobotoBold'),
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(context, FadeRoute(page: CalendarScreen()),(Route<dynamic> route) => false);
              },
            ),
            SizedBox(height: 24),
            const Text(
              "или войдите с помощью",
              style: TextStyle(color: Colors.black38,fontFamily: 'RobotoBold'),
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
                      color:  Color(0xff0065ff),
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
