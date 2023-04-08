import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget CustomTile(String image, String title, String overview) {
  return Container(
      child: Row(
    children: [
      Image.network('https://image.tmdb.org/t/p/w220_and_h330_face/$image'),
    ],
  ));
}
