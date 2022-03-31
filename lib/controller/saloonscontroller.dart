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
  int checktoggle = 0;

  changetoggle(int check) {
    this.checktoggle = check;
    notifyListeners();
  }

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

  // List<Packageandodder> packagesandoffer = [
  //   Packageandodder(
  //       image: 'assets/images/offerandpanckageimage.png',
  //       percentoff: 20,
  //       price: 320,
  //       name: "Manicure Pedicure",
  //       deal: "Double Deal",
  //       dealno: "#202020",
  //       validtill: "20th  Sept 2021",
  //       active: true),
  //   Packageandodder(
  //       image: 'assets/images/offerandpanckageimage.png',
  //       percentoff: 20,
  //       price: 320,
  //       name: "Manicure Pedicure",
  //       deal: "Double Deal",
  //       dealno: "#202020",
  //       validtill: "20th  Sept 2021",
  //       active: false),
  // ];

  List<Categories> categori = [
    Categories(
        backimage: "assets/images/hairimage.png",
        fronticon: "assets/images/hairwhite.png",
        text: "Hair Saloon"),
    Categories(
        backimage: "assets/images/nailimage.png",
        fronticon: "assets/images/nailwhite.png",
        text: "Nail Saloon"),
    Categories(
        backimage: "assets/images/barberimage.png",
        fronticon: "assets/images/barberwhite.png",
        text: "Barber Shop"),
  ];

  getfavouritesaloons() {
    for (int i = 0; i < saloons.length; i++) {
      if (saloons[i].favourite == true) {
        favoritesaloon.add(saloons[i]);
      }
    }
  }
}
