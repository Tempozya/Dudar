import 'package:dudar/Other/FadeRoute.dart';
import 'package:dudar/UserData/getAPIdata.dart';
import 'package:dudar/pages/Home/home.dart';
import 'package:dudar/pages/Login/Login.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);
  static String routeName = "/loading";

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>
    with SingleTickerProviderStateMixin {
  late AnimationController anim;
  late var currentPage;
  @override
  void initState() {
    super.initState();
    checkAuth();
    anim = AnimationController(vsync: this, duration: Duration(seconds: 5));
    anim.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        Navigator.pushAndRemoveUntil(context, FadeRoute(page: currentPage),
            (Route<dynamic> route) => false);
      }
    });
  }

  @override
  void dispose() {
    anim.dispose();
    super.dispose();
  }

  @override
  Future<void> checkAuth() async {
    final prefs = await SharedPreferences.getInstance();
    final success = await prefs.getString('logged');
    if (success == null) {
      currentPage = LoginScreen();
    } else {
      getData();
      currentPage = HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30),
      color: Color.fromARGB(255, 202, 212, 243),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 7,
            child: Lottie.asset("assets/Lottie/loading.json", controller: anim,
                onLoaded: (composition) {
              anim.forward();
            }),
          ),
          Expanded(
            flex: 0,
            child: Text(
              "HealthCare Manager",
              style: TextStyle(
                  fontFamily: 'RobotoMedium',
                  fontSize: 20,
                  decoration: TextDecoration.none,
                  color: Color.fromARGB(255, 0, 0, 0)),
            ),
          ),
        ],
      ),
    );
  }
}
