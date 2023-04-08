import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:tmdb_app/app/core/constants/common_constants.dart';

class PrimaryButton extends StatefulWidget {
  final String buttonText;
  final bool isActive;
  final Function() onPressed;
  const PrimaryButton(
      {Key? key,
      required this.buttonText,
      required this.isActive,
      required this.onPressed})
      : super(key: key);

  @override
  _PrimaryButtonState createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: widget.isActive == false
            ? MaterialStateProperty.all(Colors.white54)
            : MaterialStateProperty.all(Colors.white),
      ),
      onPressed: widget.isActive == false ? null : widget.onPressed,
      child: Container(
        width: screenWidth,
        child: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0.0, 1.6.h, 0.0, 1.6.h),
            child: Text(widget.buttonText.toUpperCase(),
                textScaleFactor: 1,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0.sp,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}
