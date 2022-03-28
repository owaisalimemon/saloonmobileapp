import 'package:flutter/material.dart';
import 'package:saloonmobileapp/UI/widgets/roundbutton.dart';
import 'package:saloonmobileapp/extrahelper/colors.dart';

class Resetpassdialogbox extends StatelessWidget {
  const Resetpassdialogbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0)), //this right here
      child: Container(
        height: height * .45,
        width: width * .90,
        child: Padding(
          padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: height * 0.03),
              Image.asset(
                "assets/images/forget.png",
                height: height * 0.12,
                width: width * 0.3,
                fit: BoxFit.fill,
              ),
              SizedBox(height: height * 0.03),
              Text(
                "Code has been sent to reset a new password",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff707070),
                    fontWeight: FontWeight.w700,
                    fontSize: width * 0.065),
              ),
              SizedBox(height: height * 0.03),
              Text(
                  "You\'ll shortly receive an email with a code to setup a new password",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: width * 0.045,
                      fontWeight: FontWeight.w400,
                      color: ColorsX.subBlack)),
              SizedBox(height: height * 0.04),
              RoundCustomButton(
                  text: "Done",
                  ontap: () {
                    Navigator.of(context).pop();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
