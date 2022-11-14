import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tagar/apps/home/views/home_view.dart';
import 'package:tagar/core/utils/colors.dart';
import 'package:tagar/data/data_controller.dart';

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
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.index.value,
          onTap: (v) => controller.setPage(v),
          unselectedItemColor: Colors.white30,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svgs/house.svg',
                width: 24.0,
                color: controller.index.value == 0 ? Colors.blue : VColor.grey,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svgs/hashtag.svg',
                width: 20.0,
                color: controller.index.value == 1 ? Colors.blue : VColor.grey,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
