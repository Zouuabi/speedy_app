import 'package:flutter/material.dart';

import '../../constanst.dart';


class ResultBar extends StatelessWidget {
  const ResultBar(
      {Key? key,
      required this.size,
      required this.speed,
      required this.acc,
      required this.score})
      : super(key: key);

  final Size size;
  final String speed;
  final String acc;
  final String score;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBoxDecoration,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      // margin: const EdgeInsets.only(
      //     top: 20, bottom: 10, right: 350),
      width: 400,
      height: 50,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          "Speed:$speed ",
          style: kSubtitleStyle,
        ),
        Text(
          "Accuracy: $acc%",
          style: kSubtitleStyle,
        ),
        Text("Score: $score", style: kSubtitleStyle)
      ]),
    );
  }
}
