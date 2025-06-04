import 'package:get/get.dart';

import '../controllers/agenda_talk_detail_controller.dart';

class AgendaTalkDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AgendaTalkDetailController>(
      () => AgendaTalkDetailController(),
    );
  }
}
