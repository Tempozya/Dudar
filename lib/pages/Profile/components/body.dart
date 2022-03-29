import 'package:dudar/Other/FadeRoute.dart';
import 'package:dudar/UserData/alluserdata.dart';
import 'package:dudar/UserData/getAPIdata.dart';
import 'package:dudar/pages/Login/Login.dart';
import 'package:dudar/pages/Profile/helps/help.dart';
import 'package:dudar/pages/Profile/myprofile/myprofile.dart';
import 'package:dudar/pages/Profile/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'profile_menu.dart';

class Body extends StatefulWidget {
  @override
  BodyState createState() => BodyState();
}

class BodyState extends State<Body> {
  String _logged = "";
  String _name = "";
  @override
  void initState() {
    super.initState();
    _getLogg();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          SizedBox(height: 20),
          Text("Здравствуйте, $name",
              style: TextStyle(
                fontSize: 22,
                fontFamily: 'RobotoBold',
              )),
          SizedBox(height: 20),
          ProfileMenu(
            text: "Мой профиль",
            icon: Icons.account_circle_sharp,
            press: () =>
                {Navigator.push(context, FadeRoute(page: MyProfileScreen()))},
          ),
          ProfileMenu(
            text: "Настройки",
            icon: Icons.settings,
            press: () {
              Navigator.push(context, FadeRoute(page: SettingsScreen()));
            },
          ),
          ProfileMenu(
            text: "Помощь",
            icon: Icons.help,
            press: () {
              Navigator.push(context, FadeRoute(page: HelpScreen()));
            },
          ),
          ProfileMenu(
            text: "Выход",
            icon: Icons.logout,
            press: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Выход'),
                content:
                    const Text('Вы дествительно хотите выйти из аккаунта?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Отмена'),
                  ),
                  TextButton(
                    onPressed: () => logout(),
                    child: const Text('Да'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _getLogg() async {
    final prefs = await SharedPreferences.getInstance();
    final names = prefs.getString('name');
    final logged = prefs.getString('logged');

    if (names != null && logged != null) {
      setState((() {
        _name = names;
        _logged = logged;
      }));
    }
  }

  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    final removing = await prefs.remove('logged');
    Navigator.pushAndRemoveUntil(context, FadeRoute(page: LoginScreen()),
        (Route<dynamic> route) => false);
  }
}
