import 'package:flutter/material.dart';

import 'package:bmi_calculator/constants.dart';

class BottomButton extends StatelessWidget {
  final String text;
  final Function onPress;

  BottomButton({@required this.text, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        color: kBottomContainerColor,
        height: kBottomContainerHeight,
        child: Center(child: Text(text, style: kOverlineTextStyle.copyWith(color: Colors.white),)),
      ),
    );
  }
}
