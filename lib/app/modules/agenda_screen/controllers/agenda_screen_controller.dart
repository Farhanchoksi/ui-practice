import 'package:get/get.dart';

class AgendaItem {
  final String time;
  final String period;
  final String type;
  final String title;
  final String description;
  final List<Speaker> speakers;
  final List<String> tags;
  final String venue;
  final bool isBookmarked;

  AgendaItem({
    required this.time,
    required this.period,
    required this.type,
    required this.title,
    required this.description,
    required this.speakers,
    required this.tags,
    required this.venue,
    this.isBookmarked = false,
  });
}

class Speaker {
  final String name;
  final String role;

  Speaker({
    required this.name,
    required this.role,
  });
}

class AgendaScreenController extends GetxController {
  //TODO: Implement AgendaScreenController

  final List<String> countryList = ["India", "USA", "Dubai"];
  final RxString selectedCountry = "".obs;

  final List<String> jobList = ["Flutter Developer", "React Native Developer", "Laravel Developer"];
  final RxString selectedJob = "".obs;

  final List<String> interestList = ["Production", "Direction", "Editing"];
  final RxList<String> selectedInterests = <String>[].obs;
  
  // Agenda items list
  final RxList<AgendaItem> agendaItems = <AgendaItem>[].obs;
  
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
  
  // Toggle bookmark
  void toggleBookmark(int index) {
    final item = agendaItems[index];
    final updatedItem = AgendaItem(
      time: item.time,
      period: item.period,
      type: item.type,
      title: item.title,
      description: item.description,
      speakers: item.speakers,
      tags: item.tags,
      venue: item.venue,
      isBookmarked: !item.isBookmarked,
    );
    
    agendaItems[index] = updatedItem;
  }
  
  // Load agenda items data
  void loadAgendaItems() {
    agendaItems.value = [
      AgendaItem(
        time: "01:15",
        period: "PM",
        type: "Talk",
        title: "Business Development",
        description: "At HealthHub Solutions, we believe in the power of community, believe in the power o...",
        speakers: [
          Speaker(name: "Host Name", role: "Host"),
          Speaker(name: "Speaker Name", role: "Speaker"),
          Speaker(name: "Speaker", role: "Speaker"),
          Speaker(name: "Speaker", role: "Speaker"),
        ],
        tags: ["Business", "Development", "Tags", "Tag"],
        venue: "Conference • Main Hall",
        isBookmarked: false,
      ),
      AgendaItem(
        time: "01:45",
        period: "PM",
        type: "",
        title: "Free Time",
        description: "",
        speakers: [],
        tags: [],
        venue: "",
        isBookmarked: false,
      ),
      AgendaItem(
        time: "02:15",
        period: "PM",
        type: "Talk",
        title: "Business Development",
        description: "At HealthHub Solutions, we believe in the power of community, believe in the power o...",
        speakers: [
          Speaker(name: "Host Name", role: "Host"),
          Speaker(name: "Speaker Name", role: "Speaker"),
          Speaker(name: "Speaker", role: "Speaker"),
          Speaker(name: "Speaker", role: "Speaker"),
        ],
        tags: ["Business", "Development"],
        venue: "Conference • Main Hall",
        isBookmarked: true,
      ),
    ];
  }

  @override
  void onInit() {
    super.onInit();
    loadAgendaItems();
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
