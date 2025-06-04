import 'package:get/get.dart';

import '../controllers/ahmed_profile_controller.dart';

class AhmedProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AhmedProfileController>(
      () => AhmedProfileController(),
    );
  }
}
