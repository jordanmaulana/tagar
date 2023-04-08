import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:tagar/data/data_controller.dart';
import 'package:tagar/core/widgets/lists.dart';
import 'package:tagar/data/models/data.dart';

import '../../../core/widgets/texts.dart';

class HashtagsView extends StatelessWidget {
  const HashtagsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const VText('Tagar')),
      body: GetBuilder(
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
