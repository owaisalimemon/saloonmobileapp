import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saloonmobileapp/UI/mainscreen/loginscreen.dart';
import 'package:saloonmobileapp/UI/mainscreen/signup_screen.dart';
import 'package:saloonmobileapp/UI/mainscreen/singinchoice.dart';
import 'package:saloonmobileapp/UI/widgets/emailbutton.dart';
import 'package:saloonmobileapp/extrahelper/colors.dart';

class ConnectWithScreen extends StatelessWidget {
  late double height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
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
          Padding(
            padding: EdgeInsets.only(
                left: width * 0.05, right: width * 0.05, top: height * 0.25),
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
                SizedBox(height: height * 0.03),
                email_button(
                    value: "Sign up with email",
                    colorCode: 0xffffffff,
                    textColor: 0xff606060,
                    ontap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
                    }),
                SizedBox(height: height * 0.02),
                Social_button(
                    imagePath: 'assets/images/icons/google.png',
                    value: "Connect with Google",
                    colorCode: 0xffffffff,
                    textColor: 0xff606060,
                    onTap: () {}),
                SizedBox(height: height * 0.02),
                Social_button(
                    imagePath: 'assets/images/icons/fb.png',
                    value: "Connect with Facebook",
                    colorCode: 0xff6EC8FD,
                    textColor: 0xffffffff,
                    onTap: () {}),
                SizedBox(height: height * 0.02),
                Platform.isIOS
                    ? Social_button(
                        imagePath: 'assets/images/icons/apple.png',
                        value: "Connect with Apple",
                        colorCode: 0xff4B4949,
                        textColor: 0xffffffff,
                        onTap: () {})
                    : Container(),
                SizedBox(height: height * 0.03),
                Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInChoice()),
                        );
                      },
                      child: Container(
                          child: RichText(
                        text: TextSpan(
                          text: 'Already have an acoount?  ',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Log In',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff70B4FF))),
                          ],
                        ),
                      )),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
