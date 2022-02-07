import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final items = List<String>.generate(5, (i) => 'Запись к врачу ${i + 1}');
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
      final item = items[index];
        return Dismissible(

          key: Key(item),
          onDismissed: (direction) {
            setState(() => items.removeAt(index));
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$item удалена')));
          },
          background: Container(color: Colors.red),
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                ListTile(
                  leading: Icon(Icons.event_rounded),
                  title: Text('Запись к врачу'),
                  subtitle: Text('Вы записаны к врачу на 10.02'),
                ),
            ],
          ),
        ));
      }
    );
  }
}

