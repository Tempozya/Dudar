import 'package:dudar/pages/Doctors/doctors.dart';
import 'package:dudar/pages/Login/Login.dart';
import 'package:dudar/pages/Onboarding/onboard.dart';
import 'package:dudar/pages/SplashScreen/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:dudar/routes.dart';
import 'package:dudar/pages/Profile/profile.dart';
import 'package:dudar/theme.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute: DoctorsScreen.routeName,
      routes: routes,
    );
  }
}