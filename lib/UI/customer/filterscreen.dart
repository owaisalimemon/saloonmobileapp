import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:saloonmobileapp/UI/customer/widgets/filtechipcustom.dart';
import 'package:saloonmobileapp/UI/customer/widgets/starrating.dart';
import 'package:saloonmobileapp/controller/searchmapcontroller.dart';
import 'package:saloonmobileapp/extrahelper/colors.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    var controller = watch(getsearchmap);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    List<String> status = ["Male", "Female", "Other"];
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xffEEF5FE),
          leading: GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.only(left: width * 0.02),
              child: Center(
                child: Text(
                  "Cancel",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Color(0xff707070),
                      fontSize: width * 0.04),
                ),
              ),
            ),
          ),
          centerTitle: true,
          title: Text(
            "Filters",
            style: TextStyle(
                fontWeight: FontWeight.w900,
                color: ColorsX.blue_text_color,
                fontSize: width * 0.05),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: width * 0.02),
              child: Center(
                child: Text(
                  "Done",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Color(0xff707070),
                      fontSize: width * 0.04),
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(top: height * 0.05),
          child: Column(
            children: [
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
              SizedBox(height: height * 0.02),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.075, right: width * 0.075),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FilterCustomChip(
                            text: "Hairstyle",
                            selected: controller.hairstylefilterselected,
                            onSelected: (bool value) {
                              controller.hairstylefilterselected = value;
                              controller.notifyListeners();
                            }),
                        FilterCustomChip(
                            text: "Makeup",
                            selected: controller.makeupfilterselected,
                            onSelected: (bool value) {
                              controller.makeupfilterselected = value;
                              controller.notifyListeners();
                            }),
                        FilterCustomChip(
                            text: "Hair Coloring",
                            selected: controller.haircoloringfilterselected,
                            onSelected: (bool value) {
                              controller.haircoloringfilterselected = value;
                              controller.notifyListeners();
                            })
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.075, right: width * 0.075),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FilterCustomChip(
                            text: "Spa",
                            selected: controller.spafilterselected,
                            onSelected: (bool value) {
                              controller.spafilterselected = value;
                              controller.notifyListeners();
                            }),
                        FilterCustomChip(
                            text: "Facial Makeup",
                            selected: controller.facialmakeupfilterselected,
                            onSelected: (bool value) {
                              controller.facialmakeupfilterselected = value;
                              controller.notifyListeners();
                            }),
                        FilterCustomChip(
                            text: "Trim & Shaving",
                            selected: controller.trimshavingfilterselected,
                            onSelected: (bool value) {
                              controller.trimshavingfilterselected = value;
                              controller.notifyListeners();
                            }),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.075, right: width * 0.075),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FilterCustomChip(
                            text: "Hair Bonding",
                            selected: controller.hairbondingfilterselected,
                            onSelected: (bool value) {
                              controller.hairbondingfilterselected = value;
                              controller.notifyListeners();
                            }),
                        FilterCustomChip(
                            text: "Keratin",
                            selected: controller.keratinfilterselected,
                            onSelected: (bool value) {
                              controller.keratinfilterselected = value;
                              controller.notifyListeners();
                            }),
                        FilterCustomChip(
                            text: "Face Cleansing",
                            selected: controller.facecleansingfilterselected,
                            onSelected: (bool value) {
                              controller.facecleansingfilterselected = value;
                              controller.notifyListeners();
                            }),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: height * 0.04),
              Padding(
                padding: EdgeInsets.only(left: width * 0.075),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Rating",
                    style: TextStyle(
                        color: ColorsX.myblack,
                        fontWeight: FontWeight.w400,
                        fontSize: width * 0.05),
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.075, right: width * 0.075),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RatingBar.builder(
                      itemSize: width * 0.08,
                      initialRating: controller.rating,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding:
                          EdgeInsets.symmetric(horizontal: width * 0.0005),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Color(0xffF9D63E),
                      ),
                      onRatingUpdate: (rating) {
                        controller.rating = rating;
                        controller.notifyListeners();
                      },
                    ),
                    SizedBox(width: width * 0.05),
                    Text(controller.rating.toString(),
                        style: TextStyle(
                            fontSize: width * 0.055,
                            fontWeight: FontWeight.normal,
                            color: Color(0xff707070))),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: RadioListTile(
                      value: 0,
                      groupValue: controller.groupValue,
                      title: Text(
                        "Male",
                        style: TextStyle(fontSize: width * 0.025),
                      ),
                      onChanged: (newValue) {
                        controller.groupValue = int.parse(newValue.toString());
                        controller.notifyListeners();
                      },
                      activeColor: ColorsX.blue_text_color,
                      selected: false,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: RadioListTile(
                      value: 1,
                      groupValue: controller.groupValue,
                      title: Text("Female",
                          style: TextStyle(fontSize: width * 0.025)),
                      onChanged: (newValue) {
                        controller.groupValue = int.parse(newValue.toString());
                        controller.notifyListeners();
                      },
                      activeColor: ColorsX.blue_text_color,
                      selected: false,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: RadioListTile(
                      value: 2,
                      groupValue: controller.groupValue,
                      title: Text("Other",
                          style: TextStyle(fontSize: width * 0.025)),
                      onChanged: (newValue) {
                        controller.groupValue = int.parse(newValue.toString());
                        controller.notifyListeners();
                      },
                      activeColor: ColorsX.blue_text_color,
                      selected: false,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
