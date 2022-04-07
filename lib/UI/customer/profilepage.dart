import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:saloonmobileapp/UI/widgets/roundbutton.dart';
import 'package:saloonmobileapp/extrahelper/colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffEEF5FE),
        elevation: 0,
        centerTitle: true,
        toolbarHeight: height * 0.1,
        title: Column(
          children: [
            Text(
              'My Profile',
              style: TextStyle(
                  fontSize: width * 0.06,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: height * 0.005),
            Text(
              'Edited 15 min ago',
              style: TextStyle(
                  fontSize: width * 0.04,
                  color: Color(0xff707070),
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: height * 0.05),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Container(
                  height: height * 0.175,
                  width: width * 0.35,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/images/profilepic.png",
                          ),
                          fit: BoxFit.fill)),
                ),
              ),
              Text(
                "John Deo",
                style: TextStyle(
                    fontSize: width * 0.065,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(
                "Account created on 01-02-2020",
                style: TextStyle(
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff707070)),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: height * 0.05,
                  width: width * 0.5,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    color: ColorsX.blue_gradient_dark,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(
                    child: Text("Show receipts",
                        style: TextStyle(
                          fontSize: width * 0.04,
                          color: ColorsX.white,
                          fontWeight: FontWeight.w900,
                        )),
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RatingBar.builder(
                    itemSize: width * 0.09,
                    ignoreGestures: true,
                    initialRating: 4,
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
                    onRatingUpdate: (rating) {},
                  ),
                  SizedBox(width: width * 0.05),
                  Text("4.0",
                      style: TextStyle(
                          fontSize: width * 0.06,
                          fontWeight: FontWeight.normal,
                          color: Color(0xff707070))),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.2),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.email_outlined,
                          size: width * 0.07,
                          color: Color(0xff70B4FF),
                        ),
                        SizedBox(
                          width: width * 0.05,
                        ),
                        Text(
                          "johndoe@gmail.com",
                          style: TextStyle(
                              fontSize: width * 0.06,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.02),
                    Row(
                      children: [
                        Icon(
                          Icons.phone_enabled_outlined,
                          size: width * 0.07,
                          color: Color(0xff70B4FF),
                        ),
                        SizedBox(
                          width: width * 0.05,
                        ),
                        Text(
                          "+456 256 966 896",
                          style: TextStyle(
                              fontSize: width * 0.06,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.02),
                    Row(
                      children: [
                        Icon(
                          Icons.date_range_outlined,
                          size: width * 0.07,
                          color: Color(0xff70B4FF),
                        ),
                        SizedBox(
                          width: width * 0.05,
                        ),
                        Text(
                          "30-01-1992",
                          style: TextStyle(
                              fontSize: width * 0.06,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.02),
                    GestureDetector(
                      onTap: () {
                        print("logout");
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.logout_sharp,
                            size: width * 0.07,
                            color: Color(0xff70B4FF),
                          ),
                          SizedBox(
                            width: width * 0.05,
                          ),
                          Text(
                            "Log Out",
                            style: TextStyle(
                                fontSize: width * 0.06,
                                fontWeight: FontWeight.normal,
                                color: Color(0xff70B4FF)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              RoundCustomButton(text: "Edit Profile", ontap: () {})
            ],
          ),
        ),
      ),
    );
  }
}
