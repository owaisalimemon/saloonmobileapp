import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getdata = ChangeNotifierProvider<OnboardingController>((ref) {
  return OnboardingController();
});

class OnboardingController extends ChangeNotifier {
  int currentpage = 0;

  OnboardingScreen(int page) {
    currentpage = page;
    notifyListeners();
  }
}
