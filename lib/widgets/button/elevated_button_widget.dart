import 'package:flutter/material.dart';

import '../text/text_widget.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {Key? key,
      required this.text,
      required this.onTap,
      this.buttonColor,
      this.textColor})
      : super(key: key);

  final String text;
  final VoidCallback onTap;
  final Color? buttonColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width, 45),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            side: BorderSide(color: textColor ?? Colors.black, width: 2)),
        primary: buttonColor,
      ),
      child: TextWidget(
        text: text,
        textColor: textColor ?? Colors.black,
      ),
    );
  }
}
