import 'package:bmi_calculator_flutter/screen/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/card.dart';
import '../components/inner_child.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constents.dart';
import '../components/bottom_button.dart';
import 'package:bmi_calculator_flutter/components/rounded_icon_button.dart';
import 'package:bmi_calculator_flutter/calculate_bmi.dart';

enum Gender { male, female, other }

class Inputpage extends StatefulWidget {
  @override
  _InputpageState createState() => _InputpageState();
}

class _InputpageState extends State<Inputpage> {
  Gender selectedGender = Gender.other;
  int height = 150;
  int Weight = 40;
  int Age = 18;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("BMI Calculator"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      child: ResuableCard(
                        colour: selectedGender == Gender.male
                            ? KActiveCardColor
                            : KInactiveCardColor,
                        cardChild: InnerCardItem(
                          iconData: FontAwesomeIcons.mars,
                          lable: 'MALE',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      child: ResuableCard(
                        colour: selectedGender == Gender.female
                            ? KActiveCardColor
                            : KInactiveCardColor,
                        cardChild: InnerCardItem(
                          iconData: FontAwesomeIcons.venus,
                          lable: 'FEMALE',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ResuableCard(
                colour: KActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: KStylelayoutText,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: KNumberStyleText,
                        ),
                        Text(
                          'cm',
                          style: KStylelayoutText,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: KInActiveSliderColor,
                        activeTrackColor: KActiveSliderColor,
                        thumbColor: KSliderColor,
                        overlayColor: KSliderOverkayColor,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: KSliderMinValue,
                        max: KSliderMaxValue,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ResuableCard(
                      colour: KActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Weight',
                            style: KStylelayoutText,
                          ),
                          Text(
                            Weight.toString(),
                            style: KNumberStyleText,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundedIconButton(
                                iconData: FontAwesomeIcons.minus,
                                state: () {
                                  setState(() {
                                    Weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundedIconButton(
                                iconData: FontAwesomeIcons.plus,
                                state: () {
                                  setState(() {
                                    Weight++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ResuableCard(
                      colour: KActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Age',
                            style: KStylelayoutText,
                          ),
                          Text(
                            Age.toString(),
                            style: KNumberStyleText,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundedIconButton(
                                iconData: FontAwesomeIcons.minus,
                                state: () {
                                  setState(() {
                                    Age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundedIconButton(
                                iconData: FontAwesomeIcons.plus,
                                state: () {
                                  setState(() {
                                    Age++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Bottom_Button(
              lable: "Calculate",
              onTap: () {
                CalculateBMI cal = CalculateBMI(height: height, weight: Weight);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                            bmiResult: cal.CalculateBmi(),
                            interpretation: cal.getInterpretation(),
                            Result: cal.getResult())));
              },
            )
          ],
        ),
      ),
    );
  }
}
