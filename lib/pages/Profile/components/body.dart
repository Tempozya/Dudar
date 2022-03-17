import 'package:dudar/Other/FadeRoute.dart';
import 'package:dudar/pages/Login/Login.dart';
import 'package:dudar/pages/Profile/components/profile_pic.dart';
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
  @override
  void initState() {
    super.initState();
    _getLogg();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          SizedBox(height: 20),
          Text(_logged),
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
            press: () {},
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
    final logged = prefs.getString('logged');
    if (logged != null) {
      setState((() => _logged = logged));
    }
  }

  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    final success = await prefs.remove('logged');
    Navigator.pushAndRemoveUntil(context, FadeRoute(page: LoginScreen()),
        (Route<dynamic> route) => false);
  }
}
