import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  StarRating({required this.star, required this.onPressed});
  IconData star;
  Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return IconButton(
        onPressed: onPressed,
        icon: Icon(
          star,
          color: Color(0xffF9D63E),
          size: width * 0.1,
        ));
  }
}
