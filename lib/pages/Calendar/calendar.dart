import 'package:dudar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:dudar/coustom_bottom_nav_bar.dart';
import 'package:dudar/enums.dart';

import 'components/body.dart';

class CalendarScreen extends StatelessWidget {
  static String routeName = "/calendar";

  const CalendarScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Календарь',
      ),
      body: const Body(),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.calendar),
    );
  }
}
