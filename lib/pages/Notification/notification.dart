import 'package:dudar/custom_app_bar.dart';
import 'package:dudar/pages/Notification/components/body.dart';
import 'package:flutter/material.dart';
import 'package:dudar/coustom_bottom_nav_bar.dart';
import 'package:dudar/enums.dart';

class NotificationScreen extends StatelessWidget {
  static String routeName = "/notification";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Уведомления',
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
