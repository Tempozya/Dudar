import 'package:dudar/custom_app_bar.dart';
import 'package:dudar/pages/Home/components/body.dart';
import 'package:flutter/material.dart';
import 'package:dudar/coustom_bottom_nav_bar.dart';
import 'package:dudar/enums.dart';
import 'package:dudar/UserData/getAPIdata.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: CustomAppBar(
        title: "Главная",
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
