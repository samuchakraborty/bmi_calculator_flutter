import 'package:flutter/material.dart';
import 'screens/bmi_homePage.dart';
import 'screens/ResultPage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
     initialRoute: '/',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      routes: {
        '/': (context) => BmiHomePage(),
        'result_page': (context) => ResultPage(),
      },
    ),
  );
}
