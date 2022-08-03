import 'package:flutter/material.dart';

import '../constanst.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    Key? key,
    required this.child,
    required this.index,
    required this.textIndex,
  }) : super(key: key);
  final int index;
  final int textIndex;

  final String child;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 18,
        height: 28,
        decoration: index == textIndex ? kSmallBoxDecoration : null,
        child: Center(
          child: Text(
            child,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: index < textIndex ? Colors.green : Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w500,
                fontFamily: 'Niconne'),
          ),
        ));
  }
}
