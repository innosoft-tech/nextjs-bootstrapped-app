import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  primarySwatch: Colors.blueGrey,
  brightness: Brightness.light,
  fontFamily: 'Roboto',
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    headline6: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    bodyText1: TextStyle(fontSize: 16),
  ),
);

final darkTheme = ThemeData(
  primarySwatch: Colors.blueGrey,
  brightness: Brightness.dark,
  fontFamily: 'Roboto',
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    headline6: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    bodyText1: TextStyle(fontSize: 16),
  ),
);
