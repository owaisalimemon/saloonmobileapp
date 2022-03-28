import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saloonmobileapp/controller/bottomnavbarcontroller.dart';
import 'package:saloonmobileapp/extrahelper/colors.dart';

class CustomBottomNavBar extends ConsumerWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    var controller = watch(getnav);
    return Scaffold(
      backgroundColor: Colors.white,
      body: controller.screens[controller.currentpage],
      bottomNavigationBar: Card(
        elevation: 25,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.currentpage,
            selectedItemColor: ColorsX.blue_text_color,
            onTap: (value) {
              controller.onchange(value);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outlined),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outline_rounded),
                label: 'Messages',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today_rounded),
                label: 'Appointments',
              ),
            ]),
      ),
    );
  }
}
