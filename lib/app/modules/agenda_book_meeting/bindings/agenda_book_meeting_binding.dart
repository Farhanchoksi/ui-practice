import 'package:get/get.dart';

import '../controllers/agenda_book_meeting_controller.dart';

class AgendaBookMeetingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AgendaBookMeetingController>(
      () => AgendaBookMeetingController(),
    );
  }
}
