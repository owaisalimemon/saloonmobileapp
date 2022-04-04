import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saloonmobileapp/UI/customer/homepage.dart';
import 'package:saloonmobileapp/UI/customer/saloonprofile.dart';

final getsaloon = ChangeNotifierProvider<SaloonController>((
  ref,
) {
  return SaloonController();
});

class SaloonController extends ChangeNotifier {
  int currentpage = 0;

  int selectedvaluefroservices = 0;

  OnboardingScreen(int page) {
    currentpage = page;
    notifyListeners();
  }

  checkselectedservices() {
    selectedvaluefroservices = 0;
    for (int i = 0; i < services.length; i++) {
      if (services[i].groupvalue != -1) {
        selectedvaluefroservices += 1;
      }
    }
    notifyListeners();
  }

  int checktoggle = 0;

  String? dropdownValue;

  changetoggle(int check) {
    this.checktoggle = check;
    notifyListeners();
  }

  SaloonController() {
    getfavouritesaloons();
  }
  List<Saloons> favoritesaloon = [];

  List<Services> addons = [
    Services(
        image: "assets/images/icons/hairstyleicon.png",
        title: "Lotion",
        subtitle: "Product Type",
        servicedetail: [
          Servicesdetail(
              title: "Body Lotion 500ml",
              subtitle: "Recommended for Soft skin",
              price: 50),
          Servicesdetail(
              title: "Body Lotion 800ml",
              subtitle: "Recommended for Soft skin",
              price: 50),
        ],
        groupvalue: -1),
    Services(
        image: "assets/images/icons/coloringandlashesicon.png",
        title: "Coloring",
        subtitle: "Product Type",
        servicedetail: [
          Servicesdetail(
              title: "Body Lotion 500ml",
              subtitle: "Recommended for Soft skin",
              price: 50),
          Servicesdetail(
              title: "Body Lotion 800ml",
              subtitle: "Recommended for Soft skin",
              price: 50),
        ],
        groupvalue: -1),
    Services(
        image: "assets/images/icons/coloringandlashesicon.png",
        title: "Lashes",
        subtitle: "Product Type",
        servicedetail: [
          Servicesdetail(
              title: "Body Lotion 500ml",
              subtitle: "Recommended for Soft skin",
              price: 50),
          Servicesdetail(
              title: "Body Lotion 800ml",
              subtitle: "Recommended for Soft skin",
              price: 50),
        ],
        groupvalue: -1),
    Services(
        image: "assets/images/icons/coloringandlashesicon.png",
        title: "Creative Coloring",
        subtitle: "Product Type",
        servicedetail: [
          Servicesdetail(
              title: "Body Lotion 500ml",
              subtitle: "Recommended for Soft skin",
              price: 50),
          Servicesdetail(
              title: "Body Lotion 800ml",
              subtitle: "Recommended for Soft skin",
              price: 50),
        ],
        groupvalue: -1)
  ];

  List<Services> services = [
    Services(
        image: "assets/images/icons/hairstyleicon.png",
        title: "HairStyling",
        subtitle: "Service Type",
        servicedetail: [
          Servicesdetail(
              title: "Cut with scissors, 60 min",
              subtitle: "Recommended with longer hairstyles",
              price: 0),
          Servicesdetail(
              title: "Cut with machine + scissors, 45 min",
              subtitle:
                  "Recommended for short hairstyles, machine and scissors",
              price: 0),
        ],
        groupvalue: -1),
    Services(
        image: "assets/images/icons/coloringandlashesicon.png",
        title: "Coloring",
        subtitle: "Service Type",
        servicedetail: [
          Servicesdetail(
              title: "Cut with scissors, 60 min",
              subtitle: "Recommended with longer hairstyles",
              price: 0),
          Servicesdetail(
              title: "Cut with machine + scissors, 45 min",
              subtitle:
                  "Recommended for short hairstyles, machine and scissors",
              price: 0),
        ],
        groupvalue: -1),
    Services(
        image: "assets/images/icons/coloringandlashesicon.png",
        title: "Lashes/Eyebrows",
        subtitle: "Service Type",
        servicedetail: [
          Servicesdetail(
              title: "Cut with scissors, 60 min",
              subtitle: "Recommended with longer hairstyles",
              price: 0),
          Servicesdetail(
              title: "Cut with machine + scissors, 45 min",
              subtitle:
                  "Recommended for short hairstyles, machine and scissors",
              price: 0),
        ],
        groupvalue: -1),
    Services(
        image: "assets/images/icons/coloringandlashesicon.png",
        title: "Creative Coloring",
        subtitle: "Service Type",
        servicedetail: [
          Servicesdetail(
              title: "Cut with scissors, 60 min",
              subtitle: "Recommended with longer hairstyles",
              price: 0),
          Servicesdetail(
              title: "Cut with machine + scissors, 45 min",
              subtitle:
                  "Recommended for short hairstyles, machine and scissors",
              price: 0),
        ],
        groupvalue: -1)
  ];

  List<Packageandodder> packagesandoffer = [
    Packageandodder(
        image: "assets/images/offerandpanckageimage.png",
        percentoff: 20,
        price: 320,
        name: "Manicure Pedicure",
        deal: "Double Deal",
        dealno: "#202020",
        validtill: "20th  Sept 2021",
        active: true),
    Packageandodder(
        image: "assets/images/offerandpanckageimage.png",
        percentoff: 20,
        price: 320,
        name: "Manicure Pedicure",
        deal: "Double Deal",
        dealno: "#202020",
        validtill: "20th  Sept 2021",
        active: false),
  ];

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

  List<String> photos = [
    'assets/images/photos1.png',
    'assets/images/photos2.png',
    'assets/images/photos3.png',
    'assets/images/photos1.png',
    'assets/images/photos2.png',
    'assets/images/photos3.png',
    'assets/images/photos1.png',
    'assets/images/photos2.png',
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
