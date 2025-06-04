import 'package:get/get.dart';

class NetworkSearchPageController extends GetxController {
final List<String> countryList = ["India", "USA", "Dubai"];
final RxString selectedCountry = "".obs;

final List<String> jobList = ["Flutter Developer", "React Native Developer", "Laravel Developer"];
final RxString selectedJob = "".obs;

final List<String> interestList = ["Production", "Direction", "Editing"];
final RxList<String> selectedInterests = <String>[].obs;
  void selectCountry(String? value) {
    if (value != null) selectedCountry.value = value;
  }

  void selectJob(String? value) {
    if (value != null) selectedJob.value = value;
  }

  // Select interest
  void selectInterest(String? value) {
    if (value != null && !selectedInterests.contains(value)) {
      selectedInterests.add(value);
    }
  }

  // Remove interest
  void removeInterest(String value) {
    selectedInterests.remove(value);
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
