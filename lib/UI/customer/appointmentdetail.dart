import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saloonmobileapp/UI/customer/widgets/cancelbuton.dart';
import 'package:saloonmobileapp/UI/customer/widgets/dialogcancelappointment.dart';
import 'package:saloonmobileapp/UI/widgets/resetpasdilogbox.dart';
import 'package:saloonmobileapp/controller/appintmentdetaicontroller.dart';

class Servicepurchased {
  String name;
  int price;

  Servicepurchased({required this.name, required this.price});
}

class Addonspurchased {
  String name;
  int price;
  int quantity;

  Addonspurchased(
      {required this.name, required this.price, required this.quantity});
}

class AppointmentDetialScreen extends ConsumerWidget {
  AppointmentDetialScreen({Key? key}) : super(key: key);

  List<Servicepurchased> servicelistpurchased = [
    Servicepurchased(name: "Buzz cut, 30 min", price: 370),
    Servicepurchased(name: "Cut with machine + scissors", price: 370),
    Servicepurchased(name: "Children's haircut", price: 370),
    Servicepurchased(name: "Children's haircut", price: 370)
  ];
  List<Addonspurchased> addonspurchased = [
    Addonspurchased(name: "Shampoo", price: 370, quantity: 1),
    Addonspurchased(name: "Cream", price: 740, quantity: 2),
    Addonspurchased(name: "Shampoo", price: 370, quantity: 1),
    Addonspurchased(name: "Cream", price: 370, quantity: 1),
  ];

  @override
  Widget build(BuildContext context, watch) {
    var controller = watch(getappointmentdetal(true));
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final days = controller.strDigits(controller.myDuration.inDays);

    final hours =
        controller.strDigits(controller.myDuration.inHours.remainder(24));
    final minutes =
        controller.strDigits(controller.myDuration.inMinutes.remainder(60));
    final seconds =
        controller.strDigits(controller.myDuration.inSeconds.remainder(60));

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffEEF5FE),
          elevation: 0,
          centerTitle: true,
          toolbarHeight: height * 0.1,
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back_rounded,
                size: width * 0.07,
                color: Color(0xff70B4FF),
              )),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: height * 0.55,
                width: width,
                decoration: BoxDecoration(
                    color: Color(0xffEEF5FE),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: width * 0.1,
                      right: width * 0.1,
                      bottom: height * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: height * 0.3,
                        width: width * 0.8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/appointmentimage.png"))),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Looks Unisex Saloon",
                              style: TextStyle(
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          Container(
                            height: height * 0.035,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xff39D2D2)),
                            child: Center(
                                child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.03),
                              child: Text("Awaiting",
                                  style: TextStyle(
                                      fontSize: width * 0.04,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            )),
                          ),
                        ],
                      ),
                      Text("288 Empola Street, NewYork",
                          style: TextStyle(
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff707070))),
                      Row(
                        children: [
                          Icon(
                            Icons.store_mall_directory_rounded,
                            size: width * 0.05,
                            color: Color(0xff707070),
                          ),
                          SizedBox(width: width * 0.02),
                          Text("12 km",
                              style: TextStyle(
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xff707070))),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RatingBar.builder(
                            itemSize: width * 0.07,
                            ignoreGestures: true,
                            initialRating: 4,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(
                                horizontal: width * 0.0005),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Color(0xffF9D63E),
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                          SizedBox(width: width * 0.05),
                          Text("4.0",
                              style: TextStyle(
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xff707070))),
                        ],
                      ),
                      Container(
                        height: height * 0.05,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Center(
                            child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.03),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.date_range_outlined,
                                size: width * 0.07,
                                color: Color(0xff70B4FF),
                              ),
                              SizedBox(
                                width: width * 0.03,
                              ),
                              Text("25th September 2021" + " @ " "08:30 PM",
                                  style: TextStyle(
                                      fontSize: width * 0.04,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ],
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.1, vertical: height * 0.03),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Services",
                                style: TextStyle(
                                    fontSize: width * 0.05,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            Text("Price",
                                style: TextStyle(
                                    fontSize: width * 0.05,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ],
                        ),
                        SizedBox(height: height * 0.01),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: servicelistpurchased.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  EdgeInsets.symmetric(vertical: height * 0.01),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(servicelistpurchased[index].name,
                                      style: TextStyle(
                                          fontSize: width * 0.05,
                                          fontWeight: FontWeight.normal,
                                          color: Color(0xffA8A7A7))),
                                  Text(
                                      servicelistpurchased[index]
                                          .price
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: width * 0.05,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xffA8A7A7))),
                                ],
                              ),
                            );
                          },
                        ),
                        SizedBox(height: height * 0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Service Total",
                                style: TextStyle(
                                    fontSize: width * 0.05,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black)),
                            Text("1480",
                                style: TextStyle(
                                    fontSize: width * 0.05,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.02),
                    Container(
                      width: width * 0.8,
                      height: 2,
                      color: Colors.grey.shade300,
                    ),
                    SizedBox(height: height * 0.02),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Add-ons",
                                style: TextStyle(
                                    fontSize: width * 0.05,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            Text("Price",
                                style: TextStyle(
                                    fontSize: width * 0.05,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ],
                        ),
                        SizedBox(height: height * 0.01),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: addonspurchased.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  EdgeInsets.symmetric(vertical: height * 0.01),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                          addonspurchased[index]
                                                  .quantity
                                                  .toString() +
                                              "x",
                                          style: TextStyle(
                                              fontSize: width * 0.05,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xffA8A7A7))),
                                      Text(addonspurchased[index].name,
                                          style: TextStyle(
                                              fontSize: width * 0.05,
                                              fontWeight: FontWeight.normal,
                                              color: Color(0xffA8A7A7))),
                                    ],
                                  ),
                                  Text(addonspurchased[index].price.toString(),
                                      style: TextStyle(
                                          fontSize: width * 0.05,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xffA8A7A7))),
                                ],
                              ),
                            );
                          },
                        ),
                        SizedBox(height: height * 0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Add-Ons Total",
                                style: TextStyle(
                                    fontSize: width * 0.05,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black)),
                            Text("1480",
                                style: TextStyle(
                                    fontSize: width * 0.05,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ],
                        ),
                        SizedBox(height: height * 0.02),
                        Container(
                          width: width * 0.8,
                          height: 2,
                          color: Colors.grey.shade300,
                        ),
                        SizedBox(height: height * 0.02),
                      ],
                    ),
                    SizedBox(height: height * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Bill",
                            style: TextStyle(
                                fontSize: width * 0.06,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        Text("2960",
                            style: TextStyle(
                                fontSize: width * 0.06,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.1, vertical: height * 0.03),
                child: Column(
                  children: [
                    CancelCustomButton(
                        text: "Cancel Booking",
                        ontap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  Cancelappointmentdialog());
                        }),
                    SizedBox(height: height * 0.03),
                    Text("Time Left",
                        style: TextStyle(
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.normal,
                            color: Colors.black)),
                    SizedBox(height: height * 0.03),
                    Text('$hours:$minutes:$seconds',
                        style: TextStyle(
                            fontSize: width * 0.13,
                            fontWeight: FontWeight.bold,
                            color: Colors.red)),
                    SizedBox(height: height * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.timer,
                          size: width * 0.07,
                          color: Color(0xff70B4FF),
                        ),
                        Container(
                          width: width * 0.7,
                          child: Text(
                              "Deposited 10% of the services will be taken away 24 hours before the appointment",
                              style: TextStyle(
                                  fontSize: width * 0.035,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black)),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: height * 0.03),
            ],
          ),
        ));
  }
}
