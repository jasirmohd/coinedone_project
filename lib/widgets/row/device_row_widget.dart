import 'package:flutter/material.dart';

import '../text/text_widget.dart';

class DeviceRowWidget extends StatelessWidget {
  DeviceRowWidget(
      {Key? key, required this.image, required this.device, required this.time})
      : super(key: key);

  final String image;
  final String device;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Image.asset(
            image,
            height: 50,
            width: 50,
            fit: BoxFit.contain,
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: device,
                textSize: 16,
                textWeight: FontWeight.bold,
              ),
              TextWidget(
                text: time,
                textColor: Colors.blue,
              ),
            ],
          ),
        )
      ],
    );
  }
}
