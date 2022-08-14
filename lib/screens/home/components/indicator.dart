import 'package:flutter/material.dart';

import '../../../constanst.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    Key? key,
    required this.child,
    required this.index,
    required this.textIndex,
    required this.width,
  }) : super(key: key);
  final int index;
  final int textIndex;
  final double width;
  final String child;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 18,
        height: 38,
        decoration: index == textIndex
            ? kBigBoxDecoration.copyWith(
                color: const Color.fromARGB(255, 26, 25, 25),
                borderRadius: BorderRadius.circular(10))
            : null,
        child: Center(
          child: Text(
            child,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: index < textIndex ? Colors.green : Colors.white,
                fontSize: index == textIndex ? width * 0.024 : width * 0.02,
                fontFamily: 'Mouse'),
          ),
        ));
  }
}
