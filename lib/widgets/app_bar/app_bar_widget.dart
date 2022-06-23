import 'package:flutter/material.dart';

import '../button/icon_button_widget.dart';
import '../text/text_widget.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  AppBarWidget({
    Key? key,
    required this.text,
    required this.leadingColor,
    required this.onTap,
    required this.icon,
    required this.iconSize,
    this.leadingSize,
    this.iconColor,
  }) : super(key: key);

  final Color leadingColor;
  final String text;
  final VoidCallback onTap;
  final IconData icon;
  final double iconSize;
  final Color? iconColor;
  final double? leadingSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leadingWidth: leadingSize,
      leading: Icon(
        Icons.circle,
        size: leadingSize,
        color: leadingColor,
      ),
      title:
          Align(alignment: Alignment.centerLeft, child: TextWidget(text: text)),
      actions: [
        IconButtonWidget(onTap: onTap, icon: icon, iconSize: iconSize),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
