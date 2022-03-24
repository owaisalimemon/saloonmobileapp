import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saloonmobileapp/extrahelper/colors.dart';

class ConnectWith extends StatelessWidget {
  double? height, width;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: height,
            width: width,
            child: Image.asset(
              'assets/images/dark_girl_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              Container(
                height: 100,
                width: 100,
                margin: EdgeInsets.only(left: width * 0.10, top: height * 0.1),
                child: Image.asset(
                  'assets/images/logo_splash.png',
                  fit: BoxFit.cover,
                  height: 80,
                  width: 80,
                ),
              ),
              Container(
                height: 40,
                width: 140,
                margin: EdgeInsets.only(left: width * 0.10, top: height * 0.1),
                child: Image.asset(
                  "assets/images/big_logo.png",
                  fit: BoxFit.cover,
                ),
              ),
              textWidgets(
                  "Book an appointment for Salon, Spa & Barber", 20, context),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/login');
                  // Get.toNamed(Routes.LOGIN_SCREEN);
                },
                child: getRowElementFirst("Sign up with email", context,
                    height * 0.1 * 62, 0xffffffff, 0xff606060),
              ),
              InkWell(
                onTap: () {
                  // Get.toNamed(Routes.ADMIN_MAIN_DAISHBOARD);
                  // print("google clicked");
                },
                child: getRowElement(
                    'assets/images/icons/google.png',
                    "Connect with Google",
                    context,
                    height * 0.1,
                    0xffffffff,
                    0xff606060),
              ),
              getRowElement(
                  'assets/images/icons/fb.png',
                  "Connect with Facebook",
                  context,
                  height * 0.1,
                  0xff5CA6F8,
                  0xffffffff),
              Platform.isIOS
                  ? getRowElement(
                      'assets/images/icons/apple.png',
                      "Connect with Apple",
                      context,
                      height * 0.1,
                      0xff4B4949,
                      0xffffffff)
                  : Container(),
              Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                        margin: EdgeInsets.only(top: height * 0.1),
                        child: RichText(
                          text: TextSpan(
                            text: 'Already have an acoount?  ',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                            children: const <TextSpan>[
                              TextSpan(
                                  text: 'Log In',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: ColorsX.blue_gradient_dark)),
                            ],
                          ),
                        )),
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Widget getRowElement(String? imagePath, String value, BuildContext context,
      double top, int colorCode, int textColor) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 13),
        decoration: BoxDecoration(
            color: Color(colorCode),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(),
            imagePath != null
                ? Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          imagePath,
                          fit: BoxFit.fitHeight,
                          width: 20,
                          height: 20,
                        ),
                      ],
                    ),
                  )
                : Expanded(
                    flex: 2,
                    child: Container(
                      width: 20.0,
                      height: 20.0,
                    ),
                  ),
            Expanded(
              flex: 5,
              child: Text(
                value,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(textColor)),
              ),
            ),
            SizedBox(),
          ],
        ));
  }

  Widget getRowElementFirst(String value, BuildContext context, double top,
      int colorCode, int textColor) {
    return GestureDetector(
      onTap: () {
        if (value.contains("email")) {
          print("email pressed");
          Navigator.pushNamed(context, '/login');
        } else if (value.contains("Google")) {
          print("Google clicked");
        }
      },
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 13),
          decoration: BoxDecoration(
              color: Color(colorCode),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(),
              Expanded(
                flex: 2,
                child: Container(
                  width: 20.0,
                  height: 20.0,
                ),
              ),
              Expanded(
                flex: 5,
                child: Text(
                  value,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(textColor)),
                ),
              ),
              SizedBox(),
            ],
          )),
    );
  }

  Widget textWidgets(String value, double fontSize, BuildContext context) {
    return Container(
      child: Text(
        value,
        style: TextStyle(
            color: ColorsX.white,
            fontWeight: FontWeight.w700,
            fontSize: fontSize),
      ),
    );
  }
}
