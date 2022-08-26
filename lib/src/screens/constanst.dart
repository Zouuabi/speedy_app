import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xff21a675);
const Color kTextColor = Colors.white;
const Color kButtonTextColor = Color(0xff21a675);

const TextStyle kTitleStyle = TextStyle(
    fontSize: 70,
    fontFamily: 'Permanent Marker ',
    color: Color.fromARGB(255, 25, 25, 25));
const TextStyle kSubtitleStyle =
    TextStyle(fontFamily: 'Mouse', fontSize: 20, color: kTextColor);

BoxDecoration kBoxDecoration = BoxDecoration(
  color: const Color(0xff21a675),
  borderRadius: BorderRadius.circular(10),
  boxShadow: const [
    BoxShadow(
      color: Color(0xff3fc493),
      offset: Offset(-20.0, -20.0),
      blurRadius: 30,
      spreadRadius: 0.0,
    ),
    BoxShadow(
      color: Color(0xff038857),
      offset: Offset(20.0, 20.0),
      blurRadius: 30,
      spreadRadius: 0.0,
    ),
  ],
);
