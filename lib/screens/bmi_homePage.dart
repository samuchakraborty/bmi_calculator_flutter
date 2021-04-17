import 'package:bmi_calculator/components/BottomButton.dart';
import 'package:bmi_calculator/components/IconContent.dart';
import 'package:bmi_calculator/components/resuableCard.dart';
import 'package:bmi_calculator/components/roundButton.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/ResultPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../calculator_brain.dart';

class BmiHomePage extends StatefulWidget {
  @override
  _BmiHomePageState createState() => _BmiHomePageState();
}

enum GENDER { MALE, FEMALE }

class _BmiHomePageState extends State<BmiHomePage> {
  GENDER selectedGender;
  int height = 180;
  int weightValue = 60;
  int ageValue = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bmi Calculator",
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: reUseAbleCard(
                    onPress: () {
                      setState(() {
                        selectedGender = GENDER.MALE;
                      });
                    },
                    colour: selectedGender == GENDER.MALE
                        ? activeCardColour
                        : inActiveCardColour,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: "Male",
                    ),
                  ),
                ),
                Expanded(
                  child: reUseAbleCard(
                      onPress: () {
                        setState(() {
                          selectedGender = GENDER.FEMALE;
                        });
                      },
                      colour: selectedGender == GENDER.FEMALE
                          ? activeCardColour
                          : inActiveCardColour,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: "Female",
                      )),
                ),
              ],
            ),
          ),
          Expanded(
            child: reUseAbleCard(
              colour: inActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: labelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: sliderTextStyle),
                      Text("cm", style: labelTextStyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30),
                        thumbColor: Color(0xFFEB1555),
                        activeTrackColor: Colors.white),
                    child: Slider(
                      value: height.toDouble(),
                      // activeColor: Color(0xFFEB1555),
                      //  activeColor: Colors.white,
                      inactiveColor: Color(0xFF8D8E98),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double value) {
                        setState(() {
                          height = value.round();
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
                  child: reUseAbleCard(
                    colour: inActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: labelTextStyle,
                        ),
                        Text(
                          weightValue.toString(),
                          style: sliderTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            roundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  weightValue--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            roundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  weightValue++;
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
                  child: reUseAbleCard(
                    colour: inActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: labelTextStyle,
                        ),
                        Text(
                          ageValue.toString(),
                          style: sliderTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            roundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  ageValue--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            roundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  ageValue++;
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
          BottomButton(
            buttonName: "CALCULATE",
            onPressed: () {
              CalculatorBrain calculate =
                  CalculatorBrain(height: height, weight: weightValue);
              print(height);
              print(calculate.calculateBMI());

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                          resultText: calculate.getResult(),
                          bmiResult: calculate.calculateBMI(),
                          message: calculate.getMessage())));

             //  Navigator.pushNamed(context, 'result_page');
            },
          )
        ],
      ),
    );
  }
}
