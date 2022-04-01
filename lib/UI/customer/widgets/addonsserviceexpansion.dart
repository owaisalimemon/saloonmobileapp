import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saloonmobileapp/controller/saloonscontroller.dart';
import 'package:saloonmobileapp/extrahelper/colors.dart';

class CustomExpansionTileforaddons extends StatelessWidget {
  int index;
  SaloonController controller;

  CustomExpansionTileforaddons({required this.controller, required this.index});

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
                  controller.addons[index].image,
                  scale: width * 0.009,
                ),
              ),
            ),
            title: Text(controller.addons[index].subtitle,
                style: TextStyle(
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff989696))),
            subtitle: Text(controller.addons[index].title,
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
                              itemCount:
                                  controller.addons[index].servicedetail.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, indexx) {
                                return RadioListTile(
                                  value: indexx,
                                  groupValue:
                                      controller.addons[index].groupvalue,
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: width * 0.5,
                                        child: Text(
                                            controller.addons[index]
                                                .servicedetail[indexx].title,
                                            style: TextStyle(
                                                fontSize: width * 0.04,
                                                color: Colors.black)),
                                      ),
                                      Text(
                                          "\$" +
                                              controller.addons[index]
                                                  .servicedetail[indexx].price
                                                  .toString(),
                                          style: TextStyle(
                                              color: Color(0xff7DBAFF),
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                  subtitle: Text(controller.addons[index]
                                      .servicedetail[indexx].subtitle),
                                  onChanged: (newValue) {
                                    controller.addons[index].groupvalue =
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
