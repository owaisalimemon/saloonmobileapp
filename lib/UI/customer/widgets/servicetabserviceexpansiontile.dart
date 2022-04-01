import 'package:flutter/material.dart';
import 'package:saloonmobileapp/controller/saloonscontroller.dart';
import 'package:saloonmobileapp/extrahelper/colors.dart';

class CustomExpansionTileforsevices extends StatelessWidget {
  int index;
  SaloonController controller;

  CustomExpansionTileforsevices(
      {required this.controller, required this.index});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.005),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.zero,
        child: Container(
          color: Color(0xffEFF6F6),
          width: width * 0.85,
          child: ExpansionTile(
            collapsedBackgroundColor: Color(0xffEFF6F6),
            backgroundColor: Colors.transparent,
            leading: CircleAvatar(
              backgroundColor: Color(0xffA8CDF5),
              child: ClipOval(
                child: Image.asset(
                  controller.services[index].image,
                  scale: width * 0.009,
                ),
              ),
            ),
            title: Text(controller.services[index].subtitle,
                style: TextStyle(
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff989696))),
            subtitle: Text(controller.services[index].title,
                style: TextStyle(
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff707070))),
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.05, bottom: height * 0.03),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: width * 0.8,
                      height: height * 0.2,
                      child: Column(
                        children: [
                          ListView.builder(
                              itemCount: controller
                                  .services[index].servicedetail.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, indexx) {
                                return RadioListTile(
                                  value: indexx,
                                  groupValue:
                                      controller.services[index].groupvalue,
                                  title: Text(
                                    controller.services[index]
                                        .servicedetail[indexx].title,
                                    style: TextStyle(fontSize: width * 0.04),
                                  ),
                                  subtitle: Text(
                                    controller.services[index]
                                        .servicedetail[indexx].subtitle,
                                  ),
                                  onChanged: (newValue) {
                                    controller.services[index].groupvalue =
                                        int.parse(newValue.toString());
                                    controller.notifyListeners();
                                  },
                                  activeColor: ColorsX.blue_text_color,
                                  selected: false,
                                );
                              })
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
