import 'package:flutter/material.dart';

TextStyle appStyle(
    {required FontWeight fw, required double size, required Color color}) {
  return TextStyle(
      fontFamily: "Poppins", fontSize: size, fontWeight: fw, color: color);
}
