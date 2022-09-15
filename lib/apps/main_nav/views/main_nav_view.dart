import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tagar/apps/home/views/home_view.dart';
import 'package:tagar/apps/main_nav/controllers/data_controller.dart';

import '../../hashtags/views/hashtags_view.dart';
import '../controllers/main_nav_controller.dart';

class MainNavView extends StatelessWidget {
  const MainNavView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainNavController controller = Get.put(MainNavController());
    Get.put(DataController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Obx(
        () => IndexedStack(
          index: controller.index.value,
          children: const [
            HomeView(),
            HashtagsView(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          fixedColor: Colors.white,
          backgroundColor: Colors.blue,
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.index.value,
          onTap: (v) => controller.setPage(v),
          unselectedItemColor: Colors.white30,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.tag),
              label: 'Tagar',
            ),
          ],
        ),
      ),
    );
  }
}
