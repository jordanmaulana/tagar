import 'package:any_link_preview/any_link_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tagar/apps/main_nav/controllers/data_controller.dart';
import 'package:tagar/core/widgets/lists.dart';
import 'package:tagar/core/widgets/texts.dart';
import 'package:tagar/data/models/data.dart';
import 'package:tagar/routes.dart';
import 'package:tagar/utils/second_utils.dart';

import '../../../core/widgets/styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataController controller = Get.find();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.addData),
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller.queryBox,
                      decoration: VStyle.whiteBoxSearch(
                        hintText: 'Cari #tagar',
                        onClear: () {},
                      ),
                      onChanged: (v) => controller.beginQuery(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: GetBuilder(
                builder: (DataController controller) {
                  return VList(
                    loading: controller.loading,
                    length: controller.data.length,
                    itemBuilder: (c, i) {
                      Data data = controller.data[i];
                      return DataCard(data);
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

class DataCard extends StatelessWidget {
  final Data data;

  const DataCard(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataController controller = Get.find();
    return Container(
      decoration: VStyle.boxShadow(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (data.link != null)
            AnyLinkPreview(
              link: data.link!,
              displayDirection: UIDirection.uiDirectionVertical,
              showMultimedia: true,
              bodyMaxLines: 5,
              bodyTextOverflow: TextOverflow.ellipsis,
              titleStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
              bodyStyle: const TextStyle(color: Colors.grey, fontSize: 12),
              errorBody: 'Preview tidak bisa ditampilkan',
              errorTitle: 'Kesalahan',
              errorWidget: Container(
                color: Colors.grey[300],
                child: const Text('Oops!'),
              ),
              cache: const Duration(days: 7),
              removeElevation: true,
              boxShadow: const [BoxShadow(blurRadius: 3, color: Colors.grey)],
              onTap: () {}, // This disables tap event
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VText(data.description),
                DataTags(data),
                IconButton(
                    onPressed: () => controller.deleteData(data),
                    icon: const Icon(Icons.delete)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DataTags extends StatefulWidget {
  final Data data;

  const DataTags(this.data, {Key? key}) : super(key: key);

  @override
  State<DataTags> createState() => _DataTagsState();
}

class _DataTagsState extends State<DataTags> {
  @override
  Widget build(BuildContext context) {
    return VText(
      SecondUtils.listToHashtag(widget.data.tags.map((e) => e.tag).toList()),
      color: Colors.blue,
    );
  }

  @override
  void didUpdateWidget(covariant DataTags oldWidget) {
    widget.data.tags.load(overrideChanges: false).then((value) {
      setState(() {});
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    widget.data.tags.load(overrideChanges: false).then((value) {
      setState(() {});
    });
    super.initState();
  }
}
