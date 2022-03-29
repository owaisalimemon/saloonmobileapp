import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saloonmobileapp/UI/customer/homepage.dart';

final getnav = ChangeNotifierProvider<BottomContoller>((ref) {
  return BottomContoller();
});

class BottomContoller extends ChangeNotifier {
  int currentpage = 2;

  Widget routing = HomePageScreen();

  onchange(int page) {
    currentpage = page;
    notifyListeners();
  }

  List screens = [
    Container(color: Colors.red),
    Container(color: Colors.green),
    HomePageScreen(),
    Container(color: Colors.purple),
    Container(color: Colors.yellow),
  ];
}
