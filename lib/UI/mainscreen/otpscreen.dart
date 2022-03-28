import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saloonmobileapp/UI/widgets/roundbutton.dart';
import 'package:saloonmobileapp/controller/authconroller.dart';
import 'package:saloonmobileapp/extrahelper/colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPScreen extends ConsumerWidget {
  OTPScreen({Key? key}) : super(key: key);

  String? code;

  @override
  Widget build(BuildContext context, watch) {
    var controller = watch(getauth(true));
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: ColorsX.subBlack),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            width: width,
            color: ColorsX.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: height * 0.04),
                Text(
                  "Phone verification",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: width * 0.1,
                      color: ColorsX.blue_text_color),
                ),
                SizedBox(height: height * 0.02),
                Container(
                  width: width * 0.75,
                  child: Text(
                    "Enter your OTP code here",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: width * 0.05,
                        color: ColorsX.subBlack),
                  ),
                ),
                SizedBox(height: height * 0.1),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                  child: PinCodeTextField(
                    keyboardType: TextInputType.number,
                    appContext: context,
                    backgroundColor: Colors.transparent,

                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10),
                      borderWidth: 0,
                      fieldHeight: height * 0.09,
                      fieldWidth: width * 0.17,
                      activeFillColor: ColorsX.blue_text_color,
                      activeColor: ColorsX.blue_text_color,
                      inactiveColor: Color(0xffEEEEEE),
                      disabledColor: Color(0xffEEEEEE),
                      selectedFillColor: Color(0xffEEEEEE),
                      selectedColor: Color(0xffEEEEEE),
                      inactiveFillColor: Color(0xffEEEEEE),
                    ),

                    length: 4,
                    obscureText: false,
                    textStyle: TextStyle(
                        fontSize: width * 0.1,
                        color: Colors.white,
                        fontWeight: FontWeight.normal),

                    enableActiveFill: true,

                    animationType: AnimationType.fade,
                    animationDuration: Duration(milliseconds: 300),
                    //errorAnimationController: errorController, // Pass it here
                    onChanged: (value) {
                      code = value;
                    },

                    onCompleted: (v) async {
                      print(v);
                    },
                  ),
                ),
                Text(controller.timerText,
                    style: TextStyle(
                        fontSize: width * 0.045,
                        fontWeight: FontWeight.normal,
                        color: Color(0xff707070))),
                SizedBox(height: height * 0.05),
                controller.isresendavailable == true
                    ? Column(
                        children: [
                          Text(
                            "Didn't receive any code?",
                            style: TextStyle(
                                fontSize: width * 0.045,
                                color: Color(0xff707070),
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: height * 0.035),
                          GestureDetector(
                            onTap: () {
                              controller.isresendavailable = false;
                              controller.notifyListeners();
                              controller.startTimer();
                            },
                            child: Text(
                              "Resend a new code",
                              style: TextStyle(
                                  fontSize: width * 0.045,
                                  color: ColorsX.blue_text_color,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      )
                    : Container(),
              ],
            )),
      ),
    );
  }
}
