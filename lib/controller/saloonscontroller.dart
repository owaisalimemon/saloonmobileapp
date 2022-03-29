import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saloonmobileapp/UI/customer/homepage.dart';

final getsaloon = ChangeNotifierProvider<SaloonController>((
  ref,
) {
  return SaloonController();
});

class SaloonController extends ChangeNotifier {
  SaloonController() {
    getfavouritesaloons();
  }
  List<Saloons> favoritesaloon = [];
  List<Saloons> saloons = [
    Saloons(
        name: "Looks Unisex Saloon",
        image: "assets/images/salooimage.png",
        address: "288 Empola Street",
        rating: 4,
        weekdays: "Monday-Sunday",
        distance: "12km away",
        timings: "02:00 pm - 06:00 pm",
        favourite: false,
        neworold: true,
        openorclose: true),
    Saloons(
        name: "Looks Unisex Saloon",
        image: "assets/images/salooimage.png",
        address: "288 Empola Street",
        rating: 4,
        weekdays: "Monday-Sunday",
        distance: "12km away",
        timings: "02:00 pm - 06:00 pm",
        favourite: false,
        neworold: true,
        openorclose: true),
    Saloons(
        name: "Looks UniSex Saloon",
        image: "assets/images/salooimage.png",
        address: "288 Empolaa Street",
        rating: 3,
        weekdays: "Monday-Friday",
        distance: "10km away",
        timings: "01:00 pm - 06:00 pm",
        favourite: false,
        neworold: false,
        openorclose: false)
  ];

  getfavouritesaloons() {
    for (int i = 0; i < saloons.length; i++) {
      if (saloons[i].favourite == true) {
        favoritesaloon.add(saloons[i]);
      }
    }
  }
}
