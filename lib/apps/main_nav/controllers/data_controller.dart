import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tagar/data/models/data.dart';

class DataController extends GetxController {
  late Directory dir;
  late Isar isar;

  late IsarCollection collection;

  TextEditingController queryBox = TextEditingController();
  bool loading = true;
  List<Data> data = [];

  deleteData(Data data) async {
    await isar.writeTxn((isar) async {
      await isar.datas.delete(data.id!);
    });
    update();
  }

  beginQuery({fromInit = false}) {
    List<String> queryList = queryBox.text.split('#');
    Get.log('queryList $queryList');
    queryList.removeAt(0);
    Query<Tag> finalQuery;
    if (queryList.isEmpty) {
      finalQuery = isar.tags.buildQuery();
    } else {
      var queryBuilder =
          isar.tags.filter().tagStartsWith(queryList[0], caseSensitive: false);
      for (var i = 1; i < queryList.length; i++) {
        queryBuilder =
            queryBuilder.or().tagStartsWith(queryList[i], caseSensitive: false);
      }
      finalQuery = queryBuilder.build();
    }

    Stream<List<Tag>> tagsQueryChanged = finalQuery.watch(initialReturn: true);
    tagsQueryChanged.listen((event) async {
      List<Data> list = [];
      Get.log('\n');
      for (var element in event) {
        await element.datas.load();

        for (var element in element.datas) {
          await element.tags.load();
          Set tags = queryList.toSet();
          Get.log('qtags: $tags');
          Set elementTag = element.tags.map((e) => e.tag.trim()).toSet();
          Get.log('etags: $elementTag');

          Get.log('intersect ${elementTag.intersection(tags)}');
          if (elementTag.intersection(tags).length != tags.length) {
            continue;
          }

          Get.log('data ${element.description}');
          if (list.firstWhereOrNull(
                  (listElement) => listElement.id == element.id) !=
              null) continue;
          list.add(element);
        }
      }
      data = list;
      loading = false;
      update();
    });
  }

  @override
  void onInit() async {
    dir = await getApplicationSupportDirectory();
    isar = await Isar.open(
      schemas: [DataSchema, TagSchema],
      directory: dir.path,
    );
    beginQuery(fromInit: true);

    super.onInit();
  }
}
