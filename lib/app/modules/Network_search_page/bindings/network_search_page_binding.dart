import 'package:get/get.dart';

import '../controllers/network_search_page_controller.dart';

class NetworkSearchPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkSearchPageController>(
      () => NetworkSearchPageController(),
    );
  }
}
