import 'package:badges/badges.dart';
import 'package:dudar/Other/FadeRoute.dart';
import 'package:dudar/UserData/alluserdata.dart';
import 'package:dudar/pages/Notification/notification.dart';
import 'package:dudar/pages/Profile/profile.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  final String title;
  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(60);
  @override
  Widget get child => Container();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Stack(children: [
      Container(
        height: height * .15,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 212, 229, 255),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
        ),
      ),
      SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(0),
                      child: InkWell(
                        onTap: () => Navigator.pushAndRemoveUntil(
                            context,
                            FadeRoute(page: ProfileScreen()),
                            (Route<dynamic> route) => false),
                        child: SizedBox(
                          height: 48,
                          width: 48,
                          child: CircleAvatar(
                              child: ClipOval(
                            child: userAvatar != null
                                ? Image.file(
                                    userAvatar!,
                                    fit: BoxFit.cover,
                                    width: 48,
                                    height: 48,
                                  )
                                : Image.asset("assets/images/noneAvatar.png"),
                          )),
                        ),
                      ),
                    ),
                    Text(
                      title,
                      style: TextStyle(fontFamily: 'RobotoBold', fontSize: 22),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        padding: EdgeInsets.symmetric(horizontal: 0),
                        onPressed: () => {
                          Navigator.pushAndRemoveUntil(
                              context,
                              FadeRoute(page: NotificationScreen()),
                              (Route<dynamic> route) => false)
                        },
                        icon: Badge(
                          badgeContent: Text(
                            userCountNotificate.toString(),
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          child:
                              Icon(Icons.notifications_none_rounded, size: 28),
                          position: BadgePosition.topEnd(top: -10, end: -5),
                          animationType: BadgeAnimationType.slide,
                          animationDuration: Duration(milliseconds: 300),
                          padding: EdgeInsets.all(5),
                        ),
                      ),
                    ),
                  ],
                )
              ])))
    ]);

    /*AppBar(title: Text(title), actions: [
      IconButton(
        padding: EdgeInsets.symmetric(horizontal: 20),
        onPressed: () => {
          Navigator.pushAndRemoveUntil(
              context,
              FadeRoute(page: NotificationScreen()),
              (Route<dynamic> route) => false)
        },
        icon: Badge(
          badgeContent: Text(
            userCountNotificate.toString(),
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          child: Icon(Icons.notifications, size: 28),
          position: BadgePosition.topEnd(top: -10, end: -5),
          animationType: BadgeAnimationType.slide,
          animationDuration: Duration(milliseconds: 300),
          padding: EdgeInsets.all(5),
        ),
      ),
    ]);
  }*/
  }
}
