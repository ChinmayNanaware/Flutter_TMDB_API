import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:sizer/sizer.dart';

Widget LoadingWidget() {
  return Container(
    padding: EdgeInsets.all(40.0.w),
    color: Colors.black,
    child: const Center(
      child: LoadingIndicator(
        indicatorType: Indicator.ballRotateChase,
        colors: [Colors.white60],
      ),
    ),
  );
}
