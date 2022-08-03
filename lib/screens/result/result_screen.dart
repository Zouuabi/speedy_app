import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart'
    show NeumorphicButton;
import 'package:speedy/constanst.dart';

import '../home/home_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key, this.speed = '00', required this.accuracy})
      : super(key: key);
  final String speed;
  final String accuracy;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: Container(
          decoration: kBigBoxDecoration,
          width: size.width * 0.7,
          height: size.height * 0.7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your speed is $speed & your accuracy is $accuracy ',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              const SizedBox(height: 20),
              NeumorphicButton(
                child: const Text(
                  'Play Again',
                  style: TextStyle(
                      fontSize: 25, color: Colors.cyan, fontFamily: 'Mouse'),
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
