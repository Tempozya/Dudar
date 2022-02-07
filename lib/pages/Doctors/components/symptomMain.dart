// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:dudar/pages/Doctors/components/modal.dart';
import 'package:flutter/material.dart';

class symptomMain extends StatefulWidget {
  const symptomMain({Key? key}) : super(key: key);

  @override
  _symptomMainState createState() => _symptomMainState();
}

class _symptomMainState extends State<symptomMain> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: Colors.black,
          indent: 12,
          endIndent: 12,
        ),
        const SizedBox(height: 7.5),
        Container(
          padding: const EdgeInsets.only(left: 12),
          child: Row(
            children: [
              Text(
                'Симптомы',
                style: TextStyle(fontFamily: 'RobotoBold', fontSize: 18),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: MediaQuery.of(context).size.width - 20,
          height: 32,
          child: ElevatedButton.icon(
            onPressed: () => showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) => Modal(),
            ),
            label: const Text('Добавить'),
            icon: const Icon(Icons.add),
          ),
        )
      ],
    );
  }
}
