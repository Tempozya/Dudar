import 'package:badges/badges.dart';
import 'package:dudar/pages/Notification/components/body.dart';
import 'package:flutter/material.dart';
import 'package:dudar/coustom_bottom_nav_bar.dart';
import 'package:dudar/enums.dart';



class NotificationScreen extends StatelessWidget {
  static String routeName = "/notification";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Уведомления"),
        actions: [
          IconButton(onPressed: () => {},
            icon:  Badge(
              badgeContent: Text('5',style: TextStyle(color: Colors.white,fontSize: 12),),
              child: Icon(Icons.notifications,size: 28),position: BadgePosition.topEnd(top:-10,end: -5),
              animationType: BadgeAnimationType.slide,
              animationDuration: Duration(milliseconds: 300),
              padding: EdgeInsets.all(5),

            ),

          ),
          IconButton(onPressed: () => {}, icon: Icon(Icons.person,size: 28,)),
        ],
      ),
      body: Body(),
      bottomNavigationBar:  CustomBottomNavBar(selectedMenu: MenuState.notifications),
    );
  }
}