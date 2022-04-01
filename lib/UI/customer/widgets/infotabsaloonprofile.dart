import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:saloonmobileapp/UI/widgets/roundbutton.dart';
import 'package:saloonmobileapp/controller/saloonscontroller.dart';
import 'package:saloonmobileapp/extrahelper/colors.dart';

class InfoTabProfileScreen extends StatelessWidget {
  InfoTabProfileScreen({required this.controller});

  SaloonController controller;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(top: height * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: width * 0.1),
            child: Text("About",
                style: TextStyle(
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.normal,
                    color: Colors.black)),
          ),
          SizedBox(height: height * 0.02),
          Padding(
            padding: EdgeInsets.only(
              left: width * 0.1,
            ),
            child: Text(
                "Step into our salon and experience the most contemporary hair cutting, coloring. The perfect introduction for someone new to professional skin care",
                style: TextStyle(
                    fontSize: width * 0.045,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff707070))),
          ),
          SizedBox(height: height * 0.04),
          Padding(
            padding: EdgeInsets.only(left: width * 0.1),
            child: Text("Opening Hours",
                style: TextStyle(
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.normal,
                    color: Colors.black)),
          ),
          SizedBox(height: height * 0.02),
          Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.1, right: width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: height * 0.02,
                          width: width * 0.04,
                          decoration: BoxDecoration(
                              color: Color(0xff70B4FF), shape: BoxShape.circle),
                        ),
                        SizedBox(width: width * 0.04),
                        Text("Monday" + "-" + "Friday",
                            style: TextStyle(
                                fontSize: width * 0.045,
                                fontWeight: FontWeight.normal,
                                color: Color(0xff707070))),
                      ],
                    ),
                    Text("8:30 AM" + "-" + "9:30 PM",
                        style: TextStyle(
                            fontSize: width * 0.045,
                            fontWeight: FontWeight.normal,
                            color: Color(0xff707070)))
                  ],
                ),
              ),
              SizedBox(height: height * 0.01),
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.1, right: width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: height * 0.02,
                          width: width * 0.04,
                          decoration: BoxDecoration(
                              color: Color(0xff70B4FF), shape: BoxShape.circle),
                        ),
                        SizedBox(width: width * 0.04),
                        Text("Saturday" + "-" + "Sunday",
                            style: TextStyle(
                                fontSize: width * 0.045,
                                fontWeight: FontWeight.normal,
                                color: Color(0xff707070))),
                      ],
                    ),
                    Text("9:00 AM" + "-" + "5:30 PM",
                        style: TextStyle(
                            fontSize: width * 0.045,
                            fontWeight: FontWeight.normal,
                            color: Color(0xff707070)))
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: height * 0.04),
          Padding(
            padding: EdgeInsets.only(
              left: width * 0.1,
              right: width * 0.05,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Address",
                        style: TextStyle(
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.normal,
                            color: Colors.black)),
                    SizedBox(height: height * 0.02),
                    Text("288 Empola Street, NewYork",
                        style: TextStyle(
                            fontSize: width * 0.045,
                            fontWeight: FontWeight.normal,
                            color: Color(0xff707070))),
                    SizedBox(height: height * 0.01),
                    GestureDetector(
                      onTap: () {
                        print("clieckd");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: width * 0.07,
                            color: Color(0xff70B4FF),
                          ),
                          Text("Get Directions-" + "12km",
                              style: TextStyle(
                                  fontSize: width * 0.045,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xff70B4FF))),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  height: height * 0.13,
                  width: width * 0.3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/mapimage.png")),
                      borderRadius: BorderRadius.circular(15)),
                ),
              ],
            ),
          ),
          SizedBox(height: height * 0.04),
          Padding(
            padding: EdgeInsets.only(
              left: width * 0.1,
              right: width * 0.05,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Photos",
                      style: TextStyle(
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.normal,
                          color: Colors.black)),
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
            height: height * 0.09,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: controller.photos.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        left: index == 0 ? width * 0.1 : width * 0.03),
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                          height: height * 0.08,
                          width: width * 0.18,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.red,
                              image: DecorationImage(
                                  image: AssetImage(controller.photos[index]),
                                  fit: BoxFit.fill))),
                    ),
                  );
                }),
          ),
          SizedBox(height: height * 0.04),
          Padding(
            padding: EdgeInsets.only(left: width * 0.1),
            child: Text("Reviews",
                style: TextStyle(
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.normal,
                    color: Colors.black)),
          ),
          SizedBox(height: height * 0.02),
          Container(
            height: height * 0.26,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        left: index == 0 ? width * 0.1 : width * 0.03),
                    child: GestureDetector(
                      onTap: () {},
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 2,
                        child: Container(
                          height: height * 0.25,
                          width: width * 0.75,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: width * 0.03, top: height * 0.01),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          height: height * 0.12,
                                          width: width * 0.25,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xff70B4FF)),
                                        ),
                                        Container(
                                          height: height * 0.115,
                                          width: width * 0.24,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/emplyeeimage.png'),
                                                  fit: BoxFit.cover)),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: height * 0.025,
                                          left: width * 0.04),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Jim Fernandez",
                                              style: TextStyle(
                                                  fontSize: width * 0.055,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff707070))),
                                          SizedBox(height: height * 0.02),
                                          RatingBar.builder(
                                            itemSize: width * 0.06,
                                            ignoreGestures: true,
                                            initialRating: 3,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemPadding: EdgeInsets.symmetric(
                                                horizontal: width * 0.0005),
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Color(0xffF9D63E),
                                            ),
                                            onRatingUpdate: (rating) {},
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: width * 0.03, top: height * 0.01),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Text("15th  May 2020",
                                            style: TextStyle(
                                                fontSize: width * 0.04,
                                                fontWeight: FontWeight.normal,
                                                color: Color(0xff70B4FF))),
                                        SizedBox(height: height * 0.025),
                                        Text("02:26 PM",
                                            style: TextStyle(
                                                fontSize: width * 0.04,
                                                fontWeight: FontWeight.normal,
                                                color: Color(0xff70B4FF))),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: width * 0.04),
                                      child: Container(
                                        width: width * 0.4,
                                        child: Text(
                                            "Fast shipping & excellent customer service. I had an issue with my order them they replied quickly",
                                            style: TextStyle(
                                                fontSize: width * 0.04,
                                                fontWeight: FontWeight.normal,
                                                color: Color(0xff707070))),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(height: height * 0.04),
          Center(child: RoundCustomButton(text: "Book Now", ontap: () {}))
        ],
      ),
    );
  }
}
