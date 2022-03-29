import 'package:dudar/coustom_bottom_nav_bar.dart';
import 'package:dudar/custom_app_bar.dart';
import 'package:dudar/enums.dart';
import 'package:dudar/pages/Diagnosis/body.dart';
import "package:flutter/material.dart";

class DiagnosScreen extends StatelessWidget {
  static String routeName = "/diagnosis";

  const DiagnosScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Диагностика',
      ),
      body: const Body(),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.diagnosis),
    );
  }
}
