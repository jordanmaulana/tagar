import 'package:get/get.dart';

class MainNavController extends GetxController {
  RxInt index = 0.obs;

  setPage(int v) {
    index(v);
  }
}
