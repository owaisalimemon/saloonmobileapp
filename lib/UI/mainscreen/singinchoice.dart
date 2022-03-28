import 'dart:io';

import 'package:flutter/material.dart';
import 'package:saloonmobileapp/UI/widgets/emailbutton.dart';
import 'package:saloonmobileapp/extrahelper/colors.dart';

class SignInChoice extends StatelessWidget {
  const SignInChoice({Key? key}) : super(key: key);

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
              'assets/images/dark_girl_bg2.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: width * 0.05, right: width * 0.05, top: height * 0.35),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: height * 0.12,
                    width: width * 0.24,
                    child: Image.asset(
                      'assets/images/logo_splash.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.03),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Salloon",
                      style: TextStyle(
                          color: Color(0xff70B4FF),
                          fontSize: width * 0.15,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: height * 0.01),
                Text(
                  "Book an appointment for Salon, Spa & Barber",
                  style: TextStyle(
                      color: ColorsX.white,
                      fontWeight: FontWeight.w700,
                      fontSize: width * 0.075),
                ),
                SizedBox(height: height * 0.05),
                email_button(
                    value: "Continue as Customer",
                    colorCode: 0xffffffff,
                    textColor: 0xff606060,
                    ontap: () {}),
                SizedBox(height: height * 0.03),
                email_button(
                    value: "Continue as Saloon",
                    colorCode: 0xff6EC8FD,
                    textColor: 0xffffffff,
                    ontap: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
