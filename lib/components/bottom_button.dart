import 'package:flutter/material.dart';
import '../constents.dart';

class Bottom_Button extends StatelessWidget {
  final String lable;
  final Function() onTap;

  Bottom_Button({required this.lable, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            lable,
            style: KBottomStyle,
          ),
        ),
        padding: EdgeInsets.only(
          bottom: 15.0,
        ),
        color: KBottomColor,
        height: KBottomHeight,
        width: double.infinity,
        margin: EdgeInsets.only(top: 16.0),
      ),
    );
  }
}
