import 'package:flutter/material.dart';


import '../../constanst.dart';
import 'indicator.dart';

class TextSection extends StatelessWidget {
  const TextSection({Key? key, required this.size, required this.content})
      : super(key: key);

  final Size size;
  final List<Indicator> content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: size.width * 0.6,

      decoration: kBoxDecoration,

      /// ToDO : I have to implement the grid builder to be able to
      /// Todo : control the that text return to new line
      child: Wrap(
        children: content,
      ),
    );
  }
}
