import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saloonmobileapp/UI/mainscreen/onboardingscreen.dart';
import 'package:saloonmobileapp/UI/widgets/roundbutton.dart';
import 'package:saloonmobileapp/extrahelper/colors.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(children: [
        Container(
          height: height,
          width: width,
          child: Image.asset(
            "assets/images/splash_bg.png",
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.2),
              Container(
                height: height * 0.25,
                width: width * 0.5,
                child: Image.asset(
                  "assets/images/logo_splash.png",
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: height * 0.05),
              Container(
                  child: Text(
                "ONLINE BARBER BOOKING",
                style: TextStyle(
                    color: ColorsX.white,
                    fontSize: width * 0.06,
                    fontWeight: FontWeight.w900),
              )),
              SizedBox(height: height * 0.02),
              Container(
                  child: Text(
                "STYLE THAT FIT YOUR LIFESTYLE ",
                style: TextStyle(
                    color: ColorsX.white,
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.w600),
              )),
              SizedBox(height: height * 0.17),
              RoundCustomButton(
                text: "Get Started",
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OnBoardingScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
