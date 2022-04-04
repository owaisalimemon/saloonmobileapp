import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saloonmobileapp/UI/mainscreen/loginscreen.dart';
import 'package:saloonmobileapp/UI/mainscreen/phonenumberscreen.dart';
import 'package:saloonmobileapp/UI/mainscreen/singinchoice.dart';
import 'package:saloonmobileapp/UI/widgets/customtextfiled.dart';
import 'package:saloonmobileapp/UI/widgets/roundbutton.dart';
import 'package:saloonmobileapp/controller/signupcontroller.dart';
import 'package:saloonmobileapp/extrahelper/colors.dart';

class SignUp extends ConsumerWidget {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1910),
        lastDate: DateTime(2025));

    if (picked != null) selectedDate = picked;
  }

  @override
  Widget build(BuildContext context, watch) {
    var controller = watch(getsingup);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        // Functions.hideKeyboard(context);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: ColorsX.white,
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
                children: <Widget>[
                  SizedBox(height: height * 0.05),
                  Text(
                    "Create an Account",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: width * 0.085,
                        color: ColorsX.blue_text_color),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(height: height * 0.03),
                        CustomeTextfild(
                          obscure: false,
                          hint: "Username",
                          controller: controller.usernamecontroller,
                          icon: "assets/images/user.png",
                        ),
                        SizedBox(height: height * 0.01),
                        CustomeTextfild(
                          obscure: false,
                          hint: "Email Address",
                          controller: controller.emailcontroller,
                          icon: "assets/images/email.png",
                        ),
                        SizedBox(height: height * 0.01),
                        CustomeTextfild(
                          obscure: false,
                          hint: "Phone Number",
                          controller: controller.phonenocontroller,
                          icon: "assets/images/phone.png",
                        ),
                        SizedBox(height: height * 0.01),
                        Container(
                          width: width * 0.8,
                          height: height * 0.07,
                          decoration: new BoxDecoration(
                              color: ColorsX.greyBackground,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Center(
                            child: TextFormField(
                              onTap: () async {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                await _selectDate(context);

                                var item =
                                    selectedDate.toString().split("-")[0];

                                controller.dobcontroller.text =
                                    selectedDate.toString().split(" ")[0];
                              },
                              style: TextStyle(color: ColorsX.subBlack),
                              textAlignVertical: TextAlignVertical.center,
                              obscureText: false,
                              controller: controller.dobcontroller,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'please enter the field';
                                }
                                return null;
                              },
                              minLines: 1,
                              decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                prefixIcon: Image.asset(
                                  "assets/images/date.png",
                                ),
                                hintText: "Date of Birth",
                                hintStyle: TextStyle(color: ColorsX.subBlack),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        CustomeTextfild(
                          obscure: true,
                          hint: "Password",
                          controller: controller.passwordcontroller,
                          icon: "assets/images/password.png",
                        ),
                        SizedBox(height: height * 0.01),
                        CustomeTextfild(
                          obscure: true,
                          hint: "Confirm Password",
                          controller: controller.confirmpasswordcontroller,
                          icon: "assets/images/confirm.png",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.04),
                  RoundCustomButton(
                      text: "Sign Up",
                      ontap: () {
                        _formKey.currentState!.validate();
                        controller.Signup(context);
                      }),
                  SizedBox(height: height * 0.02),
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.125, right: width * 0.125),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'By continuing ',
                        style: TextStyle(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff707070)),
                        children: <TextSpan>[
                          TextSpan(
                              recognizer: TapGestureRecognizer()..onTap = () {},
                              text: 'Sign Up ',
                              style: TextStyle(
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff707070))),
                          TextSpan(
                            text: 'you are agree to the following ',
                            style: TextStyle(
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff707070)),
                          ),
                          TextSpan(
                              recognizer: TapGestureRecognizer()..onTap = () {},
                              text: 'Terms & Conditions ',
                              style: TextStyle(
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff707070))),
                          TextSpan(
                            text: 'without reservation ',
                            style: TextStyle(
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff707070)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignInChoice()),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Don\'t have an account?  ',
                        style: TextStyle(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.w400,
                            color: ColorsX.subBlack),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Sign In',
                              style: TextStyle(
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.bold,
                                  color: ColorsX.blue_gradient_dark)),
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
