import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:dudar/pages/Doctors/components/global.dart' as global;

class SingleChoice extends StatefulWidget {
  const SingleChoice({Key? key, required this.list}) : super(key: key);
  final String list;

  @override
  _SingleChoiceState createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  @override
  Widget build(BuildContext context) {
    int tag = global.listTag[widget.list] as int;
    return ListBody(
      children: [
        Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
            child: Text(widget.list,
                style: TextStyle(fontFamily: 'RobotoBold', fontSize: 16))),
        ChipsChoice.single(
            value: tag,
            onChanged: (int val) => setState(() {
                  tag = val;
                  global.listTag[widget.list] = tag;
                }),
            choiceItems: C2Choice.listFrom(
                source: global.listSymptom[widget.list] as List<String>,
                value: (i, v) => i,
                label: (i, String v) => v),
            wrapped: true,
            choiceStyle: C2ChoiceStyle(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              showCheckmark: false,
            )),
        const Divider(
          color: Color.fromARGB(255, 87, 86, 86),
          indent: 12,
          endIndent: 12,
        ),
      ],
    );
  }
}
