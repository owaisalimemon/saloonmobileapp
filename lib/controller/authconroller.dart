import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getauth =
    ChangeNotifierProvider.family<AuthController, bool>((ref, check) {
  return AuthController(check);
});

class AuthController extends ChangeNotifier {
  TextEditingController phone = TextEditingController();
  String countryCode = '+92';
  String phonenowithcode = '';

  bool starttimer;

  AuthController(this.starttimer) {
    if (starttimer == true) {
      startTimer();
    }
  }

  bool isresendavailable = false;

  final maxSeconds = 60;
  int currentSecond = 0;
  Timer timer = Timer(Duration(seconds: 1), () {});

  String get timerText {
    final secondsPerMinute = 60;
    final secondsLeft = maxSeconds - currentSecond;

    final formattedMinutesLeft =
        (secondsLeft ~/ secondsPerMinute).toString().padLeft(2, '0');
    final formattedSecondsLeft =
        (secondsLeft % secondsPerMinute).toString().padLeft(2, '0');

    return '$formattedMinutesLeft : $formattedSecondsLeft';
  }

  void startTimer() {
    final duration = Duration(seconds: 1);
    timer = Timer.periodic(duration, (Timer timer) {
      currentSecond = timer.tick;

      notifyListeners();
      if (timer.tick >= maxSeconds) {
        isresendavailable = true;
        timer.cancel();

        notifyListeners();
      }
    });
  }
}
