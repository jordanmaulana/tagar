import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'buttons.dart';
import 'popup.dart';
import 'texts.dart';
import '../utils/v_constants.dart';

class UpdateAppView extends StatelessWidget {
  const UpdateAppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/tapao_logo.png',
                height: 40,
                cacheHeight: 80,
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: VText(
                  'newVersion'.tr,
                  align: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              VButton(
                'gotoPS'.tr,
                onTap: () async {
                  if (await canLaunchUrl(Uri.parse(VConst.playStoreUrl))) {
                    await launchUrl(Uri.parse(VConst.playStoreUrl));
                  } else {
                    VPopup.error('cantLounchPS'.tr);
                  }
                },
              ),
              const SizedBox(height: 40),
              const VersionText(onlyVersion: true),
            ],
          ),
        ),
      ),
    );
  }
}
