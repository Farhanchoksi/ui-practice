import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ui_project/app/modules/Ahmed_profile/views/ahmed_profile_view.dart';
import 'package:ui_project/app/modules/agenda_screen/views/agenda_screen_view.dart';

import '../controllers/profile_bookmark_controller.dart';

class ProfileBookmarkView extends GetView<ProfileBookmarkController> {
  ProfileBookmarkView({super.key ,  this.userdata});
  final controller = Get.put(ProfileBookmarkController());
  final Map<String, dynamic>? userdata;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: HexColor('333F64')),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'My Bookmarks',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: HexColor('333F64'),
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          // Tab Container
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.10),
                  blurRadius: 16,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              child: Row(
                children: [
                  Obx(
                    () => Expanded(
                      child: GestureDetector(
                        onTap: () => controller.applyFilter('Profile'),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            color:
                                controller.selectedTab.value == 'Profile'
                                    ? HexColor('CBDCE6')
                                    : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color:
                                  controller.selectedTab.value == 'Profile'
                                      ? HexColor('#E6EDF5')
                                      : HexColor('CBDCE6'),
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Profile',
                              style: TextStyle(
                                color:
                                    controller.selectedTab.value == 'Profile'
                                        ? HexColor('#333F64')
                                        : Colors.grey.shade600,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Obx(
                    () => Expanded(
                      child: GestureDetector(
                        onTap: () => controller.applyFilter('Session'),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            color:
                                controller.selectedTab.value == 'Session'
                                    ? HexColor('#CBDCE6')
                                    : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color:
                                  controller.selectedTab.value == 'Session'
                                      ? HexColor('#E6EDF5')
                                      : HexColor('CBDCE6'),
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Session',
                              style: TextStyle(
                                color:
                                    controller.selectedTab.value == 'Session'
                                        ? HexColor('#333F64')
                                        : Colors.grey.shade600,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
              Positioned(
            top: -80,
            right: -60,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [HexColor('#CBDCE6'), Colors.transparent],
                  radius: 0.8,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                child: Container(color: const Color.fromARGB(221, 245, 245, 245)),
              ),
            ),
          ),

          // Second blurred ellipse (bottom-left)
          Positioned(
            top: 230,
            right: -40,
            child: Container(
              width: 450,
              height: 420,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    HexColor('#CBDCE6'),
                    const Color.fromARGB(208, 255, 255, 255),
                  ],
                  radius: 0.9,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(color: Colors.transparent),
              ),
            ),
          ),

                Obx(() {
                  if (controller.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  } else if (controller.filterUsers.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search, size: 100, color: HexColor('333F64')),
                          Text(
                            'No results found',
                            style: TextStyle(
                              fontSize: 16,
                              color: HexColor('333F64'),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (controller.selectedTab.value == 'Session') {
                    controller.loadAgendaItems();
                    return ListView.builder(
                      itemCount: controller.agendaItems.length,
                      padding: EdgeInsets.symmetric(vertical: 8),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                blurRadius: 6,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Type badge
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: HexColor('#2D3142'),
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                          child: Text(
                                            controller.agendaItems[index].type,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.access_time,
                                              size: 14,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              '20 Mar 2022 | 12:22 PM',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey[700],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                
                                    // Date and time
                
                                    // Title
                                    Text(
                                      controller.agendaItems[index].title,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: HexColor('#333F64'),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                
                                    // Speakers section
                                    Text(
                                      "Speakers",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Wrap(
                                      spacing: 4,
                                      children:
                                          controller.agendaItems[index].speakers
                                              .map((speaker) {
                                                return Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 10,
                                                      backgroundColor:
                                                          Colors.grey[300],
                                                      child: Icon(
                                                        Icons.person,
                                                        size: 12,
                                                        color: Colors.grey[700],
                                                      ),
                                                    ),
                                                    SizedBox(width: 4),
                                                    Text(
                                                      speaker.name,
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    SizedBox(width: 8),
                                                  ],
                                                );
                                              })
                                              .toList(),
                                    ),
                                    SizedBox(height: 8),
                
                                    // Venue
                                    if (controller
                                        .agendaItems[index]
                                        .venue
                                        .isNotEmpty)
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            size: 14,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            'Conference - ${controller.agendaItems[index].venue}',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey[700],
                                            ),
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                              // Bookmark button
                              Positioned(
                                // top: 8,
                                bottom: 8,
                                right: 8,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    //color: HexColor('#CBDCE6'),
                                    border: Border.all(color: HexColor('#CBDCE6')),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.bookmark,
                                      color: HexColor('#333F64'),
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      // Toggle bookmark functionality
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return ListView.builder(
                      itemCount: controller.filterUsers.length,
                      padding: EdgeInsets.symmetric(vertical: 8),
                      itemBuilder: (context, index) {
                        final user = controller.filterUsers[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          child: _buildUserCard(user),
                        );
                      },
                    );
                  }
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserCard(Map<String, dynamic> user) {
    final bool isProfile = user['type'] == 'profile';
    
    return GestureDetector(
      onTap: () {
        Get.to(AhmedProfileView(userdata: user));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // User Avatar with Speaker/Visitor badge
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundImage: NetworkImage(user['image']),
                      ),
                      if (!isProfile ||
                          (isProfile && user['profileType'] != null))
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color:
                                  !isProfile || user['profileType'] == 'speaker'
                                      ? Colors.blueAccent
                                      : Colors.amber[700],
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              !isProfile
                                  ? 'Speaker'
                                  : user['profileType'] == 'speaker'
                                  ? 'Speaker'
                                  : 'Visitor',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(width: 12),
                  // User Info
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user['name'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: HexColor('333F64'),
                        ),
                      ),
                      Text(
                        user['title'],
                        style: TextStyle(color: HexColor('333F64'), fontSize: 14),
                      ),
                      SizedBox(height: 4),
                      // Tags Row
                      Wrap(
                        spacing: 4,
                        runSpacing: 4,
                        children: [
                          // Show all tags from API data
                          if (user['tags'] != null && user['tags'] is List)
                            ...List<String>.from(user['tags']).map((tag) {
                              // Determine color based on tag
                              Color bgColor;
                              if (tag == 'IT') {
                                bgColor = Colors.grey[200]!;
                              } else if (tag == 'Business') {
                                bgColor = Colors.indigo[100]!;
                              } else if (tag == 'Developer' ||
                                  tag == 'Development') {
                                bgColor = Colors.blue[100]!;
                              } else if (tag == 'Workshop') {
                                bgColor = Colors.amber[100]!;
                              } else if (tag == 'Design' || tag == 'UX') {
                                bgColor = Colors.purple[100]!;
                              } else if (tag == 'Mobile') {
                                bgColor = Colors.teal[100]!;
                              } else if (tag == 'Management') {
                                bgColor = Colors.green[100]!;
                              } else {
                                bgColor = Colors.grey[200]!;
                              }
      
                              return _buildTag(tag, bgColor, HexColor('333F64'));
                            }).toList(),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              // Action Buttons
              Builder(
                builder: (context) {
                  // Check if user has only bookmark action
                  bool hasOnlyBookmark =
                      user['actions'] != null &&
                      user['actions'] is List &&
                      user['actions'].length == 1 &&
                      user['actions'][0]['type'] == 'bookmark';
      
                  // If only bookmark action is available, show it as a full-width button with label
                  if (hasOnlyBookmark) {
                    return Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: HexColor('#CBDCE6')),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.bookmark_border, size: 24),
                              label: Text(
                                'Bookmark',
                                style: TextStyle(
                                  fontSize: Get.size.width * 0.037,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: TextButton.styleFrom(
                                foregroundColor: HexColor('333F64'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
      
                  // Otherwise show the standard 3-button layout
                  return Row(
                    children: [
                      // First button: Connect (for visitor profiles) or Message (for speaker/session types)
                      if (user['actions'] != null &&
                          user['actions'] is List &&
                          user['actions'].any(
                            (action) =>
                                action['type'] == 'connect' ||
                                action['type'] == 'message',
                          ))
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: HexColor('#CBDCE6')),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                isProfile && user['profileType'] == 'visitor'
                                    ? Icons.link
                                    : Icons.message_outlined,
                                size: 24,
                              ),
                              label: Text(
                                isProfile && user['profileType'] == 'visitor'
                                    ? 'Connect'
                                    : 'Message',
                                style: TextStyle(
                                  fontSize: Get.size.width * 0.037,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: TextButton.styleFrom(
                                foregroundColor: HexColor('333F64'),
                              ),
                            ),
                          ),
                        ),
      
                      if (user['actions'] != null &&
                          user['actions'] is List &&
                          user['actions'].any(
                            (action) =>
                                action['type'] == 'connect' ||
                                action['type'] == 'message',
                          ))
                        SizedBox(width: 8),
      
                      // Meet Button (if available)
                      if (user['actions'] != null &&
                          user['actions'] is List &&
                          user['actions'].any(
                            (action) => action['type'] == 'meet',
                          ))
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: HexColor('#CBDCE6')),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.calendar_today_outlined, size: 24),
                              label: Text(
                                'Meet',
                                style: TextStyle(
                                  fontSize: Get.size.width * 0.037,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: TextButton.styleFrom(
                                foregroundColor: HexColor('333F64'),
                              ),
                            ),
                          ),
                        ),
      
                      if (user['actions'] != null &&
                          user['actions'] is List &&
                          user['actions'].any(
                            (action) => action['type'] == 'meet',
                          ))
                        SizedBox(width: 8),
      
                      // Bookmark Button (as icon only when other buttons are present)
                      if (user['actions'] != null &&
                          user['actions'] is List &&
                          user['actions'].any(
                            (action) => action['type'] == 'bookmark',
                          ) &&
                          !hasOnlyBookmark)
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: HexColor('#CBDCE6')),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.bookmark_border,
                              color: HexColor('333F64'),
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTag(String text, Color bgColor, Color textColor) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
