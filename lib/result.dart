import 'package:bmi_calculator/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/mycard.dart';
import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  Results(
      {@required this.bmi,
      @required this.interpretation,
      @required this.advice});

  final String bmi;
  final String interpretation;
  final String advice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Your Result",
                style: kResultTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: MyCard(
              mycolor: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    interpretation.toUpperCase(),
                    style: kResultStatusText,
                  ),
                  Text(
                    bmi,
                    style: kScoreText,
                  ),
                  Text(
                    advice,
                    style: kInterpretationText,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            onTap: () {
              Navigator.pop(context);
            },
            title: "RE-CALCULATE",
          )
        ],
      ),
    );
  }
}
