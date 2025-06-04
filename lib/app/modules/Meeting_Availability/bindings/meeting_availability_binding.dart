import 'package:get/get.dart';

import '../controllers/meeting_availability_controller.dart';

class MeetingAvailabilityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MeetingAvailabilityController>(
      () => MeetingAvailabilityController(),
    );
  }
}
