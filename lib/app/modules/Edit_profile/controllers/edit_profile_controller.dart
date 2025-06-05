import 'package:get/get.dart';

class EditProfileController extends GetxController {
  //TODO: Implement EditProfileController
final List<String> interestList = ["Production", "Direction", "Editing"];
  final RxList<String> selectedInterests = <String>[].obs;
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

void selectInterest(String? value) {
    if (value != null && !selectedInterests.contains(value)) {
      selectedInterests.add(value);
    }
  }

  // Remove interest
  void removeInterest(String value) {
    selectedInterests.remove(value);
  }

}
