import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../components/constants.dart';
import 'result_page.dart';
import '../components/bottom_button.dart';
import '../calculatorbrain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 24;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI CALCULATOR')),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReusableCard(
                        colour: selectedGender == Gender.male
                            ? activeCardColor
                            : inactiveCardColor,
                        childCard: IconContent(
                          colour: selectedGender == Gender.male
                              ? activeGenderColor
                              : inactiveGenderColor,
                          gender: "MALE",
                          label: FontAwesomeIcons.male,
                        )),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReusableCard(
                        colour: selectedGender == Gender.female
                            ? activeCardColor
                            : inactiveCardColor,
                        childCard: IconContent(
                          colour: selectedGender == Gender.female
                              ? activeGenderColor
                              : inactiveGenderColor,
                          gender: "FEMALE",
                          label: FontAwesomeIcons.female,
                        )),
                  ),
                )
              ],
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "HEIGHT",
                          style: TextStyle(
                            wordSpacing: 3.0,
                            fontSize: 16.0,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: TextStyle(
                                  fontSize: 35.0, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "cm",
                              style: TextStyle(fontSize: 16.0),
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Colors.white,
                              thumbColor: Colors.teal.shade500,
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 25.0)),
                          child: Slider(
                            value: height.toDouble(),
                            min: 110.0,
                            max: 220.0,
                            inactiveColor: Color(0xFF8D8E98),
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(10.0),
                            child: Text(
                              "WEIGHT",
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Container(
                              child: RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          )),
                          Container(
                            margin: EdgeInsets.all(10.0),
                            width: 120.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(108, 132, 119, 1),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Center(
                                child: Text(
                              weight.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25.0),
                            )),
                          ),
                          Container(
                              child: RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          )),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(10.0),
                            child: Text(
                              "AGE",
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Container(
                              child: RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                          )),
                          Container(
                            margin: EdgeInsets.all(10.0),
                            width: 120.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(108, 132, 119, 1),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Center(
                                child: Text(
                              age.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25.0),
                            )),
                          ),
                          Container(
                              child: RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
            bottom_button(
              buttonTitle: "Calculate",
              onTap: () {
//                print(height);
//                print(weight);
                calculatorBrain calc =
                    calculatorBrain(height: height, weight: weight);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => resultPage(
                              bmi: calc.calculateBMI(),
                              result: calc.getResult(),
                              interpretation: calc.getInterpretation(),
                            )));
              },
            )
          ],
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        color: inactiveCardColor,
        size: 8.0,
      ),
      elevation: 0.0,
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 20.0,
        height: 20.0,
      ),
      shape: CircleBorder(),
      fillColor: bottomContainerColor,
    );
  }
}
