import 'package:any_link_preview/any_link_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tagar/core/utils/colors.dart';
import 'package:tagar/core/widgets/lists.dart';
import 'package:tagar/core/widgets/texts.dart';
import 'package:tagar/data/data_controller.dart';
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
      backgroundColor: VColor.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.addData),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
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
              child: TextFormField(
                controller: controller.queryBox,
                style: GoogleFonts.poppins(fontSize: 14.0),
                decoration: VStyle.whiteBoxSearch(
                  hintText: 'Cari #tagar',
                  onClear: () {},
                ),
                onChanged: (v) => controller.beginDataQuery(),
              ),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: GetBuilder(
                id: 'data',
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
    return InkWell(
      onTap: () => Get.toNamed(Routes.addData, arguments: data),
      child: Container(
        decoration: VStyle.boxShadow(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (data.link != null && data.link!.isNotEmpty)
              AbsorbPointer(
                child: AnyLinkPreview(
                  backgroundColor: VColor.white,
                  link: data.link!,
                  displayDirection: UIDirection.uiDirectionVertical,
                  showMultimedia: true,
                  bodyMaxLines: 2,
                  bodyTextOverflow: TextOverflow.ellipsis,
                  titleStyle: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                  bodyStyle: GoogleFonts.poppins(fontSize: 12),
                  errorBody: 'Preview tidak bisa ditampilkan',
                  errorTitle: 'Kesalahan',
                  errorWidget: Container(
                    color: Colors.grey[300],
                    child: const Text('Oops!'),
                  ),
                  removeElevation: true,
                  onTap: () {}, // This disables tap event
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (data.description != null && data.description!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: VText(data.description),
                    ),
                  DataTags(data),
                ],
              ),
            ),
          ],
        ),
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
      SecondUtils.listToHashtag(widget.data.tags.map((e) => e.name).toList()),
      color: VColor.orange,
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
