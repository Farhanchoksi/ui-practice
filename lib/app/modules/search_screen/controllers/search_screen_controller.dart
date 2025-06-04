import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreenController extends GetxController {
  // Country list
  final List<String> countryList = ["India", "USA", "Dubai"];
  final RxString selectedCountry = "".obs;

  // Interests list
  final List<String> interestList = ["Production", "Direction", "Editing"];
  final RxList<String> selectedInterests = <String>[].obs;

  // Select country
  void selectCountry(String? value) {
    if (value != null) selectedCountry.value = value;
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

  // Text controller for search field
  final TextEditingController searchController = TextEditingController();

  // Observable variables
  final RxString searchQuery = ''.obs;
  final RxBool isLoading = false.obs;
  final RxList<Map<String, dynamic>> userList = <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> allUsers = <Map<String, dynamic>>[].obs;
  final RxString selectedFilter = 'All'.obs; // 'All', 'Profile', 'Session'

  @override
  void onInit() {
    super.onInit();
    // Load initial data
    loadDummyData();
  }

  @override
  void onClose() {
    // Dispose of the controller when not needed
    searchController.dispose();
    super.onClose();
  }

  // Load dummy data
  void loadDummyData() {
    isLoading.value = true;

    // Simulate API delay
    Future.delayed(Duration(milliseconds: 500), () {
      allUsers.value = [
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
      applyFilter(selectedFilter.value);
      isLoading.value = false;
    });
  }

  // Apply filter (All, Profile, Session)
  void applyFilter(String filter) {
    selectedFilter.value = filter;

    if (filter == 'All') {
      userList.value = List.from(allUsers);
    } else {
      userList.value =
          allUsers
              .where(
                (user) =>
                    user['type'].toString().toLowerCase() ==
                    filter.toLowerCase(),
              )
              .toList();
    }

    // If there's an active search query, apply it as well
    if (searchQuery.value.isNotEmpty) {
      searchUsers(searchQuery.value);
    }
  }

  // Search users
  void searchUsers(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      // Just apply the current filter to all users
      applyFilter(selectedFilter.value);
      return;
    }

    isLoading.value = true;

    // Filter data based on query and current filter
    Future.delayed(Duration(milliseconds: 300), () {
      List<Map<String, dynamic>> baseList = [];

      // First apply type filter
      if (selectedFilter.value == 'All') {
        baseList = List.from(allUsers);
      } else {
        baseList =
            allUsers
                .where(
                  (user) =>
                      user['type'].toString().toLowerCase() ==
                      selectedFilter.value.toLowerCase(),
                )
                .toList();
      }

      // Then apply search query filter
      final filteredList =
          baseList.where((user) {
            final name = user['name'].toString().toLowerCase();
            final title = user['title'].toString().toLowerCase();
            final searchLower = query.toLowerCase();
            return name.contains(searchLower) || title.contains(searchLower);
          }).toList();

      userList.value = filteredList;
      isLoading.value = false;
    });
  }
}
