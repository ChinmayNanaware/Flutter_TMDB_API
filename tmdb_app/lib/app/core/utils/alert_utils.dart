import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../main.dart';

class AlertUtils {
  static void showAlertDialog(
      {BuildContext? context,
      String? title,
      String? message,
      Function()? performTask}) {
    showDialog(
        context: context!,
        builder: (BuildContext context) => AlertDialog(
              contentPadding: EdgeInsets.zero,
              content: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
                child: Text(
                  message!,
                  textScaleFactor: 1,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    if (performTask != null) {
                      performTask();
                    }
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text("OK",
                          textScaleFactor: 1,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                )
              ],
            ));
  }

  // static showSnackAlert(BuildContext context, String message, bool isError) {
  //   Flushbar(
  //     isDismissible: true,
  //     boxShadows: [
  //       BoxShadow(
  //         blurRadius: 1.0.h,
  //         color: Color(ColorConst.secondaryRed),
  //         spreadRadius: 0.3.h, //extend the shadow
  //       )
  //     ],
  //     messageSize: 13.0.sp / MediaQuery.of(context).textScaleFactor,
  //     messageColor: Colors.black,
  //     borderRadius: BorderRadius.all(Radius.circular(0.5.h)),
  //     borderColor: Color(ColorConst.secondaryRed),
  //     borderWidth: 0.7,
  //     backgroundColor: Color(ColorConst.whiteGreyColor),
  //     icon: CircleAvatar(
  //       radius: 2.0.h,
  //       backgroundColor: isError == true
  //           ? Color(ColorConst.whiteGreyColor)
  //           : Color(ColorConst.primaryRed),
  //       child: Image.asset(
  //           isError == true ? ImageConst.icError : ImageConst.icCircleCheck,
  //           scale: 1.5,
  //           color: isError == true ? null : Color(ColorConst.whiteColor)),
  //     ),
  //     margin: EdgeInsets.all(2.0.h),
  //     padding: EdgeInsets.fromLTRB(2.0.h, 3.0.h, 2.0.h, 3.0.h),
  //     flushbarPosition: FlushbarPosition.TOP,
  //     message: message,
  //     duration: Duration(seconds: 4),
  //   )..show(context);
  // }

}
