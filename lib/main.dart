import 'package:flutter/material.dart';
import 'package:push_notifications/screens/home_screen.dart';
import 'package:push_notifications/screens/message_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'home',
        routes: {
          'home': (_) => HomeScreen(),
          'message': (_) => MessageScreen(),
        });
  }
}
