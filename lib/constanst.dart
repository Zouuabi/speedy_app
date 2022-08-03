import 'package:flutter/material.dart';

const TextStyle kTitleStyle = TextStyle(
    fontSize: 70, fontFamily: 'Mouse', color: Color.fromARGB(255, 25, 25, 25));
const TextStyle kSubtitleStyle = TextStyle(fontFamily: 'Mouse', fontSize: 20);

BoxDecoration kBigBoxDecoration = BoxDecoration(
  color: Colors.grey.shade300,
  borderRadius: const BorderRadius.all(
    Radius.circular(40),
  ),
  boxShadow: [
    BoxShadow(
      color: Colors.grey.shade500,
      offset: const Offset(4, 4),
      blurRadius: 15.0,
      spreadRadius: 1.0,
    ),
    const BoxShadow(
      color: Colors.white,
      offset: Offset(-2, -2),
      blurRadius: 15.0,
      spreadRadius: 1.0,
    )
  ],
);
BoxDecoration kSmallBoxDecoration = BoxDecoration(
  color: Colors.grey.shade300,
  borderRadius: const BorderRadius.all(
    Radius.circular(200),
  ),
  boxShadow: [
    BoxShadow(
      color: Colors.grey.shade500,
      offset: const Offset(4, 4),
      blurRadius: 15.0,
      spreadRadius: 1.0,
    ),
    const BoxShadow(
      color: Colors.white,
      offset: Offset(-4, -4),
      blurRadius: 15.0,
      spreadRadius: 1.0,
    )
  ],
);
