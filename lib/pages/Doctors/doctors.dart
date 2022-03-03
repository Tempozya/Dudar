import 'package:badges/badges.dart';
import 'package:dudar/coustom_bottom_nav_bar.dart';
import 'package:dudar/enums.dart';
import "package:flutter/material.dart";

import 'components/body.dart';

class DoctorsScreen extends StatelessWidget {
  static String routeName = "/doctors";

  const DoctorsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Врачи"),
        actions: [
          IconButton(
            onPressed: () => {},
            icon: Badge(
              badgeContent: const Text(
                '5',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              child: const Icon(Icons.notifications, size: 28),
              position: BadgePosition.topEnd(top: -10, end: -5),
              animationType: BadgeAnimationType.slide,
              animationDuration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.all(5),
            ),
          ),
          IconButton(
              onPressed: () => {},
              icon: const Icon(
                Icons.person,
                size: 28,
              )),
        ],
      ),
      body: const Body(),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.doctors),
    );
  }
}
