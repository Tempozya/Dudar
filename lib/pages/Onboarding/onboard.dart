import 'package:dudar/Other/FadeRoute.dart';
import 'package:dudar/pages/SplashScreen/splashScreen.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  static String routeName = "/Onboarding";
  const Onboarding({Key? key}) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentPage = 0;
  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                image:
                    DecorationImage(image: AssetImage("assets/images/bg.png"))),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 450,
                child: PageView(
                  controller: _pageController,
                  children: [
                    onBoardPage('Telemedicine', 'Запись к доктору',
                        'Записывайтесь к доктору '),
                    onBoardPage('Chat', 'Связь с доктором',
                        'Вам больше не надо ходить в поликлинику\nОбщайтесь с доктором в чате'),
                    onBoardPage('Farmacy', 'Запись к врачу',
                        'Записывайся и не жди загрузки как на Госуслугах'),
                    onBoardPage('Analytics', 'Следите за здоровьем',
                        'Записывайся и не жди загрузки как на Госуслугах')
                  ],
                  onPageChanged: (value) => {setCurrentPage(value)},
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) => getIndicator(index)),
              )
            ],
          ),
          buttonGo()
        ],
      ),
    );
  }

  void changePage() {
    if (currentPage == 3) {
      Navigator.pushAndRemoveUntil(context, FadeRoute(page: SplashsScreen()),
          (Route<dynamic> route) => false);
    } else {
      print(currentPage);
      _pageController.animateToPage(currentPage + 1,
          duration: Duration(milliseconds: 100), curve: Curves.linear);
      print(currentPage);
    }
  }

  setCurrentPage(int value) {
    setState(() {
      currentPage = value;
    });
  }

  buttonGo() {
    if (currentPage == 3) {
      return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: InkWell(
          onTap: changePage,
          child: Container(
            height: 65,
            width: 65,
            margin: EdgeInsets.only(bottom: 30),
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    colors: [Color(0xFF265ED7), Color(0xFF5A8AF6)],
                    stops: [0, 1],
                    begin: Alignment.topCenter)),
            child: Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 40,
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  AnimatedContainer getIndicator(int pageNo) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      height: 10,
      width: (currentPage == pageNo) ? 20 : 10,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: (currentPage == pageNo) ? Color(0xFF265ED7) : Colors.grey),
    );
  }

  Column onBoardPage(String img, String title, String description) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(50),
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage('assets/images/$img.png'))),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: Text(
            title,
            style: const TextStyle(fontSize: 30, fontFamily: 'RobotoBold'),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          child: Text(
            description,
            style: const TextStyle(
                fontSize: 16, fontFamily: 'RobotoMedium', color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
