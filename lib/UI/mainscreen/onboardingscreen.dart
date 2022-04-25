import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saloonmobileapp/UI/mainscreen/connect_with_screen.dart';

import 'package:saloonmobileapp/UI/mainscreen/splash_screen.dart';
import 'package:saloonmobileapp/UI/widgets/roundbutton.dart';
import 'package:saloonmobileapp/controller/onboardingcontroller.dart';
import 'package:saloonmobileapp/extrahelper/colors.dart';

class OnBoardingScreen extends ConsumerWidget {
  final int _numPages = 3;
  String btntxt = 'Next';
  String skiptxt = "SKIP";
  final PageController _pageController = PageController(initialPage: 0);
  String para =
      "Find & Book Barber, Beauty Saloon & Spa Services anywhere, anytime";
  String head = "FIND & BOOK SERVICES";

  List<String> heading = [
    'FIND & BOOK SERVICES',
    'STYLE THAT FIT YOUR LIFESTYLE',
    'EASY PAY & BOOKING',
  ];
  List<String> paragraph = [
    'Find & Book Barber, Beauty Saloon & Spa Services anywhere, anytime',
    'Choose our makeup special after price package that fit your lifestyle',
    'Get registered and get access to easy pay & booking',
  ];

  List<Widget> _buildPageIndicator(int currentpage) {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
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

  late double _width;
  late double _height;
  @override
  Widget build(BuildContext context, watch) {
    var controller = watch(getdata);
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: _height * 0.5,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      controller.OnboardingScreen(page);
                      controller.currentpage = page;

                      para = paragraph[controller.currentpage];
                      head = heading[controller.currentpage];
                      if (page == 2) {
                        btntxt = 'Continue';
                        skiptxt = "DONE";
                      } else {
                        btntxt = 'Next';
                        skiptxt = "SKIP";
                      }
                    },
                    children: <Widget>[
                      Center(
                        child: Image(
                          image: AssetImage(
                            'assets/images/first_slider.png',
                          ),
                          height: _height * 0.5,
                          width: _width,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Center(
                        child: Image(
                          image: AssetImage(
                            'assets/images/second_slider.png',
                          ),
                          height: _height * 0.55,
                          width: _width,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Center(
                        child: Image(
                          image: AssetImage(
                            'assets/images/third_slider.png',
                          ),
                          height: _height * 0.55,
                          width: _width,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: _height * 0.035),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(controller.currentpage),
                ),
                SizedBox(height: _height * 0.045),
                Container(
                  height: _height * 0.15,
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          head,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: _width * 0.06,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      SizedBox(height: _height * 0.025),
                      Center(
                        child: Container(
                          width: _width * 0.9,
                          child: Text(
                            para,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontSize: _width * 0.045,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: _height * 0.03),
                Center(
                  child: RoundCustomButton(
                    text: btntxt,
                    ontap: () {
                      if (controller.currentpage != 2) {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ConnectWithScreen()),
                        );
                      }
                    },
                  ),
                ),
                SizedBox(height: _height * 0.1),
                Padding(
                  padding: EdgeInsets.only(right: _width * 0.08),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ConnectWithScreen()),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(bottom: _height * 0.05),
                        child: Container(
                          child: Text(
                            skiptxt,
                            style: TextStyle(
                                fontSize: _width * 0.06,
                                fontWeight: FontWeight.w900,
                                color: Colors.black.withOpacity(0.6)),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
