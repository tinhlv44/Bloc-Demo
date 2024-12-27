import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: const Color.fromARGB(255, 240, 237, 237),
      fontFamily: 'Muli',
      appBarTheme: appBarTheme());
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
      color: Colors.white,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Color.fromARGB(255, 37, 37, 37)),
      titleTextStyle:
          TextStyle(color: Color.fromARGB(255, 75, 75, 75), fontSize: 18));
}
