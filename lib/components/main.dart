import 'package:flutter/material.dart';
import 'package:bmi_calculator/screens/input_page.dart';
import 'package:bmi_calculator/screens/results_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        ResultsPage.routeName: (context) => ResultsPage()
      },
      theme: ThemeData(
          primaryColor: Color(0xFF090C22),
          scaffoldBackgroundColor: Color(0xFF090C22),
          textTheme: TextTheme(body1: TextStyle(color: Colors.white))),
    );
  }
}
