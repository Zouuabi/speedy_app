import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speedy/screens/home/components/indicator.dart';
import 'package:speedy/text.dart';
import '../../constanst.dart';
import '../result/result_screen.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart'
    show NeumorphicButton;

import 'components/bar_section.dart';
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

  bool isTimerStopped = false;

  /// * Once the user start typing it will be true
  bool isFirstTime = true;

  /// * number of  [characters] typed by the user
  int characters = 1;
  int charterForAccuracy = 0;

  /// * splitting the text into a list of char
  List<String> splitedText = [];

  void restart() {
    setState(() {
      isTimerStopped = false;
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
          if (!isTimerStopped) {
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
    if (textIndex == splitedText.length) {
      String finalSpeed = getSpeed();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) {
        return ResultScreen(
          speed: finalSpeed,
          accuracy: getAcc(),
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
          isTimerStopped = true;
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
          backgroundColor: Colors.grey.shade300,
          body: Center(
            child: Container(
              width: size.width * 0.7,
              height: double.infinity,
              decoration: kBigBoxDecoration,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Speedy",
                          style: kTitleStyle.copyWith(
                            color: Colors.cyan,
                          )),
                    ),

                    /// * Bar that displays Current speed Accuracy and score

                    ResultBar(size: size, acc: getAcc(), speed: getSpeed()),

                    /// * Text Section

                    TextSection(size: size, content: getWrapItems(size.width)),

                    ///* Divider
                    ///
                    SizedBox(height: size.height * 0.07),

                    /// * Restart Button

                    NeumorphicButton(
                      child: const Text(
                        'Restart',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.cyan,
                            fontFamily: 'Mouse'),
                      ),
                      onPressed: () {
                        setState(() {
                          restart();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
