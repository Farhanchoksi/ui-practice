import 'package:get/get.dart';

import '../controllers/profile_connection_controller.dart';

class ProfileConnectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileConnectionController>(
      () => ProfileConnectionController(),
    );
  }
}
