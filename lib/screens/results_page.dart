import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/models/bmi.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class ResultsPage extends StatelessWidget {
  static const String routeName = '/results';

  @override
  Widget build(BuildContext context) {
    final BMI bmiObject = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              'Your Result',
              style: kTitleTextStyle,
            ),
            margin: EdgeInsets.fromLTRB(16, 8, 4, 8),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        child: Center(
                            child: Text(
                      bmiObject.label.toUpperCase(),
                      style: TextStyle(fontSize: 20, color: Color(0xFF24D876)),
                    ))),
                    Expanded(
                      child: Center(
                        child: Text(
                          bmiObject.bmi.toStringAsFixed(1),
                          style: kExtraBoldTextStyle,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                            bmiObject.interpretation),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          BottomButton(
            text: 'RE-CALCULATE',
            onPress: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
