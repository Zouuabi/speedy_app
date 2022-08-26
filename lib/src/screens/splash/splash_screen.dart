import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart'
    show NeumorphicButton;
import '../constanst.dart';
import '../home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String id = ' Splash Screen';

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
        fontFamily: 'Permanent Marker',
        fontSize: 55,
        height: 1,
        color: Colors.white);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'speedy',
              child: Transform.rotate(
                angle: -0.1,
                child: const Text(
                  'Speedy\n This app is not for mobile use',
                  textAlign: TextAlign.center,
                  style: textStyle,
                ),
              ),
            ),
            Transform.rotate(
              angle: 0.1,
              child: Container(
                  margin: const EdgeInsets.only(top: 50),
                  width: 200,
                  height: 70,
                  child: NeumorphicButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const HomeScreen();
                        }));
                      },
                      child: Center(
                        child: Text(
                          'Play',
                          style: textStyle.copyWith(
                            color: kPrimaryColor,
                            fontSize: 45,
                          ),
                        ),
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
