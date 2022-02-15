import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  MyCard({@required this.mycolor, this.cardChild, this.onPress});

  final Color mycolor;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: mycolor,
        ),
        margin: EdgeInsets.all(15.0),
        child: cardChild,
      ),
    );
  }
}
