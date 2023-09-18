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

    List<Tag> tagList = [];

    List<Tag> tagList = [];
    for (var element in tags) {
      Get.log('element $element');

      Tag? result = await controller.isar.tags
      Tag? result = await controller.isar.tags
          .where()
          .nameEqualTo(element.trim())
          .build()
          .findFirst();
      if (result == null) {
        Get.log('element not found $element');
        Tag tag = Tag()
          ..name = element.trim()
          ..datas.add(form);
        form.tags.add(tag);
        tagList.add(tag);
        Tag tag = Tag()
          ..name = element.trim()
          ..datas.add(form);
        form.tags.add(tag);
        tagList.add(tag);
      } else {
        Tag tag = result..datas.add(form);
        Tag tag = result..datas.add(form);
        Get.log('element found $element');
        form.tags.add(tag);
        tagList.add(tag);
        form.tags.add(tag);
        tagList.add(tag);
      }
    }
    await controller.isar.writeTxn(() async {
      await controller.isar.datas.put(form);
      await form.tags.save();
      await controller.isar.tags.putAll(tagList);
    });

    for (var v in tagList) {
      Get.log('${v.name} ${v.datas.length}');
    }

    for (var v in tagList) {
      Get.log('${v.name} ${v.datas.length}');
    }
    controller.beginDataQuery();
    Get.back();
  }

  @override
  void onInit() async {
    if (data != null) {
      await data!.tags.load();
      tagarBox.text =
          SecondUtils.listToHashtag(data!.tags.map((e) => e.name).toList());
          SecondUtils.listToHashtag(data!.tags.map((e) => e.name).toList());
      descBox.text = data!.description ?? '';
      linkBox.text = data!.link ?? '';
    }
    super.onInit();
  }
}
