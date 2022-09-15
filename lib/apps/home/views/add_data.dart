import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tagar/apps/main_nav/controllers/data_controller.dart';
import 'package:tagar/core/widgets/buttons.dart';
import 'package:tagar/core/widgets/inputs.dart';
import 'package:tagar/core/widgets/texts.dart';
import 'package:tagar/data/models/data.dart';

class AddDataView extends StatelessWidget {
  const AddDataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataController controller = Get.find();
    TextEditingController tagarBox = TextEditingController();
    TextEditingController descBox = TextEditingController();
    TextEditingController linkBox = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const VText('Tambah Data'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  VFormInput(
                    hint: '#Tagar',
                    maxLines: null,
                    controller: tagarBox,
                  ),
                  const SizedBox(height: 16.0),
                  VFormInput(
                    hint: 'Deskripsi',
                    maxLines: null,
                    controller: descBox,
                    textCapitalization: TextCapitalization.sentences,
                  ),
                  const SizedBox(height: 16.0),
                  VFormInput(
                    hint: 'Link',
                    maxLines: null,
                    controller: linkBox,
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: VButton(
              'Tambahkan',
              onTap: () async {
                final form = Data()
                  ..description = descBox.text
                  ..link = linkBox.text;

                final tags = tagarBox.text.split('#');
                tags.removeAt(0);
                for (var element in tags) {
                  form.tags.add(Tag()..tag = element);
                }
                await controller.isar.writeTxn((isar) async {
                  await isar.datas.put(form);
                  await form.tags.save();
                });
                Get.back();
              },
            ),
          ),
        ],
      ),
    );
  }
}
