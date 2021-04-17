import 'package:bmi_calculator/components/BottomButton.dart';
import 'package:bmi_calculator/components/resuableCard.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.message});

  final String bmiResult;
  final String resultText;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              child: Text(
                "Your Result",
                style: resultTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: reUseAbleCard(
                colour: activeCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText,
                      style: resultShowTextStyle,
                    ),
                    Text(
                      bmiResult,
                      style: resultBmiTextStyle,
                    ),
                    Text(
                      message,
                      maxLines: 2,
                      style: bmiResultShowTextStyle,
                    ),
                  ],
                )),
          ),
          BottomButton(
            buttonName: "RE-CALCULATE",
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
