import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:tagar/utils/second_utils.dart';

import '../../../data/data_controller.dart';
import '../../../data/models/data.dart';

class AddDataController extends GetxController {
  DataController controller = Get.find();

  TextEditingController tagarBox = TextEditingController();
  TextEditingController descBox = TextEditingController();
  TextEditingController linkBox = TextEditingController();

  Data? data = Get.arguments;

  submit() async {
    if (tagarBox.text.isEmpty) return;
    if (descBox.text.isEmpty && linkBox.text.isEmpty) return;

    Data form;
    if (data == null) {
      form = Data()
        ..description = descBox.text
        ..link = linkBox.text;
    } else {
      form = data!
        ..description = descBox.text
        ..link = linkBox.text;
    }

    final tags = tagarBox.text.split('#');
    tags.removeAt(0);
    for (var element in tags) {
      var result = await controller.isar.tags
          .where()
          .tagEqualTo(element)
          .build()
          .findFirst();
      Get.log('$result');
      if (result == null) {
        form.tags.add(Tag()..tag = element.trim());
      } else {
        form.tags.add(result);
      }
    }
    await controller.isar.writeTxn((isar) async {
      await isar.datas.put(form);
      await form.tags.save();
    });
    controller.beginDataQuery();
    Get.back();
  }

  @override
  void onInit() async {
    if (data != null) {
      await data!.tags.load();
      tagarBox.text =
          SecondUtils.listToHashtag(data!.tags.map((e) => e.tag).toList());
      descBox.text = data!.description ?? '';
      linkBox.text = data!.link ?? '';
    }
    super.onInit();
  }
}
