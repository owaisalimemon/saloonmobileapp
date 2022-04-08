import 'package:flutter/material.dart';
import 'package:saloonmobileapp/extrahelper/colors.dart';

class FilterCustomChip extends StatelessWidget {
  FilterCustomChip(
      {required this.text, required this.selected, required this.onSelected});

  String text;
  bool selected;
  Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return FilterChip(
      showCheckmark: false,
      label: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.008, vertical: height * 0.01),
        child: Text(
          text,
          style: TextStyle(fontSize: width * 0.035),
        ),
      ),
      selected: selected,
      onSelected: onSelected,
      pressElevation: 1,
      selectedColor: ColorsX.blue_text_color,
    );
  }
}
