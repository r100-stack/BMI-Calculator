import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String content;

  IconContent({this.icon, this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
            icon,
            color: Colors.white,
            size: 80.0
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(content, style: kOverlineTextStyle)
      ],
    );
  }
}