import 'package:get/get.dart';

class AgendaItem {
  // final String time;
  //final String period;
  final String type;
  final String title;
  //final String description;
  final List<Speaker> speakers;
  //final List<String> tags;
  final String venue;
  //final bool isBookmarked;

  AgendaItem({
    // required this.time,
    // required this.period,
    required this.type,
    required this.title,
    // required this.description,
    required this.speakers,
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

class ProfileBookmarkController extends GetxController {
  final RxList<Map<String, dynamic>> profileUsers =
      <Map<String, dynamic>>[].obs;
  final RxBool isLoading = false.obs;
  final RxString selectedTab = 'Profile'.obs;
  final RxList<Map<String, dynamic>> filterUsers = <Map<String, dynamic>>[].obs;
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
          'about' : 'partners store and access personal data, like browsing data or unique identifiers, on your device. Selecting I Accept enables tracking technologies to support the purposes shown under we and our partners process data to provide.'
        },
        {
          'name': 'Ahmad Qurany',
          'title': 'Software Engineer',
          'image': 'https://randomuser.me/api/portraits/men/41.jpg',
          'type': 'profile',
          'profileType': 'speaker',
          'tags': ['IT', 'Speaker', 'Engineer'],
          'actions': [
            //  {'type': 'message', 'label': 'Message', 'icon': 'message_outlined'},
            //  {'type': 'meet', 'label': 'Meet', 'icon': 'calendar_today_outlined'},
            {'type': 'bookmark', 'label': '', 'icon': 'bookmark_border'},
          ],
          'about' : 'partners store and access personal data, like browsing data or unique identifiers, on your device. Selecting I Accept enables tracking technologies to support the purposes shown under we and our partners process data to provide.'
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
          'about' : 'partners store and access personal data, like browsing data or unique identifiers, on your device. Selecting I Accept enables tracking technologies to support the purposes shown under we and our partners process data to provide.'
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
          'about' : 'partners store and access personal data, like browsing data or unique identifiers, on your device. Selecting I Accept enables tracking technologies to support the purposes shown under we and our partners process data to provide.'
        },
        {
          'name': 'Flutter Development',
          'title': 'Technical Discussion',
          'image': 'https://randomuser.me/api/portraits/men/22.jpg',
          'type': 'session',
          'tags': ['IT', 'Development', 'Mobile'],
          'actions': [
            {'type': 'message', 'label': 'Message', 'icon': 'message_outlined'},
            {
              'type': 'meet',
              'label': 'Meet',
              'icon': 'calendar_today_outlined',
            },
            {'type': 'bookmark', 'label': '', 'icon': 'bookmark_border'},
          ],
          'about' : 'partners store and access personal data, like browsing data or unique identifiers, on your device. Selecting I Accept enables tracking technologies to support the purposes shown under we and our partners process data to provide.'
        },
        {
          'name': 'UI/UX Workshop',
          'title': 'Design Session',
          'image': 'https://randomuser.me/api/portraits/women/22.jpg',
          'type': 'session',
          'tags': ['Design', 'Workshop', 'UX'],
          'actions': [
            /* {'type': 'message', 'label': 'Message', 'icon': 'message_outlined'},
            {
              'type': 'meet',
              'label': 'Meet',
              'icon': 'calendar_today_outlined',
            }, */
            {'type': 'bookmark', 'label': '', 'icon': 'bookmark_border'},
          ],
          'about' : 'partners store and access personal data, like browsing data or unique identifiers, on your device. Selecting I Accept enables tracking technologies to support the purposes shown under we and our partners process data to provide.'
        },
      ];

      // Apply current filter
      applyFilter(selectedTab.value);
      isLoading.value = false;
    });
  }

  void applyFilter(String filter) {
    selectedTab.value = filter;
    if (filter == 'Profile') {
      filterUsers.value = profileUsers;
    } else if (filter == 'Session') {
      loadAgendaItems();
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadDummyData();
    // applyFilter(selectedTab.value);
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
