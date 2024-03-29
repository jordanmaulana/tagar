import 'package:tagar/apps/home/views/home_view.dart';
import 'package:tagar/data/data_controller.dart';

import '../../../export_view.dart';
import '../../hashtags/views/hashtags_view.dart';
import '../controllers/main_nav_controller.dart';

class MainNavView extends StatelessWidget {
  const MainNavView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainNavController controller = Get.put(MainNavController());
    Get.put(DataController());
    return Scaffold(
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
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svgs/house.svg',
                width: 24.0,
                colorFilter: VColor.colorFilterFromColor(
                    controller.index.value == 0 ? VColor.orange : VColor.grey),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svgs/hashtag.svg',
                width: 20.0,
                colorFilter: VColor.colorFilterFromColor(
                    controller.index.value == 1 ? VColor.orange : VColor.grey),
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
