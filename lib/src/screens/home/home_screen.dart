import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constanst.dart';
import '../result/result_screen.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart'
    show NeumorphicButton;

import '../text.dart';
import 'components/bar_section.dart';
import 'components/indicator.dart';
import 'components/text_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// *  I just use this variable to simulates the seconds
  int time = 0;

  int textIndex = 0;

  /// *  this flag is used to control the timer
  /// *  if [isTimerStopped] = true => timer is active
  /// *  if [isTimerStopped] = false => timer is canceled

  bool isTimerStopped = true;

  /// * Once the user start typing it will be true
  bool isFirstTime = true;

  /// * number of  [characters] typed by the user
  int characters = 1;
  int charterForAccuracy = 0;

  /// * splitting the text into a list of char
  List<String> splitedText = [];

  void restart() {
    setState(() {
      isTimerStopped = true;
      textIndex = 0;
      characters = 100;
      isFirstTime = true;
      charterForAccuracy = 0;
    });
  }

  String getSpeed() {
    double dSpeed = ((characters / 5) * 60) / time;
    if (dSpeed == double.infinity) {
      return '911';
    }
    return dSpeed.toStringAsFixed(0);
  }

  String getAcc() {
    double acc = (charterForAccuracy / splitedText.length) * 100;
    return acc.toStringAsFixed(0);
  }

  void timer() {
    setState(() {
      Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          ++time;
          if (isTimerStopped) {
            timer.cancel();
            time = 0;
          }
        });
      });
    });
  }

  List<Indicator> getWrapItems(double screenWidth) {
    List<Indicator> wrapItems = [];

    for (int i = 0; i < splitedText.length; ++i) {
      Indicator currentIndicator = Indicator(
        width: screenWidth,
        textIndex: textIndex,
        index: i,
        child: splitedText[i],
      );

      wrapItems.add(currentIndicator);
    }
    return wrapItems;
  }

  void getRandomText() {
    setState(() {
      int randomNumber = Random().nextInt(3);
      splitedText = (text[randomNumber].split(''));
    });
  }

  void brain(BuildContext context, String key) {
    if (textIndex == splitedText.length - 1) {
      String finalSpeed = getSpeed();

      isTimerStopped = false;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) {
        return ResultScreen(
          speed: finalSpeed,
          accuracy: getAcc(),
          score: Random().nextInt(100).toString(),
        );
      })));
    } else if (key.toLowerCase() == splitedText[textIndex]) {
      characters++;
      ++textIndex;
    } else if (key.toLowerCase() != splitedText[textIndex].toLowerCase()) {
      charterForAccuracy--;
    } else {}
  }

  @override
  void initState() {
    super.initState();
    getRandomText();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      // ****************************************** */
      //* Keybord events

      onKey: (event) async {
        if (isFirstTime) {
          charterForAccuracy = splitedText.length;
          characters = 0;
          isTimerStopped = false;
          isFirstTime = false;
          timer();
        }
        if (event is RawKeyDownEvent) {
          final key = event.logicalKey.keyLabel;

          setState(() {
            brain(context, key);
          });
        }
      },

      child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: Center(
            child: Container(
              width: size.width * 0.7,
              height: double.infinity,
              decoration: kBoxDecoration,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20.0, bottom: 50),
                      child: Text("Speedy",
                          style: TextStyle(
                            letterSpacing: 10,
                            fontFamily: 'Permanent Marker',
                            fontSize: 70,
                            color: Colors.white,
                          )),
                    ),

                    /// * Bar that displays Current speed Accuracy and score

                    ResultBar(
                        size: size,
                        acc: getAcc(),
                        speed: getSpeed(),
                        score: '911'),

                    /// * Text Section

                    TextSection(size: size, content: getWrapItems(size.width)),

                    ///* Divider
                    ///
                    SizedBox(height: size.height * 0.07),

                    /// * Restart Button

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        NeumorphicButton(
                          child: const Text(
                            'Restart',
                            style: TextStyle(
                                fontSize: 25,
                                color: kButtonTextColor,
                                fontFamily: 'Mouse'),
                          ),
                          onPressed: () {
                            setState(() {
                              restart();
                            });
                          },
                        ),
                        const SizedBox(width: 50),
                        NeumorphicButton(
                          child: const Text(
                            'Change Text',
                            style: TextStyle(
                                fontSize: 25,
                                color: kButtonTextColor,
                                fontFamily: 'Mouse'),
                          ),
                          onPressed: () {
                            setState(() {
                              restart();
                              getRandomText();
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
