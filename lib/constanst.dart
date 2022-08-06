import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xFF333333);
const Color kTextColor = Colors.white70;
const Color kButtonTextColor = Colors.black;

const TextStyle kTitleStyle = TextStyle(
    fontSize: 70, fontFamily: 'Mouse', color: Color.fromARGB(255, 25, 25, 25));
const TextStyle kSubtitleStyle =
    TextStyle(fontFamily: 'Mouse', fontSize: 20, color: kTextColor);

BoxDecoration kBigBoxDecoration = BoxDecoration(
  color: const Color(0xff333333),
  borderRadius: BorderRadius.circular(43),
  boxShadow: const [
    BoxShadow(
      color: Color(0xff434343),
      offset: Offset(-6.1, -6.1),
      blurRadius: 10,
      spreadRadius: 0.0,
    ),
    BoxShadow(
      color: Color(0xff232323),
      offset: Offset(6.1, 6.1),
      blurRadius: 10,
      spreadRadius: 0.0,
    ),
  ],
);
