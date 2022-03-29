// @dart=2.9
import 'package:dudar/Other/notification_api.dart';
import 'package:dudar/pages/loading.dart';
import 'package:flutter/material.dart';
import 'package:dudar/routes.dart';
import 'package:dudar/theme.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  initializeDateFormatting('ru_Ru', null).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HealthCare Manager',
      theme: theme(),
      initialRoute: SplashScreenPage.routeName,
      routes: routes,
    );
  }
}
