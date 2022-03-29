import 'package:dudar/pages/Calendar/calendar.dart';
import 'package:dudar/pages/Diagnosis/diag.dart';
import 'package:dudar/pages/Login/Login.dart';
import 'package:dudar/pages/Onboarding/onboard.dart';
import 'package:dudar/pages/Profile/helps/help.dart';
import 'package:dudar/pages/Profile/myprofile/myprofile.dart';
import 'package:dudar/pages/Profile/settings/settings.dart';
import 'package:dudar/pages/Registration/Registrarion.dart';
import 'package:dudar/pages/SplashScreen/splashScreen.dart';
import 'package:dudar/pages/loading.dart';
import 'package:flutter/widgets.dart';
import 'package:dudar/pages/Home/home.dart';
import 'package:dudar/pages/Notification/notification.dart';
import 'package:dudar/pages/Profile/profile.dart';
import 'package:dudar/pages/Doctors/doctors.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  CalendarScreen.routeName: (context) => CalendarScreen(),
  DoctorsScreen.routeName: (context) => DoctorsScreen(),
  NotificationScreen.routeName: (context) => NotificationScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  Onboarding.routeName: (context) => Onboarding(),
  SplashsScreen.routeName: (context) => SplashsScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  SettingsScreen.routeName: (context) => SettingsScreen(),
  MyProfileScreen.routeName: (context) => MyProfileScreen(),
  HelpScreen.routeName: (context) => HelpScreen(),
  DiagnosScreen.routeName: (context) => DiagnosScreen(),
  SplashScreenPage.routeName: (context) => SplashScreenPage(),
  
};
