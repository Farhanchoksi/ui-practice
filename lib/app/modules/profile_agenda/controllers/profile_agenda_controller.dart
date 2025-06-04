import 'package:get/get.dart';



class AgendaItem {
  final String time;
  final String period;
  final String type;
  final String title;
  final String description;
  final String status;
  final List<Speaker> speakers;
  //final List<String> tags;
  final String venue;
  //final bool isBookmarked;

  AgendaItem({
     required this.time,
     required this.period,
    required this.type,
    required this.title,
     required this.description,
     required this.status,
     // required this.speakers,
   this.speakers = const [],
    // required this.tags,
    required this.venue,
    // this.isBookmarked = false,
  });
}

class Speaker {
  final String name;
  final String role;

  Speaker({required this.name, required this.role});
}

class ProfileAgendaController extends GetxController {
  //TODO: Implement ProfileAgendaController
final RxList<AgendaItem> agendaItems = <AgendaItem>[].obs;
final RxString selectedTimeSlot = ''.obs;

void loadAgendaItems() {
 agendaItems.value = [
AgendaItem(
        time: "01:15",
        period: "PM",
        type: "Talk",
        title: "Business Development",
        description: "At HealthHub Solutions, we believe in the power of community, believe in the power o...",
        status: "Completed",
        speakers: [
          Speaker(name: "Host Name", role: "Host"),
          Speaker(name: "Speaker Name", role: "Speaker"),
          Speaker(name: "Speaker", role: "Speaker"),
          Speaker(name: "Speaker", role: "Speaker"),
        ],
        //tags: ["Business", "Development", "Tags", "Tag"],
        venue: "Conference • Main Hall",
        //isBookmarked: false,
      ),
AgendaItem(
        time: "01:15",
        period: "PM",
        type: "Meeting",
        title: "Business Development",
        description: "At HealthHub Solutions, we believe in the power of community, believe in the power o...",
        status: "Completed",
        //tags: ["Business", "Development", "Tags", "Tag"],
        venue: "Conference • Main Hall",
        //isBookmarked: false,
      ),
      
      AgendaItem(
        time: "01:15",
        period: "PM",
        
        type: "Meeting",
        title: "Business Development",
        description: "At HealthHub Solutions, we believe in the power of community, believe in the power o...",
        status: "Pending",
        //tags: ["Business", "Development", "Tags", "Tag"],
        venue: "Conference • Main Hall",
        //isBookmarked: false,
      ),
      
 ];

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
