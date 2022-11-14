import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            loading: controller.loading,
            length: controller.tags.length,
            itemBuilder: (c, i) {
              Tag data = controller.tags[i];
              return ListTile(
                title: VText(data.tag),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => controller.deleteTag(data),
                ),
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
