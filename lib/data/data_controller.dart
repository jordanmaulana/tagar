import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tagar/data/models/data.dart';

class DataController extends GetxController {
  late Directory dir;
  late Isar isar;

  TextEditingController queryBox = TextEditingController();

  bool loading = true;
  bool tagLoading = true;

  List<Data> data = [];
  List<Tag> tags = [];

  deleteData(Data data) async {
    await isar.writeTxn(() async {
      await isar.datas.delete(data.id);
    });
    beginDataQuery();
    update(['data']);
  }

  deleteTag(Tag data) async {
    await isar.writeTxn(() async {
      await isar.tags.delete(data.id);
    });
    update(['tags']);
  }

  beginDataQuery() async {
    List<String> queryTags =
        queryBox.text.split('#').map((e) => e.trim()).toList();
    Get.log('queryList $queryTags');
    queryTags.removeAt(0);

    Query<Tag> finalQuery;
    if (queryTags.isEmpty) {
      finalQuery = isar.tags.buildQuery();
    } else {
      var queryBuilder =
          isar.tags.filter().nameStartsWith(queryTags[0], caseSensitive: false);
      for (var i = 1; i < queryTags.length; i++) {
        queryBuilder = queryBuilder
            .or()
            .nameStartsWith(queryTags[i], caseSensitive: false);
      }
      finalQuery = queryBuilder.build();
    }

    Stream<List<Tag>> tagsQueryChanged =
        finalQuery.watch(fireImmediately: true);

    tagsQueryChanged.listen((event) async {
      List<Data> list = [];

      Get.log('listen:');
      for (var element in event) {
        await element.datas.load();

        for (var element in element.datas) {
          await element.tags.load();
          Set tags = queryTags.toSet();
          Set elementTag = element.tags.map((e) => e.name.trim()).toSet();
          if (elementTag.intersection(tags).length != tags.length) {
            continue;
          }

          if (list.firstWhereOrNull(
                  (listElement) => listElement.id == element.id) !=
              null) continue;
          list.add(element);
        }
      }
      list.sort((b, a) => a.id.compareTo(b.id));
      data = list;
      loading = false;
      update(['data']);
    });
  }

  beginTagQuery() {
    Query<Tag> query = isar.tags.buildQuery();
    Stream<List<Tag>> tagsQueryChanged = query.watch(fireImmediately: true);
    tagsQueryChanged.listen((event) async {
      tags = event;
      tags.sort((a, b) => a.name.compareTo(b.name));

      tagLoading = false;
      update(['tags']);
    });
  }

  @override
  void onInit() async {
    dir = await getApplicationSupportDirectory();
    isar = await Isar.open(
      [DataSchema, TagSchema],
      directory: dir.path,
    );
    beginDataQuery();
    beginTagQuery();
    super.onInit();
  }
}
