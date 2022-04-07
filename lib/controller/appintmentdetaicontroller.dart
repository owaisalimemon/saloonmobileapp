import 'dart:async';
import 'dart:convert';

import 'package:ars_dialog/ars_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saloonmobileapp/UI/customer/apointmentpage.dart';
import 'package:saloonmobileapp/UI/mainscreen/phonenumberscreen.dart';
import 'package:saloonmobileapp/helper/snackbar.dart';
import 'package:saloonmobileapp/helper/validation.dart';

final getappointmentdetal =
    ChangeNotifierProvider.family<AppointmentDetailController, bool>(
        (ref, check) {
  return AppointmentDetailController(check);
});

class AppointmentDetailController extends ChangeNotifier {
  AppointmentDetailController(this.starttimer) {
    startTimer();
  }

  bool starttimer;

  Timer? countdownTimer;
  Duration myDuration = Duration(days: 5);

  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    final reduceSecondsBy = 1;

    final seconds = myDuration.inSeconds - reduceSecondsBy;
    if (seconds < 0) {
      countdownTimer!.cancel();
    } else {
      myDuration = Duration(seconds: seconds);
    }
    notifyListeners();
  }

  String strDigits(int n) => n.toString().padLeft(2, '0');

  // bool isresendavailable = false;

  // final maxSeconds = 7200;
  // final maxminutes = 60;
  // final maxhours = 24;
  // int currentSecond = 0;

  // Timer timer = Timer(Duration(seconds: 1), () {});

  // String get timerText {
  //   final secondsPerMinute = 60;
  //   final secondsLeft = maxSeconds - currentSecond;

  //   final formattedhoursLeft =
  //       (3600 / secondsLeft).toInt().toString().padLeft(2, '0');
  //   final formattedMinutesLeft =
  //       (secondsLeft ~/ secondsPerMinute).toString().padLeft(2, '0');
  //   final formattedSecondsLeft =
  //       (secondsLeft % secondsPerMinute).toString().padLeft(2, '0');

  //   return '$formattedhoursLeft : $formattedMinutesLeft : $formattedSecondsLeft';
  // }

  // void startTimer() {
  //   final duration = Duration(seconds: 1);
  //   timer = Timer.periodic(duration, (Timer timer) {
  //     currentSecond = timer.tick;

  //     notifyListeners();
  //     if (timer.tick >= maxSeconds) {
  //       isresendavailable = true;
  //       timer.cancel();

  //       notifyListeners();
  //     }
  //   });
  // }
}
