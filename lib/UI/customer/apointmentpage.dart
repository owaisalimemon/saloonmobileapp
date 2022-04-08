import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saloonmobileapp/UI/customer/appointmentdetail.dart';
import 'package:saloonmobileapp/UI/customer/widgets/appintmentcard.dart';
import 'package:saloonmobileapp/controller/appointmentcontroller.dart';
import 'package:saloonmobileapp/controller/saloonscontroller.dart';
import 'package:saloonmobileapp/extrahelper/colors.dart';

class Appointmentdetai {
  String image;
  double rating;
  String saloonname;
  String address;
  String time;
  String date;
  String awaibookconf;
  String appointmentid;

  Appointmentdetai(
      {required this.image,
      required this.saloonname,
      required this.address,
      required this.time,
      required this.date,
      required this.awaibookconf,
      required this.rating,
      required this.appointmentid});
}

class AppointmentPage extends ConsumerWidget {
  AppointmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    var controller = watch(getappointment);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffEEF5FE),
        elevation: 0,
        centerTitle: true,
        toolbarHeight: height * 0.1,
        title: Text(
          'My Appointments',
          style: TextStyle(
              fontSize: width * 0.05,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: width,
            height: height * 0.1,
            child: Image.asset(
              "assets/images/shortback.png",
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              DefaultTabController(
                length: 4,
                child: Column(
                  children: [
                    Container(
                      width: width * 0.9,
                      child: TabBar(
                        isScrollable: false,
                        indicatorColor: Color(0xff70B4FF),
                        indicatorWeight: 3,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorPadding: EdgeInsets.zero,
                        tabs: [
                          Tab(
                            //   icon: Icon(Icons.home),
                            child: Text(
                              'All',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: width * 0.025,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Tab(
                            //  icon: Icon(Icons.my_location),
                            child: Text(
                              'Upcoming',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: width * 0.025,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Tab(
                            //  icon: Icon(Icons.my_location),
                            child: Text(
                              'Cancelled',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: width * 0.025,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Tab(
                            //  icon: Icon(Icons.my_location),
                            child: Text(
                              'History',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: width * 0.025,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      height: height * 0.665,
                      child: TabBarView(children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: width * 0.05,
                              right: width * 0.05,
                              top: height * 0.05),
                          child: ListView.builder(
                            itemCount: controller.appointmentlist.length,
                            itemBuilder: (context, index) {
                              return AppointmentCard(
                                  appintmentdetail: controller.appointmentlist,
                                  index: index);
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: width * 0.05,
                              right: width * 0.05,
                              top: height * 0.05),
                          child: ListView.builder(
                            itemCount: controller.awaitingappointments.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AppointmentDetialScreen()),
                                  );
                                },
                                child: AppointmentCard(
                                    appintmentdetail:
                                        controller.awaitingappointments,
                                    index: index),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: width * 0.05,
                              right: width * 0.05,
                              top: height * 0.05),
                          child: ListView.builder(
                            itemCount: controller.cencelappointments.length,
                            itemBuilder: (context, index) {
                              return AppointmentCard(
                                  appintmentdetail:
                                      controller.cencelappointments,
                                  index: index);
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: width * 0.05,
                              right: width * 0.05,
                              top: height * 0.05),
                          child: ListView.builder(
                            itemCount: controller.bookedappointments.length,
                            itemBuilder: (context, index) {
                              return AppointmentCard(
                                  appintmentdetail:
                                      controller.bookedappointments,
                                  index: index);
                            },
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
