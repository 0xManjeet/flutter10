import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:toughQuiz/utils/colors.dart';
import 'package:toughQuiz/utils/svg_icons.dart';
import 'package:toughQuiz/widgets/atoms/atoms.dart';

Widget genderSelector(Function onSelect, String currentSelection) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.baseline,
    children: [
      GestureDetector(
        onTap: () => onSelect('Male'),
        child: genBox('Male', maleIcon(currentSelection == 'Male'),
            active: currentSelection == 'Male'),
      ),
      GestureDetector(
        onTap: () => onSelect('Female'),
        child: genBox('Female', femaleIcon(currentSelection == 'Female'),
            active: currentSelection == 'Female'),
      ),
      GestureDetector(
          onTap: () => onSelect('Other'),
          child: genBox('Other', otherGenderIcon(currentSelection == 'Other'),
              active: currentSelection == 'Other')),
    ],
  );
}

Widget genBox(String name, String svgBytes, {bool active = false}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
    decoration: BoxDecoration(
      color: active ? primaryColor : Colors.white,
      border: Border.all(color: active ? primaryColor : Colors.grey[350]),
      borderRadius: BorderRadius.circular(8),
    ),
    child: SizedBox(
      width: 60,
      height: 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.string(
            svgBytes,
            width: 30,
          ),
          regularText(
              text: name, size: 14, color: active ? Colors.white : Colors.grey),
        ],
      ),
    ),
  );
}
