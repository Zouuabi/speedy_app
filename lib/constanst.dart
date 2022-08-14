import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xff333333);
const Color kTextColor = Colors.white;
const Color kButtonTextColor = Colors.black;

const TextStyle kTitleStyle = TextStyle(
    fontSize: 70, fontFamily: 'Mouse', color: Color.fromARGB(255, 25, 25, 25));
const TextStyle kSubtitleStyle =
    TextStyle(fontFamily: 'Mouse', fontSize: 20, color: kTextColor);

BoxDecoration kBigBoxDecoration = BoxDecoration(
  color: const Color(0xff333333),
  borderRadius: BorderRadius.circular(10),
  boxShadow: const [
    BoxShadow(
      color: Color(0xff515151),
      offset: Offset(-6.1, -6.1),
      blurRadius: 10,
      spreadRadius: 0.0,
    ),
    BoxShadow(
      color: Color(0xff151515),
      offset: Offset(6.1, 6.1),
      blurRadius: 10,
      spreadRadius: 0.0,
    ),
  ],
);
        
      
  

      // Container(
      //   width: 500.0,
      //   height: 500.0,
      //   color: Color(0xff333333),
      //   alignment: Alignment.center,
      //   transformAlignment: Alignment.center,
      //   child: Container(
      //     color: Color(0xff333333),
      //     child: Container(
      //       width: 200,
      //       height: 200,
      //       child: Icon(
      //         Icons.star,
      //         size: 67,
      //         color: Colors.amber,
      //       ),
      //       decoration: BoxDecoration(
      //         color: Color(0xff333333),
      //         borderRadius: BorderRadius.circular(10),
      //         gradient: LinearGradient(
      //           begin: Alignment.topLeft,
      //           end: Alignment.bottomRight,
      //           colors: [
      //             Color(0xff151515),
      //             Color(0xff515151),
      //           ],
      //         ),
      //         boxShadow: [
      //           BoxShadow(
      //             color: Color(0xff515151),
      //             offset: Offset(-20.0, -20.0),
      //             blurRadius: 30,
      //             spreadRadius: 0.0,
      //           ),
      //           BoxShadow(
      //             color: Color(0xff151515),
      //             offset: Offset(20.0, 20.0),
      //             blurRadius: 30,
      //             spreadRadius: 0.0,
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // )
  