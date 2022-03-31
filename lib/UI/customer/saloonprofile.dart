import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readmore/readmore.dart';
import 'package:saloonmobileapp/UI/customer/widgets/infotabsaloonprofile.dart';
import 'package:saloonmobileapp/controller/saloonscontroller.dart';

import 'package:saloonmobileapp/extrahelper/colors.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Employee {
  String name;
  String image;
  String designation;
  double rating;

  Employee(
      {required this.image,
      required this.name,
      required this.designation,
      required this.rating});
}

class SaloonProfile extends ConsumerWidget {
  SaloonProfile({Key? key}) : super(key: key);

  List<Employee> emplyeedata = [
    Employee(
        image: 'assets/images/emplyeeimage.png',
        name: 'Mike',
        designation: 'HairDresser',
        rating: 4),
    Employee(
        image: 'assets/images/emplyeeimage.png',
        name: 'Paul',
        designation: 'Barber',
        rating: 4),
    Employee(
        image: 'assets/images/emplyeeimage.png',
        name: 'Michael',
        designation: 'Makeup',
        rating: 4),
    Employee(
        image: 'assets/images/emplyeeimage.png',
        name: 'Jim',
        designation: 'Hair Specialist',
        rating: 4),
    Employee(
        image: 'assets/images/emplyeeimage.png',
        name: 'Ellie',
        designation: 'Makeup Artist',
        rating: 4),
  ];

  List<Widget> images = [
    Image.asset('assets/images/imageprofileslideimage.png', fit: BoxFit.fill),
    Image.asset('assets/images/imageprofileslideimage.png', fit: BoxFit.fill),
    Image.asset('assets/images/imageprofileslideimage.png', fit: BoxFit.fill),
  ];

