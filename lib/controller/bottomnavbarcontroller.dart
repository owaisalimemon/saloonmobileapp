import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saloonmobileapp/UI/customer/apointmentpage.dart';
import 'package:saloonmobileapp/UI/customer/favoritepage.dart';
import 'package:saloonmobileapp/UI/customer/homepage.dart';
import 'package:saloonmobileapp/UI/customer/messagescree.dart';
import 'package:saloonmobileapp/UI/customer/profilepage.dart';

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
    ProfilePage(),
    Favouritepage(),
    HomePageScreen(),
    MessageScreen(),
    AppointmentPage()
  ];
}
