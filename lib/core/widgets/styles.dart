import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

class VStyle {
  static BoxDecoration boxShadow({color = Colors.white, radius = 8.0}) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: shadow(),
    );
  }

  static BoxDecoration boxShadowOutline(
      {color = Colors.white, radius = 16.0, borderColor}) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: borderColor),
      boxShadow: shadow(),
    );
  }

  static shadow() {
    return const [BoxShadow(blurRadius: 8.0, color: Colors.black12)];
  }

  static BoxDecoration corner({radius = 8.0, color}) {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(radius), color: color);
  }

  static InputDecoration whiteBoxSearch({
    required String hintText,
    required void Function() onClear,
    double corner = 8.0,
    bool useSuffix = false,
  }) {
    return InputDecoration(
      contentPadding: const EdgeInsets.all(0.0),
      hintText: hintText,
      hintStyle: GoogleFonts.poppins(fontSize: 14.0),
      prefixIcon: const Icon(Icons.search),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(corner),
        borderSide: BorderSide.none,
      ),
      suffixIcon: useSuffix
          ? InkWell(
              onTap: onClear,
              child: Container(
                margin: const EdgeInsets.all(12.0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.clear,
                  size: 12.0,
                ),
              ),
            )
          : const SizedBox(),
    );
  }

  static InputDecoration boxSearch({
    required String hintText,
    required void Function() onClear,
    double corner = 24.0,
    bool useSuffix = false,
  }) {
    return InputDecoration(
      contentPadding: const EdgeInsets.all(0.0),
      hintText: hintText,
      hintStyle: const TextStyle(
        color: VColor.searchText,
        fontSize: 14.0,
      ),
      prefixIcon: const Icon(Icons.search, color: VColor.searchText),
      filled: true,
      fillColor: VColor.listItemBg,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(corner),
        borderSide: BorderSide.none,
      ),
      labelStyle: const TextStyle(color: VColor.searchText),
      suffixIcon: useSuffix
          ? InkWell(
              onTap: onClear,
              child: Container(
                margin: const EdgeInsets.all(12.0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: VColor.scaffoldBg,
                ),
                child: const Icon(
                  Icons.clear,
                  color: VColor.searchText,
                  size: 12.0,
                ),
              ),
            )
          : null,
    );
  }

  static BoxDecoration roundedOutline(
      {color = VColor.grey, radius = 16.0, borderColor = VColor.grey}) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: borderColor),
    );
  }
}
