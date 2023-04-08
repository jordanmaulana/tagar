import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tagar/core/widgets/buttons.dart';
import 'package:tagar/core/widgets/inputs.dart';
import 'package:tagar/core/widgets/popup.dart';
import 'package:tagar/core/widgets/texts.dart';

import '../../../routes.dart';
import '../controllers/add_data_controller.dart';

class AddDataView extends StatelessWidget {
  const AddDataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddDataController controller = Get.put(AddDataController());
    return Scaffold(
      appBar: AppBar(
        title: VText('${controller.data != null ? 'Ubah' : 'Tambah'} Data'),
        actions: [
          if (controller.data != null)
            IconButton(
              onPressed: () {
                VPopup.proceedWarning(
                  title: 'Hapus data?',
                  message: 'Yakin nih mau dihapus?',
                  callback: () async {
                    await controller.controller.deleteData(controller.data!);
                    Get.until(ModalRoute.withName(Routes.main));
                  },
                );
              },
              icon: const Icon(Icons.delete),
            ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  VFormInput(
                    hint: 'Link',
                    maxLines: null,
                    controller: controller.linkBox,
                  ),
                  const SizedBox(height: 16.0),
                  VFormInput(
                    hint: 'Deskripsi',
                    maxLines: null,
                    controller: controller.descBox,
                    textCapitalization: TextCapitalization.sentences,
                  ),
                  const SizedBox(height: 16.0),
                  VFormInput(
                    hint: '#Tagar',
                    maxLines: null,
                    controller: controller.tagarBox,
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: VButton(
              'Simpan',
              onTap: () => controller.submit(),
            ),
          ),
        ],
      ),
    );
  }
}
