import 'package:flutter/material.dart';

class VColor {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  // ignore: unused_element
  VColor._();

  static const Color scaffoldBg = Color(0xff080D1B);
  static const Color grey = Color(0xff70717B);
  static const Color searchText = Color(0xff50566A);
  static const Color red = Color(0xffF00F13);
  static const Color orange = Color(0xffF77F00);
  static const Color listItemBg = Color(0xff1B1E2A);
  static const Color white = Colors.white;

  static const Color dark = Color(0xff252525);
  static const Color border = Color(0xffE0E0E0);
  static const Color bottomGrey = Color(0xffD1D1D6);
  static const Color hint = Colors.white54;

  static LinearGradient blueGradient() {
    return const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xff64ADEF), Color(0xff3198F4)],
    );
  }

  static colorFilterFromColor(Color color) {
    return ColorFilter.mode(color, BlendMode.dstIn);
  }
}
