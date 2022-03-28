import 'package:flutter/material.dart';

class Social_button extends StatelessWidget {
  Social_button(
      {required this.imagePath,
      required this.value,
      required this.colorCode,
      required this.textColor,
      required this.onTap});

  String? imagePath;
  String value;

  int colorCode;
  int textColor;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: width * 0.8,
          height: height * 0.07,
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
                      imagePath!,
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
}

class email_button extends StatelessWidget {
  email_button(
      {required this.value,
      required this.colorCode,
      required this.textColor,
      required this.ontap});

  String value;

  int colorCode;
  int textColor;
  Function()? ontap;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: ontap,
      child: Container(
          width: width * 0.8,
          height: height * 0.07,
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
}
