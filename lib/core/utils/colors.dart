import 'package:flutter/material.dart';

class VColor {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  // ignore: unused_element
  VColor._();

  static const Color scaffoldBg = Color(0xff080D1B);
  static const Color cardBg = Color(0xff181A26);
  static const Color greyText = Color(0xff525460);
  static const Color searchText = Color(0xff50566A);
  static const Color red = Color(0xffF00F13);
  static const Color orange = Color(0xffF77F00);
  static const Color listItemBg = Color(0xff1B1E2A);
  static const Color green = Color(0xff01D157);

  static const Color purple = Color(0xff605DF1);
  static const Color grey = Color(0xfff2f2f2);
  static const Color dark = Color(0x7f252525);
  static const Color border = Color(0xffE0E0E0);
  static const Color bottomGrey = Color(0xffD1D1D6);
  static const Color hint = Colors.white54;
  static const Color whatsapp = Color(0xff128C7E);

  static LinearGradient cardShadow() {
    return const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.black54, Colors.transparent, Colors.transparent],
    );
  }

  static gateTextColor(String? status) {
    if (status == null || status == '') return scaffoldBg;
    if (status == 'pass') {
      return green;
    } else if (status == 'used') {
      return orange;
    } else {
      return red;
    }
  }
}
