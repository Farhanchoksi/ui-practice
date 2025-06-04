import 'package:get/get.dart';
import 'package:ui_project/app/modules/Network_page/controllers/network_page_controller.dart';

class AgendaItem {
  final String time;
  final String period;
  final String type;
  final String title;
  final String description;
  final List<Speaker> speakers;
  final List<String> tags;
  final String venue;
  final int id;
  final bool isBookmarked;

  AgendaItem({
    required this.id,
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
  final String? image;

  Speaker({
    required this.name,
    required this.role,
    this.image,
  });
}

class AgendaTalkDetailController extends GetxController {
  final RxList<AgendaItem> agendaItems = <AgendaItem>[].obs;
  final RxString _selectedTab = 'About'.obs;
  final RxList<AgendaItem> filterAgendaItem = <AgendaItem>[].obs;
  final RxList<Map<String, dynamic>> speakersList = <Map<String, dynamic>>[].obs;
  
  // Network controller to get speaker data
  final NetworkPageController _networkController = Get.put(NetworkPageController());

  String get selectedtab => _selectedTab.value;

  void loadAgendaItems() {
    // Load network data for speakers
    _networkController.loadDummyData();
    
    // Get speakers from network data
    speakersList.value = _networkController.profileUsers
        .where((user) => 
            user['type'] == 'profile' && 
            (user['profileType'] == 'speaker' || user['tags'].contains('Speaker')))
        .toList();
    
    // Create agenda items
    agendaItems.value = [
      AgendaItem(
        id: 1,
        time: "01:15",
        period: "PM",
        type: "Talk",
        title: "Intro to Business Development",
        description: "At HealthHub Solutions, we believe in the power of community and connection to transform lives. Our mission is to create innovative solutions that make health and wellness accessible to everyone. SnagFit Connect is our latest endeavor, designed to empower individuals on their fitness journeys by fostering a supportive and engaging community. Join us in building a healthier and more connected world, one workout at a time.",
        speakers: [
          // Convert network data to Speaker objects
          for (var speaker in speakersList)
            Speaker(
              name: speaker['name'], 
              role: speaker['title'],
              image: speaker['image'],
            ),
        ],
        tags: ["Business", "Development", "Tags", "Tag", "Tags", "Tag"],
        venue: "Conference • Main Hall",
        isBookmarked: false,
      ),
      AgendaItem(
        id: 2,
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
        id: 3,
        time: "02:15",
        period: "PM",
        type: "Talk",
        title: "Business Development",
        description: "At HealthHub Solutions, we believe in the power of community and connection to transform lives. Our mission is to create innovative solutions that make health and wellness accessible to everyone.",
        speakers: [
          // Convert network data to Speaker objects (using first 2 speakers)
          if (speakersList.length > 0) Speaker(
            name: speakersList[0]['name'], 
            role: speakersList[0]['title'],
            image: speakersList[0]['image'],
          ),
          if (speakersList.length > 1) Speaker(
            name: speakersList[1]['name'], 
            role: speakersList[1]['title'],
            image: speakersList[1]['image'],
          ),
        ],
        tags: ["Business", "Development"],
        venue: "Conference • Main Hall",
        isBookmarked: true,
      ),
    ];
    
    // Initialize with the first item (matching the screenshot)
    filterAgendaItem.value = [agendaItems[0]];
  }

  void applyFilter(String filter) {
    _selectedTab.value = filter;
    
    // For the demo, we'll just show the first item regardless of filter
    // In a real app, you would filter based on the selected tab
    filterAgendaItem.value = [agendaItems[0]];
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
