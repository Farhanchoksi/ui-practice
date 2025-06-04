import 'package:get/get.dart';

import '../controllers/network_privacy_setting_controller.dart';

class NetworkPrivacySettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkPrivacySettingController>(
      () => NetworkPrivacySettingController(),
    );
  }
}
