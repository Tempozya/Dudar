import 'package:dudar/constants.dart';
import 'package:dudar/enums.dart';
import 'package:dudar/pages/Doctors/doctors.dart';
import 'package:dudar/pages/Home/home.dart';
import 'package:dudar/pages/Notification/notification.dart';
import 'package:dudar/pages/Profile/profile.dart';
import 'package:dudar/Other/FadeRoute.dart';
import 'package:flutter/material.dart';



class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFF8FB6FF);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  icon: Icon(Icons.home_rounded,size: 27,),
                  color: MenuState.calendar == selectedMenu ? kPrimaryColor : inActiveIconColor  ,
                  onPressed: () => Navigator.pushAndRemoveUntil(context, FadeRoute(page: CalendarScreen()),(Route<dynamic> route) => false),
              ),
              IconButton(
                icon: Icon(Icons.calendar_today_rounded,size: 27),
                color: MenuState.doctors == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
                onPressed: () => Navigator.pushAndRemoveUntil(context, FadeRoute(page: DoctorsScreen()),(Route<dynamic> route) => false),
              ),
              IconButton(
                icon: Icon(Icons.health_and_safety,size: 27),
                color: MenuState.notifications == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
                onPressed: () => Navigator.pushAndRemoveUntil(context, FadeRoute(page: NotificationScreen()),(Route<dynamic> route) => false),
              ),
              IconButton(
                icon: Icon(Icons.assessment,size: 27),
                  color: MenuState.profile == selectedMenu
                      ? kPrimaryColor
                      : inActiveIconColor,
                onPressed: () => Navigator.pushAndRemoveUntil(context, FadeRoute(page: ProfileScreen()),(Route<dynamic> route) => false),
              ),
            ],
          )),
    );
  }
}
