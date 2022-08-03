import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:speedy/screens/indicator.dart';
import 'package:speedy/text.dart';
import '../constanst.dart';
import 'result_screen.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart'
    show NeumorphicButton;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// *I just use this variable to simulates the seconds
  int time = 0;

  int textIndex = 0;

  /// *this flag is used to control the timer
  /// * if [isTimerStopped] = true => timer is active
  /// *if [isTimerStopped] = false => timer is canceled

  bool isTimerStopped = false;

  /// * Once the user start typing it will be true
  bool isFirstTime = true;

  /// * number of  [characters] typed by the user
  int characters = 100;

  /// * splitting the text into a list of char
  List<String> splitedText = [];

  void restart() {
    setState(() {
      isTimerStopped = false;
      textIndex = 0;
      characters = 100;
      isFirstTime = true;
    });
  }

  String getSpeed() {
    double dSpeed = ((characters / 5) * 60) / time;
    if (dSpeed == double.infinity) {
      return '911';
    }
    return dSpeed.toStringAsFixed(0);
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

  List<Indicator> getWrapItems() {
    List<Indicator> wrapItems = [];

    for (int i = 0; i < splitedText.length; ++i) {
      Indicator currentIndicator = Indicator(
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

  @override
  void initState() {
    super.initState();
    getRandomText();
  }

  /// Todo : Implement the featrue of showing result with show dialogue
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      // ****************************************** */
      // Keybord events

      onKey: (event) async {
        final key = event.logicalKey.keyLabel;

        if (isFirstTime) {
          characters = 0;
          isTimerStopped = true;
          isFirstTime = false;
          timer();
        }

        setState(() {
          if (textIndex == splitedText.length) {
            String finalSpeed = getSpeed();
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: ((context) {
              return ResultScreen(speed: finalSpeed);
            })));
          } else if (key.toLowerCase() == splitedText[textIndex]) {
            characters++;
            ++textIndex;
          } else if (key.toLowerCase() !=
              splitedText[textIndex].toLowerCase()) {
            /// TOdo : each mistake the accuracy decrease
          }
        });
      },

      child: Scaffold(
          backgroundColor: Colors.grey.shade300,
          body: Hero(
            tag: 'hero',
            child: Center(
              child: Container(
                width: size.width * 0.7,
                height: double.infinity,
                decoration: kBigBoxDecoration,
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

                    Container(
                      decoration: kBigBoxDecoration,
                      margin: const EdgeInsets.only(
                          top: 20, bottom: 10, right: 350),
                      padding: const EdgeInsets.all(10),
                      width: size.width * 0.3,
                      height: size.height * 0.06,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Speed: ${getSpeed()}",
                              style: kSubtitleStyle,
                            ),
                            const Text(
                              /// Todo : Implement the functionality accuracy
                              "Accuracy: 97%",
                              style: kSubtitleStyle,
                            ),

                            /// todo : add the feature of scoring
                            const Text("Score: 800", style: kSubtitleStyle)
                          ]),
                    ),

                    /// * Text Section

                    Container(
                      padding: const EdgeInsets.all(15),
                      width: size.width * 0.6,

                      decoration: kBigBoxDecoration,

                      /// ToDO : I have to implement the grid builder to be able to
                      /// Todo : control the that text return to new line
                      child: Wrap(
                        children: getWrapItems(),
                      ),
                    ),

                    ///* Divider
                    ///
                    SizedBox(height: size.height * 0.07),

                    /// * Restart Button

                    NeumorphicButton(
                      child: const Text(
                        'Restart',
                        style: TextStyle(fontSize: 25, color: Colors.cyan),
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

  /// * i Tried this before but it does not give a controll on the Grid
  /// * children as the adobpted solution did

  GridView solution0() {
    return GridView.builder(
        itemCount: splitedText.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 20),
        itemBuilder: (context, index) {
          return Indicator(
              index: index, textIndex: textIndex, child: splitedText[index]);
        });
  }
}

//  TextField(
//                         decoration: const InputDecoration(
//                             hintText: "Start Typing...",
//                             filled: true,
//                             fillColor: Colors.white),
//                         onChanged: (value) {
//                           setState(() {
//                             currentValue = value;
//                             checker();
//                           });
//                         },
//                       )
