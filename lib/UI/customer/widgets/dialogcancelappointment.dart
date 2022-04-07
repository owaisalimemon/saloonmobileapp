import 'package:flutter/material.dart';
import 'package:saloonmobileapp/UI/widgets/roundbutton.dart';
import 'package:saloonmobileapp/extrahelper/colors.dart';

class Cancelappointmentdialog extends StatelessWidget {
  const Cancelappointmentdialog({Key? key}) : super(key: key);

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
                "assets/images/icons/cancelappoin.png",
                height: height * 0.12,
                width: width * 0.25,
                fit: BoxFit.fill,
              ),
              SizedBox(height: height * 0.03),
              Text(
                "Are you sure you want to cancel your booking?",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff707070),
                    fontWeight: FontWeight.w700,
                    fontSize: width * 0.065),
              ),
              SizedBox(height: height * 0.03),
              Text("Bookings can be cancelled 24hours before the appointment",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: width * 0.045,
                      fontWeight: FontWeight.w400,
                      color: ColorsX.subBlack)),
              SizedBox(height: height * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: width * 0.325,
                      height: height * 0.07,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        color: Color(0xffD5D6D6),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(
                        child: Text("No",
                            style: TextStyle(
                              fontSize: width * 0.045,
                              color: Colors.grey,
                              fontWeight: FontWeight.w700,
                            )),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: width * 0.325,
                      height: height * 0.07,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        color: ColorsX.blue_gradient_dark,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(
                        child: Text("Yes",
                            style: TextStyle(
                              fontSize: width * 0.045,
                              color: ColorsX.white,
                              fontWeight: FontWeight.w700,
                            )),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
