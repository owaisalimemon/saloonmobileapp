import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readmore/readmore.dart';
import 'package:saloonmobileapp/UI/customer/widgets/addonsserviceexpansion.dart';
import 'package:saloonmobileapp/UI/customer/widgets/servicetabserviceexpansiontile.dart';
import 'package:saloonmobileapp/UI/customer/widgets/infotabsaloonprofile.dart';
import 'package:saloonmobileapp/UI/customer/widgets/packagescard.dart';
import 'package:saloonmobileapp/UI/customer/widgets/photostabsaloonprofile.dart';
import 'package:saloonmobileapp/UI/customer/widgets/reviestabsaloonprofile.dart';
import 'package:saloonmobileapp/UI/widgets/roundbutton.dart';
import 'package:saloonmobileapp/controller/saloonscontroller.dart';

import 'package:saloonmobileapp/extrahelper/colors.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Servicesdetail {
  String title;
  String subtitle;
  int price;

  Servicesdetail(
      {required this.title, required this.subtitle, required this.price});
}

class Services {
  String image;
  String title;
  String subtitle;
  List<Servicesdetail> servicedetail;
  int groupvalue;

  Services(
      {required this.image,
      required this.title,
      required this.subtitle,
      required this.servicedetail,
      required this.groupvalue});
}

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

  final int _numPages = 3;

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

  List<Widget> _buildPageIndicator(int currentpage) {
    List<Widget> list = [];
    for (int i = 0; i < images.length; i++) {
      list.add(i == currentpage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 7.0,
      width: isActive ? 35.0 : 10.0,
      decoration: BoxDecoration(
        color: isActive ? ColorsX.blue_gradient_dark : Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context, watch) {
    var controller = watch(getsaloon);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: width,
            height: height * 2,
          ),
          Positioned(
            top: 0,
            child: Container(
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
                  controller.OnboardingScreen(value);
                },
                autoPlayInterval: 3000,
                isLoop: true,
              ),
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
            top: height * 0.3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildPageIndicator(controller.currentpage),
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
                                        fontSize: width * 0.04),
                                  ),
                                ),
                                new Tab(
                                  //  icon: Icon(Icons.my_location),
                                  child: Text(
                                    'Services',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: width * 0.04),
                                  ),
                                ),
                                new Tab(
                                  //  icon: Icon(Icons.my_location),
                                  child: Text(
                                    'Reviews',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: width * 0.04),
                                  ),
                                ),
                                new Tab(
                                  //  icon: Icon(Icons.my_location),
                                  child: Text(
                                    'Photos',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: width * 0.04),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              color: Colors.white,
                              height: height * 1.5,
                              child: TabBarView(children: [
                                InfoTabProfileScreen(
                                  controller: controller,
                                ),
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

                                    /// toggle data
                                    controller.checktoggle == 0
                                        ? Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: width * 0.075),
                                            child: Column(
                                              children: [
                                                ListView.builder(
                                                    shrinkWrap: true,
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    itemCount: controller
                                                        .services.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return CustomExpansionTileforsevices(
                                                          controller:
                                                              controller,
                                                          index: index);
                                                    }),
                                              ],
                                            ),
                                          )
                                        : controller.checktoggle == 1
                                            ? Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: width * 0.05),
                                                child: Column(
                                                  children: [
                                                    ListView.builder(
                                                        shrinkWrap: true,
                                                        itemCount: controller
                                                            .packagesandoffer
                                                            .length,
                                                        physics:
                                                            NeverScrollableScrollPhysics(),
                                                        itemBuilder:
                                                            (context, index) {
                                                          return PackagesCard(
                                                              index: index,
                                                              controller:
                                                                  controller);
                                                        })
                                                  ],
                                                ),
                                              )
                                            : Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: width * 0.075),
                                                child: Column(
                                                  children: [
                                                    ListView.builder(
                                                        shrinkWrap: true,
                                                        physics:
                                                            NeverScrollableScrollPhysics(),
                                                        itemCount: controller
                                                            .services.length,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return CustomExpansionTileforaddons(
                                                              controller:
                                                                  controller,
                                                              index: index);
                                                        }),
                                                  ],
                                                ),
                                              )
                                  ],
                                ),
                                ReviewTabSaloonProfile(controller: controller),
                                PhotosTabSaloonProfile(controller: controller)
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
