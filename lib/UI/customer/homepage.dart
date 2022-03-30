import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saloonmobileapp/UI/customer/searchhome.dart';
import 'package:saloonmobileapp/UI/customer/widgets/salooncard.dart';
import 'package:saloonmobileapp/UI/customer/widgets/salooncard.dart';
import 'package:saloonmobileapp/UI/customer/widgets/saloonfavouritecard.dart';
import 'package:saloonmobileapp/controller/saloonscontroller.dart';
import 'package:saloonmobileapp/extrahelper/colors.dart';

class Categories {
  String backimage;
  String fronticon;
  String text;
  Categories(
      {required this.backimage, required this.fronticon, required this.text});
}

class Saloons {
  String name;
  String image;
  String address;
  String weekdays;
  String distance;
  String timings;
  double rating;
  bool neworold;
  bool openorclose;
  bool favourite;

  Saloons(
      {required this.name,
      required this.image,
      required this.rating,
      required this.address,
      required this.weekdays,
      required this.distance,
      required this.timings,
      required this.favourite,
      required this.neworold,
      required this.openorclose});
}

class Packageandodder {
  int percentoff;
  int price;
  String name;
  String deal;
  String dealno;
  String validtill;
  bool active;

  Packageandodder(
      {required this.percentoff,
      required this.price,
      required this.name,
      required this.deal,
      required this.dealno,
      required this.validtill,
      required this.active});
}

class HomePageScreen extends ConsumerWidget {
  HomePageScreen({Key? key}) : super(key: key);

  List<Packageandodder> packagesandoffer = [
    Packageandodder(
        percentoff: 20,
        price: 320,
        name: "Manicure Pedicure",
        deal: "Double Deal",
        dealno: "#202020",
        validtill: "20th  Sept 2021",
        active: true),
    Packageandodder(
        percentoff: 20,
        price: 320,
        name: "Manicure Pedicure",
        deal: "Double Deal",
        dealno: "#202020",
        validtill: "20th  Sept 2021",
        active: false),
  ];

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

