import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:saloonmobileapp/UI/customer/widgets/favoritesaloonhorizontal.dart';
import 'package:saloonmobileapp/UI/customer/widgets/salooncard.dart';
import 'package:saloonmobileapp/UI/customer/widgets/salooncard.dart';
import 'package:saloonmobileapp/UI/customer/widgets/saloonfavouritecard.dart';
import 'package:saloonmobileapp/UI/customer/widgets/saloonhorizontal.dart';
import 'package:saloonmobileapp/UI/customer/widgets/saloonmapcard.dart';
import 'package:saloonmobileapp/controller/saloonscontroller.dart';
import 'package:saloonmobileapp/controller/searchmapcontroller.dart';
import 'package:saloonmobileapp/extrahelper/colors.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Favouritepage extends ConsumerWidget {
  Favouritepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    var controller = watch(getsaloon);
    var togglecontroller = watch(getsearchmap);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
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
                  togglecontroller.checktoggle == 0
                      ? Padding(
                          padding: EdgeInsets.only(left: width * 0.075),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Hello, John Doe",
                                style: TextStyle(
                                    color: ColorsX.blue_text_color,
                                    fontSize: width * 0.08,
                                    fontWeight: FontWeight.w900),
                              ),
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
                        )
                      : SizedBox(),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: [
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
                          ],
                        ),

                        Row(
                          children: [
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
                          ],
                        ),
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
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (context) => Searchhome()));
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
                  ListView.builder(
                      itemCount: controller.favoritesaloon.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return FavSaloonhorizontalCard(
                            index: index, controller: controller);
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
