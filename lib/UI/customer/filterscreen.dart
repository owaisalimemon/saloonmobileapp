import 'package:flutter/material.dart';
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
                    fontSize: width * 0.045),
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
              fontSize: width * 0.055),
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
                    fontSize: width * 0.045),
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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  StarRating(
                      star: controller.rating > 0
                          ? Icons.star
                          : Icons.star_border,
                      onPressed: () {
                        controller.rating = 1;
                        controller.notifyListeners();
                      }),
                  StarRating(
                      star: controller.rating > 1
                          ? Icons.star
                          : Icons.star_border,
                      onPressed: () {
                        controller.rating = 2;
                        controller.notifyListeners();
                      }),
                  StarRating(
                      star: controller.rating > 2
                          ? Icons.star
                          : Icons.star_border,
                      onPressed: () {
                        controller.rating = 3;
                        controller.notifyListeners();
                      }),
                  StarRating(
                      star: controller.rating > 3
                          ? Icons.star
                          : Icons.star_border,
                      onPressed: () {
                        controller.rating = 4;
                        controller.notifyListeners();
                      }),
                  StarRating(
                      star: controller.rating > 4
                          ? Icons.star
                          : Icons.star_border,
                      onPressed: () {
                        controller.rating = 5;
                        controller.notifyListeners();
                      }),
                  SizedBox(width: width * 0.03),
                  Text(
                    controller.rating.toString() + ".0",
                    style: TextStyle(
                        fontSize: width * 0.1, color: Color(0xff707070)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
