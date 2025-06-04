import 'package:get/get.dart';

class ProfileConnectionController extends GetxController {
  //TODO: Implement ProfileConnectionController
final RxBool isLoading = false.obs;
final RxList<Map<String, dynamic>> profileUsers =
      <Map<String, dynamic>>[].obs;

  void loadDummyData() {
    isLoading.value = true;

    // Simulate API delay
    Future.delayed(Duration(milliseconds: 50), () {
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
        },
      ];

      // Apply current filter
      //applyFilter(selectedTab.value);
     // isLoading.value = false;
    });
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
