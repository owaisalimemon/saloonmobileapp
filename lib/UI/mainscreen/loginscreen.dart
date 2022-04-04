import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:saloonmobileapp/UI/customer/bottomnavbar.dart';
import 'package:saloonmobileapp/UI/mainscreen/forgetpasswordscreen.dart';
import 'package:saloonmobileapp/UI/mainscreen/phonenumberscreen.dart';
import 'package:saloonmobileapp/UI/mainscreen/signup_screen.dart';
import 'package:saloonmobileapp/UI/mainscreen/singinchoice.dart';
import 'package:saloonmobileapp/UI/widgets/customtextfiled.dart';
import 'package:saloonmobileapp/UI/widgets/roundbutton.dart';
import 'package:saloonmobileapp/extrahelper/colors.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: height,
              width: width,
              child: Image.asset(
                'assets/images/girl_bg2.png',
                fit: BoxFit.fill,
              ),
            ),
            Container(
              width: width,
              height: height * 0.55,
              margin: EdgeInsets.only(top: height * 0.45),
              decoration: new BoxDecoration(
                  color: ColorsX.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Padding(
                padding:
                    EdgeInsets.only(top: height * 0.05, bottom: height * 0.05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Welcome Back",
                      style: TextStyle(
                          fontSize: width * 0.08,
                          color: Color(0xff6EC8FD),
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      "STYLE THAT FIT YOUR LIFESTYLE",
                      style: TextStyle(
                          fontSize: width * 0.04,
                          color: Color(0xff707070),
                          fontWeight: FontWeight.w400),
                    ),
                    CustomeTextfild(
                      obscure: false,
                      hint: "Email",
                      controller: TextEditingController(),
                      icon: "assets/images/email.png",
                    ),
                    CustomeTextfild(
                      obscure: true,
                      hint: "Password",
                      controller: TextEditingController(),
                      icon: "assets/images/password.png",
                    ),
                    RoundCustomButton(
                        text: "Login",
                        ontap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CustomBottomNavBar()),
                          );
                        }),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgetPasswordScreen()),
                        );
                      },
                      child: Text(
                        "Forgot your password?",
                        style: TextStyle(
                            fontSize: width * 0.04,
                            color: Color(0xff707070),
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                          text: 'Don' "\'" 't have an account?  ',
                          style: TextStyle(
                              fontSize: width * 0.045,
                              fontWeight: FontWeight.w400,
                              color: ColorsX.subBlack),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Sign Up',
                                style: TextStyle(
                                    fontSize: width * 0.045,
                                    fontWeight: FontWeight.w700,
                                    color: ColorsX.blue_gradient_dark)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
