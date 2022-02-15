import 'package:bmi_calculator/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'gender_child.dart';
import 'mycard.dart';
import 'constants.dart';
import 'result.dart';
import 'bottom_button.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    mycolor: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: GenderChild(
                      iconData: FontAwesomeIcons.mars,
                      textData: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: MyCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    mycolor: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: GenderChild(
                      iconData: FontAwesomeIcons.venus,
                      textData: "FEMALE",
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Slider card

          Expanded(
            child: MyCard(
              mycolor: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kHeavyTextStyle,
                      ),
                      Text(
                        "cm",
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: kMinHeight.toDouble(),
                      max: kMaxHeight.toDouble(),
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

          // Weight and Age

          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: MyCard(
                  mycolor: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "WEIGHT",
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kHeavyTextStyle,
                      ),
                      SizedBox(width: 10.0, height: 5.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(FontAwesomeIcons.minus, () {
                            setState(() {
                              weight--;
                            });
                          }),
                          SizedBox(width: 10.0),
                          RoundIconButton(FontAwesomeIcons.plus, () {
                            setState(() {
                              weight++;
                            });
                          }),
                        ],
                      ),
                    ],
                  ),
                )),
                Expanded(
                    child: MyCard(
                  mycolor: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "AGE",
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kHeavyTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(FontAwesomeIcons.minus, () {
                            setState(() {
                              age--;
                            });
                          }),
                          SizedBox(width: 10.0),
                          RoundIconButton(FontAwesomeIcons.plus, () {
                            setState(() {
                              age++;
                            });
                          })
                        ],
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  CalculatorBrain calc =
                      CalculatorBrain(weight: weight, height: height);
                  return Results(
                      bmi: calc.BmiValue(),
                      interpretation: calc.Interpretation(),
                      advice: calc.Advice());
                }),
              );
            },
            title: "CALCULATE BMI",
          )
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton(this.icon, this.onPress);

  final IconData icon;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
