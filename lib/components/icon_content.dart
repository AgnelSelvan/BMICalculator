import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  IconContent({this.gender, this.label, this.colour});
  final String gender;
  final Color colour;
  final IconData label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          label,
          size: 80.0,
          color: colour,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          gender,
          style: TextStyle(
            fontSize: 18.0,
            color: colour,
          ),
        )
      ],
    );
  }
}
