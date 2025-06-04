import 'package:get/get.dart';

import '../controllers/network_page_controller.dart';

class NetworkPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkPageController>(
      () => NetworkPageController(),
    );
  }
}
