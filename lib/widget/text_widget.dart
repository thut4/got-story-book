import 'package:flutter/material.dart';
import 'package:got/constant/app_color.dart';

class BigText extends StatelessWidget {
  const BigText(
      {super.key,
      required this.text,
      this.fontSize = 14,
      this.fontWeight = FontWeight.w500,
      this.color = Colors.black,
      this.textDecoration = TextDecoration.none});
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextDecoration textDecoration;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'Got',
          fontSize: fontSize,
          fontWeight: fontWeight,
          decoration: textDecoration,
          decorationColor: AppColor.darkBlue,
          color: color),
      textAlign: TextAlign.center,
    );
  }
}
