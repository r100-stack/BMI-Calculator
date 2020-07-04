import 'package:bmi_calculator/models/bmi.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/value_card.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender activeGender = Gender.male;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: activeGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      content: 'MALE',
                    ),
                    onTap: () {
                      setState(() {
                        activeGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: activeGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      content: 'FEMALE',
                    ),
                    onTap: () {
                      setState(() {
                        activeGender = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kOverlineTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kBoldTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kOverlineTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbColor: Color(0xFFEB1555),
                        activeTrackColor: Colors.white,
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.floor();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: ValueCard(
                      valueLabel: 'WEIGHT',
                      initialValue: weight,
                      onDecrease: () {
                        setState(() {
                          weight--;
                        });
                      },
                      onIncrease: () {
                        setState(() {
                          weight++;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: ReusableCard(
                      color: kActiveCardColor,
                      cardChild: ValueCard(
                        valueLabel: 'AGE',
                        initialValue: age,
                        onDecrease: () {
                          setState(() {
                            age--;
                          });
                        },
                        onIncrease: () {
                          setState(() {
                            age++;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            text: 'CALCULATE',
            onPress: () {
              BMI bmiObject = BMI.getBMI(height, weight);
              Navigator.pushNamed(context, ResultsPage.routeName, arguments: bmiObject);
            },
          )
        ],
      ),
    );
  }
}
