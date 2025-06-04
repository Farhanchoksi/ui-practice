import 'package:get/get.dart';

class NetworkPrivacySettingController extends GetxController {
  // For CheckboxListTile single-select (radio-like)
  final RxInt selectedcheckbox = 0.obs;

  void onCheckboxChange(int value, bool checked) {
    if (checked) {
      selectedcheckbox.value = value;
    } else {
      // Unchecking is not allowed, keep at least one selected
      // Optionally, you can allow unchecking to set to 0
      // selectedcheckbox.value = 0;
    }
  }

  //TODO: Implement NetworkPrivacySettingController

  final selectedradio = 0.obs;
  final selectedborder = 0.obs;

  void onRadioChange(int value) {
    selectedradio.value = value;
    selectedborder.value = value;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
