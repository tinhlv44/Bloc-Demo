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
      iconTheme: IconThemeData(color: Color(0XFFFFFF88)),
      titleTextStyle: TextStyle(color: Color(0XFFFFFF8B), fontSize: 18));
}
