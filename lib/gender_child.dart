import 'package:flutter/material.dart';
import 'constants.dart';

class GenderChild extends StatelessWidget {
  GenderChild({@required this.iconData, @required this.textData});

  final IconData iconData;
  final String textData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          this.iconData,
          size: 80.0,
        ),
        SizedBox(
          height: 18.0,
        ),
        Text(
          textData,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
