import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:student_dashboard/widgets/text/text_widget.dart';

class PercentageIndicatorWidget extends StatelessWidget {
  PercentageIndicatorWidget(
      {Key? key,
      required this.percentValue,
      required this.valueColor,
      required this.text,
      this.backgroundColor})
      : super(key: key);

  final Color valueColor;
  final Color? backgroundColor;
  final double percentValue;
  final String text;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      percent: percentValue,
      backgroundColor: backgroundColor ?? Colors.transparent,
      radius: 80.0,
      startAngle: 65.0,
      lineWidth: 10,
      animation: true,
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextWidget(text: 'Total', textSize: 20, textWeight: FontWeight.bold),
          TextWidget(text: text, textSize: 22, textWeight: FontWeight.normal),
        ],
      ),
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: valueColor,
    );
  }
}
