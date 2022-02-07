import 'package:flutter/material.dart';
import 'package:dudar/Other/outlinedButton.dart';
import 'package:dudar/Other/textField.dart';


class SignUpScreen extends StatelessWidget {
  static String routeName = "/signup";

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
              "Регистрация",
              style: TextStyle(
                color: Color(0xff172b4d),
                fontSize: 32,
                fontFamily: 'RobotoBold'
                ,
              ),
            ),
            SizedBox(height: 12),
            AppTextField(
              hint: "Логин",
              icon: Icon(Icons.email),
              helpOnTap: () {},
              obscureText: false,
              helpContent: Container(),
            ),
            SizedBox(height: 12),
            AppTextField(
              hint: "Пароль",
              icon: Icon(Icons.lock),
              obscureText: true,
              helpContent: Container(),
              helpOnTap: () {},
            ),
            SizedBox(height: 12),
            FlatButton(
              color: Color(0xff0065ff),
              padding: EdgeInsets.all(16),
              child: Text(
                "Создать",
                style: TextStyle(color: Colors.white, fontSize: 18,fontFamily: 'RobotoBold'),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              onPressed: () {},
            ),
            SizedBox(height: 24),
            Text(
              "или зарегистрируйтесь с помощью",
              style: TextStyle(color: Colors.black38),
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