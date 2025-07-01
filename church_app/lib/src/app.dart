import 'package:flutter/material.dart';
import 'theme.dart';
import 'routes.dart';

class ChurchApp extends StatelessWidget {
  const ChurchApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NPN The Legacy Church',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: appRoutes,
    );
  }
}
