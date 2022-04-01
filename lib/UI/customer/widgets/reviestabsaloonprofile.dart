import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:saloonmobileapp/UI/customer/saloonprofile.dart';
import 'package:saloonmobileapp/controller/saloonscontroller.dart';

class ReviewTabSaloonProfile extends StatelessWidget {
  ReviewTabSaloonProfile({required this.controller});
  SaloonController controller;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(top: height * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: width * 0.1, right: width * 0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Reviews",
                    style: TextStyle(
                        fontSize: width * 0.05,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                Container(
                  height: height * 0.04,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1.5, color: Color(0xff707070)),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.only(left: width * 0.01),
                    child: DropdownButton<String>(
                      value: controller.dropdownValue,
                      icon: Icon(Icons.keyboard_arrow_down_outlined),
                      hint: Text("Sort by"),
                      elevation: 16,
                      style: TextStyle(
                          color: Color(0xff707070), fontSize: width * 0.035),
                      underline: Container(
                        color: Colors.white,
                      ),
                      onChanged: (String? newValue) {
                        controller.dropdownValue = newValue;
                        controller.notifyListeners();
                      },
                      items: <String>[
                        'Asccending',
                        'Descending',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: width * 0.05, left: width * 0.05),
            child: ListView.separated(
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: height * 0.02),
                    child: Container(
                      height: height * 0.005,
                      width: width * 0.7,
                      color: Color(0xffE8ECEC),
                    ),
                  );
                },
                itemCount: 3,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    height: height * 0.25,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: height * 0.01),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: height * 0.12,
                                    width: width * 0.25,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xff70B4FF)),
                                  ),
                                  Container(
                                    height: height * 0.115,
                                    width: width * 0.24,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/emplyeeimage.png'),
                                            fit: BoxFit.cover)),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: height * 0.025, left: width * 0.04),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Jim Fernandez",
                                        style: TextStyle(
                                            fontSize: width * 0.055,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff707070))),
                                    SizedBox(height: height * 0.02),
                                    RatingBar.builder(
                                      itemSize: width * 0.06,
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
                                  ],
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: height * 0.03, left: width * 0.05),
                                  child: Text(
                                    "2 hours ago",
                                    style: TextStyle(color: Color(0xff707070)),
                                  ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: height * 0.01),
                          child: Padding(
                            padding: EdgeInsets.only(right: width * 0.05),
                            child: Container(
                              width: width * 0.8,
                              child: Text(
                                  "Fast shipping & excellent customer service. I had an issue with my order them they replied quickly",
                                  style: TextStyle(
                                      fontSize: width * 0.045,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xff707070))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
