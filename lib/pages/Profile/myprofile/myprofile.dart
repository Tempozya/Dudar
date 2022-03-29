import 'package:dudar/UserData/getAPIdata.dart';
import 'package:dudar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:dudar/coustom_bottom_nav_bar.dart';
import 'package:dudar/enums.dart';

import 'body.dart';

class MyProfileScreen extends StatelessWidget {
  static String routeName = "/myprofile";
  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: CustomAppBar(title: 'Аккаунт',),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
