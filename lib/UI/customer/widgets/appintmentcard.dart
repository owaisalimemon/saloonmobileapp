import 'package:flutter/material.dart';
import 'package:saloonmobileapp/UI/customer/apointmentpage.dart';

class AppointmentCard extends StatelessWidget {
  AppointmentCard({required this.appintmentdetail, required this.index});

  List<Appointmentdetai> appintmentdetail;
  int index;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        height: height * 0.2,
        width: width * 0.9,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Container(
            width: width * 0.825,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: height * 0.12,
                        width: width * 0.25,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image:
                                    AssetImage(appintmentdetail[index].image),
                                fit: BoxFit.fill))),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: width * 0.5,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  appintmentdetail[index].saloonname,
                                  style: TextStyle(
                                      fontSize: width * 0.04,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Text(
                                        appintmentdetail[index]
                                            .rating
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: width * 0.035,
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal)),
                                    Icon(
                                      Icons.star_border,
                                      color: Color(0xffF9D63E),
                                      size: width * 0.05,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Text(
                            appintmentdetail[index].address,
                            style: TextStyle(
                                fontSize: width * 0.03,
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    appintmentdetail[index].time,
                                    style: TextStyle(
                                        fontSize: width * 0.03,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  Container(
                                    height: height * 0.03,
                                    width: width * 0.1,
                                    decoration: BoxDecoration(
                                        color: Color(0xffF2F5F5),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: Text(
                                        "PM",
                                        style: TextStyle(
                                            fontSize: width * 0.03,
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(width: width * 0.05),
                              Text(
                                appintmentdetail[index].date,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: width * 0.03,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Appointment ID:",
                          style: TextStyle(
                              fontSize: width * 0.035,
                              color: Color(0xffBBBDBF),
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(width: width * 0.01),
                        Text(
                          appintmentdetail[index].appointmentid,
                          style: TextStyle(
                              fontSize: width * 0.035,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Container(
                      height: height * 0.035,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color:
                              appintmentdetail[index].awaibookconf == "Booked"
                                  ? Color(0xff56D91F)
                                  : appintmentdetail[index].awaibookconf ==
                                          "Cancelled"
                                      ? Colors.red
                                      : Color(0xff39D2D2)),
                      child: Center(
                          child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                        child: Text(appintmentdetail[index].awaibookconf,
                            style: TextStyle(
                                fontSize: width * 0.035,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
