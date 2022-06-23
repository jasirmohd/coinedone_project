import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {Key? key,
      required this.text,
      this.textSize,
      this.textColor,
      this.textWeight})
      : super(key: key);

  final String text;
  final Color? textColor;
  final double? textSize;
  final FontWeight? textWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: textColor ?? Colors.black,
          fontSize: textSize ?? 16,
          fontWeight: textWeight ?? FontWeight.normal),
    );
  }
}
