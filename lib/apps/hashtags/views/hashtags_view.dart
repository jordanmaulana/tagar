import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:tagar/data/data_controller.dart';
import 'package:tagar/core/widgets/lists.dart';
import 'package:tagar/data/models/data.dart';

import '../../../core/utils/colors.dart';
import '../../../core/widgets/texts.dart';

class HashtagsView extends StatelessWidget {
  const HashtagsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 120.0,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: VColor.orange,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  VText(
                    '#Tagar',
                    color: VColor.white,
                    fontSize: 20.0,
                  ),
                  GetBuilder(
                    builder: (DataController controller) {
                      return VText(
                        'Kamu punya  ${controller.tags.length}  tagar',
                        color: VColor.white,
                      );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: GetBuilder(
                id: 'tags',
                builder: (DataController controller) {
                  return VList(
                    loading: controller.tagLoading,
                    length: controller.tags.length,
                    itemBuilder: (c, i) {
                      Tag data = controller.tags[i];
                      return ListTile(
                        dense: true,
                        title: VText(data.name),
                        subtitle: TagDataItem(data.datas),
                        // trailing: IconButton(
                        //   icon: const Icon(Icons.delete),
                        //   onPressed: () => controller.deleteTag(data),
                        // ),
                      );
                    },
                    onRefresh: () async {
                      return;
                    },
                    errorMsg: '',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TagDataItem extends StatefulWidget {
  final IsarLinks data;
  const TagDataItem(this.data, {Key? key}) : super(key: key);

  @override
  State<TagDataItem> createState() => _TagDataItemState();
}

class _TagDataItemState extends State<TagDataItem> {
  List<Data> data = [];

  @override
  void didUpdateWidget(covariant oldWidget) {
    widget.data.load(overrideChanges: false).then((value) {
      setState(() {});
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    await widget.data.load();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return VText('${widget.data.length} data');
  }
}
