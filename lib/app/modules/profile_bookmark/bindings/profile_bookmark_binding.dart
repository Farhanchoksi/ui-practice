import 'package:get/get.dart';

import '../controllers/profile_bookmark_controller.dart';

class ProfileBookmarkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileBookmarkController>(
      () => ProfileBookmarkController(),
    );
  }
}
