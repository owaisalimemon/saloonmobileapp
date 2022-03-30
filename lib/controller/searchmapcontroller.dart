import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:saloonmobileapp/UI/customer/homepage.dart';

final getsearchmap = ChangeNotifierProvider<SearchMapController>((
  ref,
) {
  return SearchMapController();
});

class SearchMapController extends ChangeNotifier {
  int checktoggle = 0;

  int rating = 0;

  bool hairstylefilterselected = false;
  bool makeupfilterselected = false;
  bool haircoloringfilterselected = false;
  bool spafilterselected = false;
  bool facialmakeupfilterselected = false;
  bool trimshavingfilterselected = false;
  bool hairbondingfilterselected = false;
  bool keratinfilterselected = false;
  bool facecleansingfilterselected = false;

  LatLng latLng = LatLng(23.5880, 58.3829);

  Completer<GoogleMapController> mapcontroller = Completer();

  changetoggle(int check) {
    this.checktoggle = check;
    notifyListeners();
  }
}
