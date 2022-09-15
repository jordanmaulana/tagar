import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class VUtils {
  VUtils._();

  static String parsePriceValue(int price, {bool thousandSeperated = true}) {
    String returnValue;
    returnValue = price.toRadixString(10);

    if (thousandSeperated) {
      const currentFormat = '#,###,###';
      final numberFormat = NumberFormat(currentFormat, 'en');
      returnValue = numberFormat.format(double.parse(returnValue));
    }
    return returnValue;
  }

  static copySnackbar() {
    Get.snackbar(
      'success'.tr,
      'copied'.tr,
      colorText: Colors.white,
      icon: const Icon(
        Icons.check_circle_outline_rounded,
        color: Colors.white,
      ),
    );
  }

  static String formatDate(DateTime? data, {bool useToday = true}) {
    if (data == null) return '';
    String time;
    DateTime now = DateTime.now();
    if (data.year == now.year &&
        data.month == now.month &&
        data.day == now.day &&
        useToday) {
      time = 'today'.tr.replaceAll('{date}', dateToString(data, 'HH:mm'));
    } else {
      time = dateToString(data, 'd MMM yyyy HH:mm');
    }
    return time;
  }

  static String dateToString(DateTime? time, String format) {
    if (time == null) return '-';

    var formatter = DateFormat(format);
    String formatted = formatter.format(time);
    return formatted;
  }

  static String getPrettyJSONString(jsonObject) {
    if (jsonObject == null) return '';
    try {
      var encoder = const JsonEncoder.withIndent('     ');
      return encoder.convert(jsonObject);
    } catch (e) {
      Get.log(e.toString());
      return '';
    }
  }

  static void hideKeyboard(context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
