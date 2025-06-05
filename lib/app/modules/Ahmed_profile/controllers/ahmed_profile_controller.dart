import 'package:get/get.dart';

class AgendaItem {
  final String type;
  final String title;
  final String venue;
  final List<Speaker> speakers;
//  final List<String> tags;

  AgendaItem({required this.type, required this.title, required this.venue, required this.speakers, /*required this.tags*/});
}
class Speaker {
  final String name;
  final String role;

  Speaker({required this.name, required this.role});
}
class AhmedProfileController extends GetxController {
  //TODO: Implement AhmedProfileController

  final RxList<Map<String, dynamic>> profileUsers =
      <Map<String, dynamic>>[].obs;


  final RxBool isLoading = false.obs;
  final RxString selectedTab = 'About'.obs;
  final RxList<Map<String, dynamic>> filterUsers =
      <Map<String, dynamic>>[].obs;
  final RxList<AgendaItem> agendaItems = <AgendaItem>[].obs;

void loadAgendaItems() {
    agendaItems.value = [
      AgendaItem(
        //time: "01:15",
        // period: "PM",
        type: "Talk",
        title: "Business Development",
        //description: "At HealthHub Solutions, we believe in the power of community, believe in the power o...",
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
     
    ];
  }
void loadDummyData() {
    isLoading.value = true;

    // Simulate API delay
    Future.delayed(Duration(milliseconds: 500), () {
      profileUsers.value = [
        {
          'name': 'Abdelrahman Eid',
          'title': 'CTO @ PalPay',
          'image': 'https://randomuser.me/api/portraits/men/32.jpg',
          'type': 'profile',
          'profileType': 'visitor',
          'tags': ['IT', 'Business', 'Developer'],
          'actions': [
            {'type': 'connect', 'label': 'Connect', 'icon': 'link'},
            {
              'type': 'meet',
              'label': 'Meet',
              'icon': 'calendar_today_outlined',
            },
            {'type': 'bookmark', 'label': '', 'icon': 'bookmark_border'},
          ],
          'about' : 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
        },
        {
          'name': 'Sarah Johnson',
          'title': 'UX Designer',
          'image': 'https://randomuser.me/api/portraits/women/44.jpg',
          'type': 'profile',
          'profileType': 'visitor',
          'tags': ['Design', 'UX', 'Business'],
          'actions': [
            {'type': 'connect', 'label': 'Connect', 'icon': 'link'},
            {
              'type': 'meet',
              'label': 'Meet',
              'icon': 'calendar_today_outlined',
            },
            {'type': 'bookmark', 'label': '', 'icon': 'bookmark_border'},
          ],
          'about' : 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
        },
        {
          'name': 'Michael Chen',
          'title': 'Product Manager',
          'image': 'https://randomuser.me/api/portraits/men/36.jpg',
          'type': 'profile',
          'profileType': 'speaker',
          'tags': ['IT', 'Speaker', 'Management'],
          'actions': [
            {'type': 'message', 'label': 'Message', 'icon': 'message_outlined'},
            {
              'type': 'meet',
              'label': 'Meet',
              'icon': 'calendar_today_outlined',
            },
            {'type': 'bookmark', 'label': '', 'icon': 'bookmark_border'},
          ],
          'about' : 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
        },
       
      ];

      // Apply current filter
      //applyFilter(selectedTab.value);
      //isLoading.value = false;
    });
  }

  void applyFilter( String filter){
    selectedTab.value = filter;
    if (filter == 'About') {
      filterUsers.value = profileUsers;
    } 
    /*else if (filter == 'Session') {
      loadAgendaItems();
    }*/
  }

  @override
  void onInit() {
    super.onInit();
    loadDummyData();
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
