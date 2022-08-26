import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart'
    show NeumorphicButton;


import '../constanst.dart';
import '../home/home_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {Key? key,
      this.speed = '00',
      required this.accuracy,
      required this.score})
      : super(key: key);
  static const String id = 'Result Screen';
  final String speed;
  final String accuracy;
  final String score;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Container(
          decoration: kBoxDecoration,
          width: size.width * 0.7,
          height: size.height * 0.7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Score $score",
                  style: const TextStyle(
                      color: Colors.indigo,
                      fontFamily: 'Permanent Marker',
                      fontSize: 40)),
              Text(
                'Your speed is $speed and your accuracy is $accuracy ',
                style: const TextStyle(
                    fontSize: 60, fontFamily: 'Mouse', color: Colors.white),
              ),
              const SizedBox(height: 20),
              NeumorphicButton(
                child: const Text(
                  'Play Again',
                  style: TextStyle(
                      fontSize: 25,
                      color: kButtonTextColor,
                      fontFamily: 'Mouse'),
                ),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return const HomeScreen();
                  }));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
