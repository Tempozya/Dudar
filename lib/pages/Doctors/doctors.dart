import 'package:dudar/coustom_bottom_nav_bar.dart';
import 'package:dudar/custom_app_bar.dart';
import 'package:dudar/enums.dart';
import "package:flutter/material.dart";

import 'components/body.dart';

class DoctorsScreen extends StatelessWidget {
  static String routeName = "/doctors";

  const DoctorsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Доктора',
      ),
      body: const Body(),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.doctors),
    );
  }
}
