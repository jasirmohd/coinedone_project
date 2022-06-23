import 'package:flutter/material.dart';
import 'package:student_dashboard/widgets/text/text_widget.dart';

class TextRowWidget extends StatelessWidget {
  const TextRowWidget(
      {Key? key,
      required this.text,
      required this.containerColor,
      required this.time})
      : super(key: key);

  final Color containerColor;
  final String text;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 15,
          width: 15,
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(45.0),
          ),
        ),
        Column(
          children: [
            TextWidget(text: text),
            TextWidget(
              text: time,
              textWeight: FontWeight.bold,
            ),
          ],
        )
      ],
    );
  }
}
