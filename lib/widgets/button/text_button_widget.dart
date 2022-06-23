import 'package:flutter/material.dart';

import '../text/text_widget.dart';

class TextButtonWidget extends StatelessWidget {
  TextButtonWidget(
      {Key? key, required this.text, required this.onTap, this.labelColor})
      : super(key: key);

  final String text;
  final VoidCallback onTap;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        child: TextWidget(
          text: text,
          textColor: labelColor,
        ));
  }
}
