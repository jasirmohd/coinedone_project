import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget(
      {Key? key,
      required this.onTap,
      required this.icon,
      required this.iconSize,
      this.iconColor})
      : super(key: key);

  final IconData icon;
  final VoidCallback onTap;
  final double iconSize;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onTap,
        icon: Icon(
          icon,
          color: iconColor ?? Colors.black,
          size: iconSize,
        ));
  }
}
