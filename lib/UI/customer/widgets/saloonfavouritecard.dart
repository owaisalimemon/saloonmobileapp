import 'package:flutter/material.dart';
import 'package:saloonmobileapp/controller/saloonscontroller.dart';
import 'package:saloonmobileapp/extrahelper/colors.dart';

class SaloonFavouriteCard extends StatelessWidget {
  SaloonFavouriteCard({required this.index, required this.controller});

  SaloonController controller;
  int index;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: index == 0 ? width * 0.075 : width * 0.03),
      child: GestureDetector(
        onTap: () {
          print("again clicked");
        },
        child: Card(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Container(
            height: height * 0.3,
            width: width * 0.75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: ColorsX.blue_text_color,
            ),
            child: Column(
              children: [
                SizedBox(height: height * 0.001),
                Container(
                    height: height * 0.2,
                    width: width * 0.745,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                        color: Colors.blue,
                        image: DecorationImage(
                            image: AssetImage(
                              controller.favoritesaloon[index].image,
                            ),
                            fit: BoxFit.fill)),
                    child: Container(
                        height: height * 0.2,
                        width: width * 0.745,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.4),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                        ),
                        child: Stack(
                          children: [
                            controller.favoritesaloon[index].neworold
                                ? Container(
                                    height: height * 0.045,
                                    width: width * 0.2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          bottomRight: Radius.circular(15)),
                                      color: ColorsX.blue_text_color,
                                    ),
                                    child: Center(
                                        child: Text("New",
                                            style: TextStyle(
                                                fontSize: width * 0.045,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white))),
                                  )
                                : Container(),
                            Positioned(
                              top: height * 0.02,
                              right: width * 0.03,
                              child: InkWell(
                                onTap: () {
                                  print("favourite clicked");

                                  controller.favoritesaloon[index].favourite =
                                      !controller
                                          .favoritesaloon[index].favourite;

                                  controller.favoritesaloon.clear();

                                  controller.getfavouritesaloons();
                                  controller.notifyListeners();
                                },
                                child: Container(
                                  height: height * 0.045,
                                  width: width * 0.09,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: controller
                                            .favoritesaloon[index].favourite
                                        ? Colors.red.withOpacity(0.5)
                                        : Colors.black.withOpacity(0.5),
                                  ),
                                  child: Icon(
                                    controller.favoritesaloon[index].favourite
                                        ? Icons.favorite_outlined
                                        : Icons.favorite_border_sharp,
                                    color: controller
                                            .favoritesaloon[index].favourite
                                        ? Colors.red
                                        : Colors.white,
                                    size: width * 0.05,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: height * 0.02,
                              right: width * 0.03,
                              child: Container(
                                height: height * 0.04,
                                width: width * 0.15,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: controller
                                          .favoritesaloon[index].openorclose
                                      ? Color(0xff56D91F)
                                      : Colors.red,
                                ),
                                child: Center(
                                    child: Text(
                                        controller.favoritesaloon[index]
                                                .openorclose
                                            ? "Open"
                                            : "Close",
                                        style: TextStyle(
                                            fontSize: width * 0.04,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white))),
                              ),
                            ),
                          ],
                        ))),
                Container(
                  height: height * 0.099,
                  width: width * 0.75,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                      color: Colors.white),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.03,
                        right: width * 0.03,
                        top: height * 0.005,
                        bottom: height * 0.008),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(controller.favoritesaloon[index].name,
                                style: TextStyle(
                                    fontSize: width * 0.05,
                                    color: Colors.black)),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.star_outline_rounded,
                                  color: Color(0xffF9D63E),
                                  size: width * 0.06,
                                ),
                                Text(
                                  controller.favoritesaloon[index].rating
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: width * 0.04,
                                      color: Colors.black),
                                )
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/icons/saloonpinicon.png',
                                      scale: width * 0.007,
                                    ),
                                    SizedBox(width: width * 0.02),
                                    Text(
                                      controller.favoritesaloon[index].address,
                                      style: TextStyle(
                                          fontSize: width * 0.035,
                                          color: Color(0xff707070)),
                                    )
                                  ],
                                ),
                                SizedBox(height: height * 0.005),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/icons/saloonlocationicon.png',
                                      scale: width * 0.007,
                                    ),
                                    SizedBox(width: width * 0.02),
                                    Text(
                                      controller.favoritesaloon[index].distance,
                                      style: TextStyle(
                                          fontSize: width * 0.035,
                                          color: Color(0xff707070)),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/icons/salooncalendaricon.png',
                                      scale: width * 0.007,
                                    ),
                                    SizedBox(width: width * 0.02),
                                    Text(
                                      controller.favoritesaloon[index].weekdays,
                                      style: TextStyle(
                                          fontSize: width * 0.035,
                                          color: Color(0xff707070)),
                                    )
                                  ],
                                ),
                                SizedBox(height: height * 0.005),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/icons/saloonclockicon.png',
                                      scale: width * 0.007,
                                    ),
                                    SizedBox(width: width * 0.02),
                                    Text(
                                      controller.favoritesaloon[index].timings,
                                      style: TextStyle(
                                          fontSize: width * 0.035,
                                          color: Color(0xff707070)),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
