import 'package:get/get.dart';

import '../controllers/profile_agenda_controller.dart';

class ProfileAgendaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileAgendaController>(
      () => ProfileAgendaController(),
    );
  }
}
