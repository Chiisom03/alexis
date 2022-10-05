import 'package:flutter/material.dart';

export 'package:flutter_screenutil/flutter_screenutil.dart';

Widget regularText(String text,
    {Color? color,
    double? fontSize = 14,
    double? letterSpacing,
    double? height,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow? overflow,
    TextDecoration? decoration,
    FontWeight? fontWeight,
    bool blur = false}) {
  return Text(
    text,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
    softWrap: true,
    style: TextStyle(
      color: color,
      letterSpacing: letterSpacing,
      fontSize: fontSize,
      height: height,
      fontWeight: fontWeight,
      decoration: decoration,
    ),
  );
}