  @override
  Widget build(BuildContext context, watch) {
    var controller = watch(getsaloon);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: height * 0.37,
            width: width,
            child: Image.asset(
              "assets/images/top_blue.png",
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: height * 0.07,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: width * 0.075),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Hello, John Doe",
                        style: TextStyle(
                            color: ColorsX.blue_text_color,
                            fontSize: width * 0.08,
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(width: width * 0.12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.notifications_none_sharp,
                                size: width * 0.07,
                                color: Color(0xff707070),
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.filter_alt_sharp,
                                size: width * 0.07,
                                color: Color(0xff707070),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.03),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.075),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Your location",
                      style: TextStyle(
                          color: ColorsX.myblack,
                          fontWeight: FontWeight.w400,
                          fontSize: width * 0.05),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.075),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.location_pin,
                            size: width * 0.07,
                            color: Colors.black,
                          )),

                      Text(
                        "New york",
                        style: TextStyle(
                            color: ColorsX.myblack,
                            fontWeight: FontWeight.w400,
                            fontSize: width * 0.05),
                      ),

                      SizedBox(
                        width: width * 0.265,
                      ),
                      Text(
                        "Change",
                        style: TextStyle(
                            color: ColorsX.blue_text_color,
                            fontWeight: FontWeight.w400,
                            fontSize: width * 0.05),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.change_history_rounded,
                            size: width * 0.07,
                            color: ColorsX.blue_text_color,
                          )),
                      // Expanded(child: _myLocationText(context, "Change", 0xff70b4ff))
                    ],
                  ),
                ),
                SizedBox(height: height * 0.02),
                Padding(
                  padding: EdgeInsets.only(
                      left: width * 0.075, right: width * 0.075),
                  child: Container(
                    decoration: new BoxDecoration(
                        color: ColorsX.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: TextFormField(
                            controller: TextEditingController(),
                            style: TextStyle(color: ColorsX.subBlack),
                            keyboardType: TextInputType.text,
                            minLines: 1,
                            decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: "Search for salons",
                              contentPadding:
                                  EdgeInsets.only(left: width * 0.05),
                              hintStyle: TextStyle(color: ColorsX.subBlack),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Searchhome()));
                          },
                          child: Container(
                            height: height * 0.06,
                            width: width * 0.12,
                            decoration: BoxDecoration(
                                color: ColorsX.blue_button_color,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10))),
                            // padding: EdgeInsets.all(20),
                            child: Icon(
                              Icons.search,
                              color: ColorsX.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height * 0.08),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.075),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Categories",
                      style: TextStyle(
                          color: ColorsX.myblack,
                          fontWeight: FontWeight.w400,
                          fontSize: width * 0.05),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.01),
                Container(
                  height: height * 0.15,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: categori.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              left: index == 0 ? width * 0.075 : width * 0.03),
                          child: GestureDetector(
                            onTap: () {
                              print("clicked");
                            },
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Container(
                                  height: height * 0.15,
                                  width: width * 0.35,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                          image: AssetImage(
                                            categori[index].backimage,
                                          ),
                                          fit: BoxFit.fill)),
                                  child: Container(
                                    height: height * 0.15,
                                    width: width * 0.35,
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(top: height * 0.01),
                                      child: Align(
                                        alignment: Alignment.topCenter,
                                        child: Image.asset(
                                          categori[index].fronticon,
                                          scale: width * 0.009,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: height * 0.05,
                                  width: width * 0.35,
                                  decoration: BoxDecoration(
                                    color: ColorsX.blue_text_color,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                      child: Text(
                                    categori[index].text,
                                    style: TextStyle(
                                        fontSize: width * 0.04,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(height: height * 0.08),
                Padding(
                  padding: EdgeInsets.only(
                      left: width * 0.075, right: width * 0.075),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Top Saloons",
                          style: TextStyle(
                              color: ColorsX.myblack,
                              fontWeight: FontWeight.w400,
                              fontSize: width * 0.05),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "View All",
                          style: TextStyle(
                              color: ColorsX.blue_text_color,
                              fontWeight: FontWeight.w400,
                              fontSize: width * 0.05),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.02),
                Container(
                    height: height * 0.31,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: controller.saloons.length,
                        itemBuilder: (context, index) {
                          return SaloonCard(
                              index: index, controller: controller);
                        })),
                SizedBox(height: height * 0.08),
                Padding(
                  padding: EdgeInsets.only(
                      left: width * 0.075, right: width * 0.075),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Special Packages & Offers",
                          style: TextStyle(
                              color: ColorsX.myblack,
                              fontWeight: FontWeight.w400,
                              fontSize: width * 0.05),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "View All",
                          style: TextStyle(
                              color: ColorsX.blue_text_color,
                              fontWeight: FontWeight.w400,
                              fontSize: width * 0.05),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.02),
                Container(
                    height: height * 0.26,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: packagesandoffer.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                left:
                                    index == 0 ? width * 0.075 : width * 0.03),
                            child: GestureDetector(
                              onTap: () {
                                print("clicked");
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                elevation: 5,
                                child: Container(
                                    height: height * 0.25,
                                    width: width * 0.75,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.red,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/offerandpanckageimage.png"),
                                            fit: BoxFit.fill)),
                                    child: Container(
                                      height: height * 0.25,
                                      width: width * 0.75,
                                      decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.4),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Stack(
                                        children: [
                                          Positioned(
                                              top: height * 0.03,
                                              right: width * 0.015,
                                              child: Text(
                                                packagesandoffer[index]
                                                        .percentoff
                                                        .toString() +
                                                    "% \nOff",
                                                style: TextStyle(
                                                    fontSize: width * 0.1,
                                                    color: Color(0xffFF770E),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                          Positioned(
                                            top: height * 0.12,
                                            right: width * 0.03,
                                            child: Container(
                                              height: height * 0.04,
                                              width: width * 0.18,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color: packagesandoffer[index]
                                                          .active
                                                      ? Color(0xff56D91F)
                                                      : Colors.red),
                                              child: Center(
                                                  child: Text(
                                                      packagesandoffer[index]
                                                              .active
                                                          ? "Active"
                                                          : "Deactive",
                                                      style: TextStyle(
                                                          fontSize:
                                                              width * 0.04,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Colors.white))),
                                            ),
                                          ),
                                          Positioned(
                                              top: height * 0.18,
                                              right: width * 0.03,
                                              child: Text(
                                                "Valid only",
                                                style: TextStyle(
                                                    fontSize: width * 0.04,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              )),
                                          Positioned(
                                              top: height * 0.21,
                                              right: width * 0.03,
                                              child: Text(
                                                packagesandoffer[index]
                                                    .validtill,
                                                style: TextStyle(
                                                    fontSize: width * 0.04,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              )),
                                          Positioned(
                                              top: height * 0.02,
                                              left: width * 0.03,
                                              child: Text(
                                                "Deal",
                                                style: TextStyle(
                                                    fontSize: width * 0.04,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              )),
                                          Positioned(
                                              top: height * 0.04,
                                              left: width * 0.03,
                                              child: Text(
                                                packagesandoffer[index].dealno,
                                                style: TextStyle(
                                                    fontSize: width * 0.04,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                          Positioned(
                                              top: height * 0.09,
                                              left: width * 0.03,
                                              child: Text(
                                                packagesandoffer[index].deal,
                                                style: TextStyle(
                                                    fontSize: width * 0.05,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              )),
                                          Positioned(
                                              top: height * 0.12,
                                              left: width * 0.03,
                                              child: Text(
                                                packagesandoffer[index].name,
                                                style: TextStyle(
                                                    fontSize: width * 0.055,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                          Positioned(
                                              bottom: height * 0.06,
                                              left: width * 0.03,
                                              child: Text(
                                                "Price",
                                                style: TextStyle(
                                                    fontSize: width * 0.05,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              )),
                                          Positioned(
                                              bottom: height * 0.03,
                                              left: width * 0.03,
                                              child: RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                    text:
                                                        packagesandoffer[index]
                                                                .price
                                                                .toString() +
                                                            "\$",
                                                    style: TextStyle(
                                                        fontSize: width * 0.05,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  TextSpan(
                                                    text: "   4̶0̶0̶\$",
                                                    style: TextStyle(
                                                        fontSize: width * 0.05,
                                                        color:
                                                            Color(0xffF35162),
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ]),
                                              )),
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                          );
                        })),
                SizedBox(height: height * 0.08),
                Padding(
                  padding: EdgeInsets.only(
                      left: width * 0.075, right: width * 0.075),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Favorite Saloons",
                          style: TextStyle(
                              color: ColorsX.myblack,
                              fontWeight: FontWeight.w400,
                              fontSize: width * 0.05),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "View All",
                          style: TextStyle(
                              color: ColorsX.blue_text_color,
                              fontWeight: FontWeight.w400,
                              fontSize: width * 0.05),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.02),
                Container(
                    height: height * 0.31,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: controller.favoritesaloon.length,
                        itemBuilder: (context, index) {
                          return SaloonFavouriteCard(
                              index: index, controller: controller);
                        })),
                SizedBox(height: height * 0.02),
              ],
            ),
          )
        ],
      ),
    );
  }
}
