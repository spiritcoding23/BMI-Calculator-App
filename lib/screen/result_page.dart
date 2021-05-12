import 'package:bmi_calculator_flutter/constents.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../components/card.dart';
import '../constents.dart';
import '../components/bottom_button.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String interpretation;
  final String Result;

  ResultPage(
      {required this.bmiResult,
      required this.interpretation,
      required this.Result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text(
                'Your Result',
                style: KTitleTextStyle,
              ),
              padding: EdgeInsets.fromLTRB(20.0, 25.0, 0, 10.0),
              alignment: Alignment.bottomLeft,
            ),
          ),
          Expanded(
            flex: 5,
            child: ResuableCard(
              colour: KActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    Result.toUpperCase(),
                    style: KResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: KBMITextStyle,
                  ),
                  Text(
                    interpretation,
                    style: KBodyStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Bottom_Button(
            lable: " Re-Calculate ",
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
