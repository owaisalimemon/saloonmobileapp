import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                textWidgets("Book an appointment for Salon, Spa & Barber",
                    width * 0.075, context),
                SizedBox(height: height * 0.03),
                InkWell(
                  onTap: () {},
                  child: getRowElementFirst("Sign up with email", context,
                      height * 0.1 * 62, 0xffffffff, 0xff606060),
                ),
                SizedBox(height: height * 0.02),
                getRowElement(
                    'assets/images/icons/google.png',
                    "Connect with Google",
                    context,
                    height * 0.1,
                    0xffffffff,
                    0xff606060,
                    () {}),
                SizedBox(height: height * 0.02),
                getRowElement(
                    'assets/images/icons/fb.png',
                    "Connect with Facebook",
                    context,
                    height * 0.1,
                    0xff5CA6F8,
                    0xffffffff,
                    () {}),
                SizedBox(height: height * 0.02),
                // Platform.isIOS
                true
                    ? getRowElement(
                        'assets/images/icons/apple.png',
                        "Connect with Apple",
                        context,
                        height * 0.1,
                        0xff4B4949,
                        0xffffffff,
                        () {})
                    : Container(),
                SizedBox(height: height * 0.03),
                Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {},
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

  Widget getRowElement(String? imagePath, String value, BuildContext context,
      double top, int colorCode, int textColor, Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: width * 0.85,
          padding: EdgeInsets.symmetric(vertical: height * 0.02),
          decoration: BoxDecoration(
              color: Color(colorCode),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              imagePath != null
                  ? Image.asset(
                      imagePath,
                      fit: BoxFit.fitHeight,
                      width: 20,
                      height: 20,
                    )
                  : Container(),
              SizedBox(width: width * 0.02),
              Text(
                value,
                style: TextStyle(
                    fontSize: width * 0.045,
                    fontWeight: FontWeight.w700,
                    color: Color(textColor)),
              ),
            ],
          )),
    );
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
          width: width * 0.85,
          padding: EdgeInsets.symmetric(vertical: height * 0.02),
          decoration: BoxDecoration(
              color: Color(colorCode),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                value,
                style: TextStyle(
                    fontSize: width * 0.045,
                    fontWeight: FontWeight.w700,
                    color: Color(textColor)),
              ),
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
