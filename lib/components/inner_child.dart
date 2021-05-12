import 'package:flutter/material.dart';
import '../constents.dart';

class InnerCardItem extends StatelessWidget {
  final IconData iconData;
  final String lable;

  InnerCardItem({required this.iconData, required this.lable});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          lable,
          style: KStylelayoutText,
        ),
      ],
    );
  }
}