  @override
  @override
  Widget build(BuildContext context, watch) {
    var controller = watch(getsaloon);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            width: width,
            height: height * 2,
          ),
          Container(
            height: height * 0.4,
            width: width,
            child: ImageSlideshow(
              children: images,
              width: double.infinity,
              height: height * 0.4,
              initialPage: 0,
              indicatorColor: ColorsX.blue_text_color,
              indicatorBackgroundColor: Colors.grey,
              onPageChanged: (value) {
                // debugPrint('Page changed: $value');
              },
              autoPlayInterval: 3000,
              isLoop: true,
            ),
          ),
          Positioned(
            top: height * 0.05,
            right: width * 0.05,
            left: width * 0.05,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: width * 0.08,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications_none_outlined,
                      color: Colors.white,
                      size: width * 0.08,
                    )),
              ],
            ),
          ),
          Positioned(
            top: height * 0.28,
            right: width * 0.05,
            child: Container(
              height: height * 0.04,
              width: width * 0.18,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: true ? Color(0xff56D91F) : Colors.red,
              ),
              child: Center(
                  child: Text(true ? "Open" : "Close",
                      style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.bold,
                          color: Colors.white))),
            ),
          ),
          Positioned(
            top: height * 0.35,
            child: Container(
              width: width,
              decoration: BoxDecoration(
                  color: Color(0xffEEF5FE),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35))),
              child: Padding(
                padding: EdgeInsets.only(top: height * 0.12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.person_add_alt,
                                    color: Color(0xff67A6EB),
                                    size: width * 0.08,
                                  )),
                              Text("Follow",
                                  style: TextStyle(
                                      fontSize: width * 0.04,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black))
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.message,
                                    color: Color(0xff67A6EB),
                                    size: width * 0.08,
                                  )),
                              Text("Message",
                                  style: TextStyle(
                                      fontSize: width * 0.04,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black))
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.map_sharp,
                                    color: Color(0xff67A6EB),
                                    size: width * 0.08,
                                  )),
                              Text("Directions",
                                  style: TextStyle(
                                      fontSize: width * 0.04,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black))
                            ],
                          ),
                          Column(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.share,
                                    color: Color(0xff67A6EB),
                                    size: width * 0.08,
                                  )),
                              Text("Share",
                                  style: TextStyle(
                                      fontSize: width * 0.04,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black))
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.03),
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.1),
                      child: Text("Saloon Specialist",
                          style: TextStyle(
                              fontSize: width * 0.045,
                              fontWeight: FontWeight.normal,
                              color: Colors.black)),
                    ),
                    SizedBox(height: height * 0.02),
                    Container(
                        height: height * 0.17,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: emplyeedata.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: index == 0
                                        ? width * 0.1
                                        : width * 0.04),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Column(
                                    children: [
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                            height: height * 0.1,
                                            width: width * 0.2,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                      emplyeedata[index].image,
                                                    ),
                                                    fit: BoxFit.fill)),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            child: Container(
                                              height: height * 0.03,
                                              width: width * 0.15,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  color: Colors.white),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color: Color(0xffF9D63E),
                                                    size: width * 0.04,
                                                  ),
                                                  SizedBox(
                                                      width: width * 0.005),
                                                  Text(
                                                      emplyeedata[index]
                                                          .rating
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize:
                                                              width * 0.03,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Color(
                                                              0xff40424E)))
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: height * 0.01),
                                      Text(emplyeedata[index].name,
                                          style: TextStyle(
                                              fontSize: width * 0.045,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black)),
                                      SizedBox(height: height * 0.005),
                                      Text(emplyeedata[index].designation,
                                          style: TextStyle(
                                              fontSize: width * 0.04,
                                              fontWeight: FontWeight.normal,
                                              color: Color(0xff67A6EB)))
                                    ],
                                  ),
                                ),
                              );
                            })),
                    Container(
                      child: DefaultTabController(
                        length: 4,
                        child: Column(
                          children: [
                            new TabBar(
                              isScrollable: false,
                              indicatorColor: Color(0xff70B4FF),
                              indicatorWeight: 3,
                              tabs: [
                                new Tab(
                                  //   icon: Icon(Icons.home),
                                  child: Text(
                                    'Info',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                new Tab(
                                  //  icon: Icon(Icons.my_location),
                                  child: Text(
                                    'Services',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                new Tab(
                                  //  icon: Icon(Icons.my_location),
                                  child: Text(
                                    'Reviews',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                new Tab(
                                  //  icon: Icon(Icons.my_location),
                                  child: Text(
                                    'Photos',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              color: Colors.white,
                              height: height * 1.5,
                              child: TabBarView(children: [
                                InfoTabProfileScreen(),
                                Column(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: height * 0.05),
                                      child: ToggleSwitch(
                                        minHeight: height * 0.04,
                                        borderWidth: 2,
                                        customWidths: [
                                          width * 0.25,
                                          width * 0.3,
                                          width * 0.25
                                        ],
                                        initialLabelIndex:
                                            controller.checktoggle,
                                        cornerRadius: 10.0,
                                        activeFgColor: Colors.white,
                                        inactiveBgColor: Colors.white,
                                        inactiveFgColor:
                                            ColorsX.blue_text_color,
                                        borderColor: [
                                          ColorsX.blue_text_color,
                                          ColorsX.blue_text_color,
                                          ColorsX.blue_text_color
                                        ],
                                        totalSwitches: 3,
                                        labels: [
                                          "Services",
                                          "Package & Offers",
                                          "Add-Ons"
                                        ],
                                        activeBgColors: [
                                          [ColorsX.blue_text_color],
                                          [ColorsX.blue_text_color],
                                          [ColorsX.blue_text_color]
                                        ],
                                        onToggle: (index) {
                                          controller.changetoggle(index!);
                                          print(index);
                                        },
                                      ),
                                    ),
                                    controller.checktoggle == 0
                                        ? Column(
                                            children: [
                                              ExpansionTile(
                                                collapsedBackgroundColor:
                                                    Color(0xffEFF6F6),
                                                backgroundColor: Colors.white,
                                                leading: CircleAvatar(
                                                  backgroundColor:
                                                      Color(0xffA8CDF5),
                                                  child: ClipOval(
                                                    child: Image.asset(
                                                      "assets/images/icons/hairstyleicon.png",
                                                      scale: width * 0.009,
                                                    ),
                                                  ),
                                                ),
                                                title: Text("Service Type",
                                                    style: TextStyle(
                                                        fontSize: width * 0.04,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color:
                                                            Color(0xff989696))),
                                                subtitle: Text("HairStyling",
                                                    style: TextStyle(
                                                        fontSize: width * 0.05,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color:
                                                            Color(0xff707070))),
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: width * 0.05,
                                                        bottom: height * 0.03),
                                                    child: Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Container(
                                                          width: width * 0.8,
                                                          child: Text(
                                                              "Cut with scissors, 60 min",
                                                              textAlign:
                                                                  TextAlign
                                                                      .justify,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      width *
                                                                          0.04,
                                                                  color: Colors
                                                                      .black)),
                                                        )),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                        : controller.checktoggle == 1
                                            ? Column(
                                                children: [],
                                              )
                                            : Container()
                                  ],
                                ),
                                Text("3"),
                                Text("4"),
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.3,
            left: width * 0.1,
            child: Row(
              children: [
                Container(
                  height: height * 0.175,
                  width: width * 0.35,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/images/saloonprofileimage.png",
                          ),
                          fit: BoxFit.fill)),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: height * 0.02, left: width * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Looks Unisex Saloon",
                          style: TextStyle(
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      Text("288 Empola Street, NewYork",
                          style: TextStyle(
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.normal,
                              color: Colors.black)),
                      Row(
                        children: [
                          RatingBar.builder(
                            itemSize: width * 0.05,
                            ignoreGestures: true,
                            initialRating: 3,
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
                          SizedBox(width: width * 0.01),
                          Text("(125 reviews)",
                              style: TextStyle(
                                  fontSize: width * 0.03,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xff40424E)))
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
