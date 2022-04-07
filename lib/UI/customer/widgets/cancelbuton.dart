import 'package:flutter/material.dart';
import 'package:saloonmobileapp/extrahelper/colors.dart';

class CancelCustomButton extends StatelessWidget {
  CancelCustomButton({required this.text, required this.ontap});

  String text;
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
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(text,
                  style: TextStyle(
                    fontSize: width * 0.045,
                    color: ColorsX.white,
                    fontWeight: FontWeight.w700,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
