import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'texts.dart';

class MaintenanceView extends StatelessWidget {
  const MaintenanceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
              'maintenanceDesc'.tr,
              align: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
