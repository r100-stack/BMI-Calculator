import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:bmi_calculator/constants.dart';
import 'round_icon_button.dart';

class ValueCard extends StatelessWidget {
  ValueCard(
      {this.valueLabel, this.initialValue, this.onDecrease, this.onIncrease});

  final String valueLabel;
  final int initialValue;
  final Function onDecrease;
  final Function onIncrease;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          valueLabel,
          style: kOverlineTextStyle,
        ),
        Text(
          initialValue.toString(),
          style: kBoldTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onPressed: onDecrease,
            ),
            SizedBox(
              width: 10,
            ),
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              onPressed: onIncrease,
            )
          ],
        ),
      ],
    );
  }
}