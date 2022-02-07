

import 'package:dudar/pages/Doctors/doctors.dart';
import 'package:dudar/pages/Login/Login.dart';
import 'package:dudar/pages/Onboarding/onboard.dart';
import 'package:dudar/pages/Registration/Registrarion.dart';
import 'package:dudar/pages/SplashScreen/splashScreen.dart';
import 'package:flutter/widgets.dart';
import 'package:dudar/pages/Home/home.dart';
import 'package:dudar/pages/Notification/notification.dart';
import 'package:dudar/pages/Profile/profile.dart';


// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  CalendarScreen.routeName: (context) => CalendarScreen(),
  DoctorsScreen.routeName: (context) => DoctorsScreen(),
  NotificationScreen.routeName: (context) => NotificationScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  Onboarding.routeName: (context) => Onboarding(),
  SplashScreen.routeName: (context) => SplashScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),

};
