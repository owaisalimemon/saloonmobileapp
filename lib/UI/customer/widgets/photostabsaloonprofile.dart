import 'package:flutter/material.dart';
import 'package:saloonmobileapp/controller/saloonscontroller.dart';

class PhotosTabSaloonProfile extends StatelessWidget {
  PhotosTabSaloonProfile({required this.controller});
  SaloonController controller;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: Column(
        children: [
          GridView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.photos.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.90,
                crossAxisCount: 2,
                crossAxisSpacing: width * 0.05,
                mainAxisSpacing: height * 0.03,
              ),
              itemBuilder: (context, index) {
                return Container(
                  height: height * 0.2,
                  width: width * 0.45,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: AssetImage(controller.photos[index]),
                          fit: BoxFit.fill)),
                );
              })
        ],
      ),
    );
  }
}
