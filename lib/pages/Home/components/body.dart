import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';



class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final CarouselController _controller = CarouselController();
    final List<String> appoint = ["Уролог", "Психолог"];
    int _current = 0;

    return Stack(
      children: [
        /*Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 232, 232, 232),
              borderRadius: BorderRadius.circular(29.5)),
          child: TextField(
              decoration: InputDecoration(
                  hintText: "Поиск",
                  icon: Icon(Icons.search),
                  border: InputBorder.none)),
        ),*/

        Container(
            margin: EdgeInsets.only(
              top: height * .03,
              left: 20,
              right: 20,
            ),
            width: double.infinity,
            height: 130,
            decoration: BoxDecoration(
                color: Color.fromARGB(98, 171, 203, 250),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Заполните профиль",
                    style: TextStyle(fontSize: 16, fontFamily: "RobotoBold"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: LinearPercentIndicator(
                    width: 250,
                    animation: true,
                    lineHeight: 20.0,
                    animationDuration: 2000,
                    percent: 0.1,
                    center: Text("10.0%"),
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor: Colors.greenAccent,
                  ),
                ),
                ElevatedButton(
                    onPressed: () => {},
                    child: Text(
                      "Заполнить",
                      style: TextStyle(fontSize: 16, fontFamily: "RobotoBold"),
                    ))
              ],
            )),
        Container(
          margin: EdgeInsets.symmetric(vertical: height * .25, horizontal: 15),
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              butBuild(60, Icons.chat_rounded, "Чат"),
              butBuild(60, Icons.post_add_rounded, "Календарь"),
              butBuild(60, Icons.coronavirus_rounded, "COVID-19"),
            ],
          ),
        ),
        Column(
          children: [
            Expanded(
              child: CarouselSlider(
                carouselController: _controller,
                items: [
                  slideBuild(height, "Уролог"),
                  slideBuild(height, "Психолог"),
                ],
                options: CarouselOptions(
                  height: 425,
                  scrollDirection: Axis.horizontal,
                  enableInfiniteScroll: true,
                  viewportFraction: 1,
                ),
              ),
            ),
            /* Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: appoint.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            )*/
          ],
        ),
      ],
    );
  }

  Container slideBuild(double height, String doctor) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(
        top: height * .42,
        left: 20,
        right: 20,
      ),
      decoration: BoxDecoration(
          color: Color.fromARGB(98, 171, 203, 250),
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: InkWell(
        onTap: () => print("object"),
        child: Row(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: height * .03,
                        left: 20,
                        right: 20,
                      ),
                      height: 100,
                      width: 75,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(225, 171, 203, 250),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Container(
                          padding: EdgeInsets.only(top: 25),
                          child: Column(children: [
                            Text(
                              "12",
                              style: TextStyle(
                                  fontSize: 16, fontFamily: 'RobotoBold'),
                            ),
                            Text("Апреля",
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'RobotoBold')),
                            SizedBox(height: 15),
                            Text("Среда",
                                style: TextStyle(
                                    fontSize: 12, fontFamily: 'RobotoMedium')),
                          ])),
                    ),
                    
                    Container(
                      margin: EdgeInsets.only(
                        top: height * .04,
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("9:30",
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'RobotoMedium')),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Ибрагимов А.И.",
                                style: TextStyle(
                                    fontSize: 18, fontFamily: 'RobotoBold')),
                            SizedBox(
                              height: 5,
                            ),
                            Text(doctor,
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'RobotoMedium')),
                          ]),
                    ),
                  ],
                ),
              ],
            ),
            InkWell(
              onTap: () => print("df"),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  margin: EdgeInsets.only(
                    top: 10,
                    left: 40,
                  ),
                  padding: EdgeInsets.all(0),
                  child: Icon(Icons.open_in_full, size: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  
  Container butBuild(int flex, IconData icon, String title) {
    return Container(
      height: 85,
      width: 85,
      child: InkWell(
        onTap: () => {print("object")},
        splashColor: Color.fromARGB(255, 255, 226, 7),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(124, 212, 229, 255),
              borderRadius: BorderRadius.all(Radius.circular(29.5))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 30, color: Color(0xFF265ED7)),
              SizedBox(height: 5),
              Text(
                title,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
