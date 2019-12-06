import '../components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../components/constants.dart';
import '../components/bottom_button.dart';
import 'input_page.dart';

class resultPage extends StatelessWidget {
  resultPage({this.bmi, this.result, this.interpretation});

  final bmi;
  final result;
  final interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  "YOUR RESULT",
                  style: kTitleTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                colour: inactiveCardColor,
                childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Center(
                      child: Text(
                        result,
                        style: kResultTextStyle,
                      ),
                    ),
                    Center(
                      child: Text(
                        bmi,
                        style: TextStyle(
                            fontSize: 100.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Center(
                      child: Text(
                        interpretation,
                        style: TextStyle(
                          color: bottomContainerColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          letterSpacing: 2.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: bottom_button(
                buttonTitle: "RE-CALCULATE",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => InputPage()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
