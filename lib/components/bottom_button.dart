import 'package:flutter/material.dart';
import 'constants.dart';

class bottom_button extends StatelessWidget {
  bottom_button({@required this.buttonTitle, @required this.onTap});

  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
            left: 40.0, top: 0.0, right: 40.0, bottom: 10.0),
        child: Center(
          child: Container(
            width: 200.0,
            child: Center(
              child: Text(
                buttonTitle,
                style: TextStyle(
                  color: inactiveCardColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: bottomContainerColor,
            ),
            margin: EdgeInsets.only(top: 10.0),
            height: 50,
          ),
        ),
      ),
    );
  }
}
