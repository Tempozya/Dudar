import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Color(0xFFE7EFFA),
    fontFamily: "RobotoMedium",
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    //inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryIconTheme: iconTheme(),

  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color: kTextColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    // If  you are using latest version of flutter then lable text and hint text shown like this
    // if you r using flutter less then 1.20.* then maybe this is not working properly
    // if we are define our floatingLabelBehavior in our theme then it's not applayed
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

TextTheme textTheme() {
  return const TextTheme(
    bodyText1: TextStyle(color: Colors.white),
    bodyText2: TextStyle(color:   Color(0xFF535353)),
  );
}

IconThemeData iconTheme() {
  return IconThemeData(color: Colors.black);
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    //centerTitle: true,
    backgroundColor: Color(0xFF5166FC),
    elevation: 3,
    iconTheme: IconThemeData(color: Color(0xFFFFFFFF)),
    titleTextStyle: TextStyle(color: Color(0xFFFFFFFF),fontSize: 23,fontFamily: 'RobotoBold')
  );
}
