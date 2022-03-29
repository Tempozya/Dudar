import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _bodyState();
}

class _bodyState extends State<Body> {
  TextEditingController message = new TextEditingController();
  TextEditingController email = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(height: 25),
          Text(
            "Отправьте нам сообщение о проблеме",
            style: TextStyle(
                color: Color.fromARGB(209, 0, 0, 0),
                fontFamily: 'RobotoBold',
                fontSize: 18),
          ),
          SizedBox(height: 30),
          TextField(
            controller: email,
            decoration: InputDecoration(
                fillColor: Color.fromARGB(66, 184, 184, 184),
                filled: true,
                hintText: "Почта",
                hintStyle:
                    TextStyle(color: Colors.black38, fontFamily: 'RobotoBold'),
                prefixIcon: Icon(Icons.email),
                iconColor: Colors.black,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black12,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 54, 81, 230)))),
          ),
          SizedBox(height: 30),
          TextField(
            controller: message,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            minLines: 3,
            decoration: InputDecoration(
                fillColor: Color.fromARGB(66, 184, 184, 184),
                filled: true,
                hintText: "Ваше сообщение",
                hintStyle:
                    TextStyle(color: Colors.black38, fontFamily: 'RobotoBold'),
                prefixIcon: Icon(Icons.textsms),
                iconColor: Colors.black,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black12,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 54, 81, 230)))),
          ),
          SizedBox(height: 50),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              child: Text("Отправить"),
              onPressed: () => {
                Fluttertoast.showToast(
                    msg: "Сообщение отправлено",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16)
              },
            ),
          )
        ],
      ),
    );
  }
}
