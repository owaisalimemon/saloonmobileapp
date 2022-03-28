import 'package:flutter/material.dart';
import 'package:saloonmobileapp/UI/widgets/customtextfiled.dart';
import 'package:saloonmobileapp/UI/widgets/resetpasdilogbox.dart';
import 'package:saloonmobileapp/UI/widgets/roundbutton.dart';
import 'package:saloonmobileapp/extrahelper/colors.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                Text(
                  "Forgot Password",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: width * 0.1,
                      color: ColorsX.blue_text_color),
                ),
                SizedBox(height: height * 0.02),
                Container(
                  width: width * 0.75,
                  child: Text(
                    "Please enter your email address. You will receive a code to create a new password via email.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: width * 0.05,
                        color: ColorsX.subBlack),
                  ),
                ),
                SizedBox(height: height * 0.1),
                CustomeTextfild(
                  obscure: false,
                  hint: "Email",
                  controller: TextEditingController(),
                  icon: "assets/images/email.png",
                ),
                SizedBox(height: height * 0.05),
                RoundCustomButton(
                    text: "Reset Password",
                    ontap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              Resetpassdialogbox());
                    })
              ],
            )),
      ),
    );
  }
}
