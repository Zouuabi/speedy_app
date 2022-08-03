import 'dart:async' show Timer;

class TypingBrain {
  TypingBrain({required this.text});

  final List<String> text;

  /// I just use this variable to simulates the seconds
  int time = 0;

  int textIndex = 0;

  /// this flag is used to control the timer
  /// if [isTimerStopped] = true => timer is active
  /// if [isTimerStopped] = false => timer is canceled

  bool isTimerStopped = false;

  /// Once the user start typing it will be true
  bool isFirstTime = true;

  /// number of  [characters] typed by the user
  int characters = 0;

  void restart() {
    isTimerStopped = false;
    textIndex = 0;
    characters = 0;
    isFirstTime = true;
  }

  String getSpeed() {
    double dSpeed = ((characters / 5) * 60) / time;

    return dSpeed.toStringAsFixed(0);
  }

  void timer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      ++time;
      if (!isTimerStopped) {
        timer.cancel();
        time = 0;
      }
    });
  }
}
