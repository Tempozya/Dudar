import 'package:dudar/pages/Profile/components/profile_pic.dart';
import 'package:flutter/material.dart';
import 'profile_menu.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "Мой профиль",
            icon: Icons.account_circle_sharp,
            press: () => {},
          ),
          ProfileMenu(
            text: "Уведомления",
            icon: Icons.notifications,
            press: () {},
          ),
          ProfileMenu(
            text: "Настройки",
            icon: Icons.settings,
            press: () {},
          ),
          ProfileMenu(
            text: "Помощь",
            icon: Icons.help,
            press: () {},
          ),
          ProfileMenu(
            text: "Выход",
            icon: Icons.logout,
            press: () {},
          ),
        ],
      ),
    );
  }
}
