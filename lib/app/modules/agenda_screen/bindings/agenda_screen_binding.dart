import 'package:get/get.dart';

import '../controllers/agenda_screen_controller.dart';

class AgendaScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AgendaScreenController>(
      () => AgendaScreenController(),
    );
  }
}
