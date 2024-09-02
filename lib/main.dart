import 'package:flutter/material.dart';
import 'pages/homepage.dart';
import 'utilities/constants.dart';

void main() => runApp(Nekopedia());

class Nekopedia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        textTheme: const TextTheme(subtitle1: TextStyle(color: Colors.black)),
        colorScheme: ThemeData().colorScheme.copyWith(primary: objColor),
        appBarTheme: const AppBarTheme(
          backgroundColor: appBarBgColor,
        ),
        scaffoldBackgroundColor: bgColor,
      ),
      home: const HomePage(),
    );
  }
}