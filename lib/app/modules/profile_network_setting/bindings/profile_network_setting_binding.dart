import 'package:get/get.dart';

import '../controllers/profile_network_setting_controller.dart';

class ProfileNetworkSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileNetworkSettingController>(
      () => ProfileNetworkSettingController(),
    );
  }
}
