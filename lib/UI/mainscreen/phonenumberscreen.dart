import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saloonmobileapp/UI/mainscreen/otpscreen.dart';
import 'package:saloonmobileapp/UI/widgets/customtextfiled.dart';
import 'package:saloonmobileapp/UI/widgets/roundbutton.dart';
import 'package:saloonmobileapp/controller/authconroller.dart';
import 'package:saloonmobileapp/extrahelper/colors.dart';

class PhoneNumberScreen extends ConsumerWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    var controller = watch(getauth(false));
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
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
                Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.2, right: width * 0.2),
                  child: Text(
                    "Verify your phone number",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: width * 0.1,
                        color: ColorsX.blue_text_color),
                  ),
                ),
                SizedBox(height: height * 0.02),
                Container(
                  width: width * 0.75,
                  child: Text(
                    "Enter your mobile number for verification",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: width * 0.05,
                        color: ColorsX.subBlack),
                  ),
                ),
                SizedBox(height: height * 0.1),
                Container(
                  width: width * 0.85,
                  height: height * 0.07,
                  decoration: BoxDecoration(
                    color: Color(0xffEEEEEE),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: CountryCodePicker(
                          // countryFilter: [

                          // ],
                          textStyle: TextStyle(
                              fontSize: width * 0.045,
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w400),
                          onChanged: (value) {
                            controller.countryCode = value.dialCode!;
                          },
                          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                          initialSelection: 'PK',

                          barrierColor: Colors.white,

                          favorite: ['+92', 'PK'],
                          // optional. Shows only country name and flag
                          showCountryOnly: false,
                          // optional. Shows only country name and flag when popup is closed.
                          showOnlyCountryWhenClosed: false,

                          // optional. aligns the flag and the Text left
                          alignLeft: false,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      Container(
                        width: 2,
                        height: height * 0.07,
                        color: Color(0xffD5D6D6),
                      ),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: TextFormField(
                          controller: controller.phone,
                          keyboardType: TextInputType.phone,
                          style: TextStyle(
                              fontSize: width * 0.045, color: Colors.black),
                          cursorColor: Colors.black,
                          textAlignVertical: TextAlignVertical.center,
                          onChanged: (value) {
                            //    controller.countrycheck();
                          },
                          decoration: InputDecoration(
                            suffixIcon: Image.asset(
                              "assets/images/phone.png",
                              scale: width * 0.003,
                            ),
                            hintText: "3222233565",
                            hintStyle: TextStyle(
                                fontSize: width * 0.045,
                                color: Colors.grey.shade600),
                            enabledBorder: InputBorder.none,
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: height * 0.05),
                RoundCustomButton(
                    text: "Continue",
                    ontap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OTPScreen()),
                      );
                    })
              ],
            )),
      ),
    );
  }
}
