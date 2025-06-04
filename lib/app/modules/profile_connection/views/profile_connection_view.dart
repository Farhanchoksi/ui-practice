import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ui_project/app/modules/agenda_screen/views/agenda_screen_view.dart';

import '../controllers/profile_connection_controller.dart';

class ProfileConnectionView extends GetView<ProfileConnectionController> {
  const ProfileConnectionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Container(
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
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Centered title
                  Positioned.fill(
                    child: Center(
                      child: Text(
                        'My Bookmarks',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  // Back button (positioned on the left)
                  Positioned(
                    left: 0,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios, color: Colors.black54),
                      onPressed: () => Get.back(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: 
          Obx(() {
            return ListView.builder(
                          itemCount: controller.profileUsers.length,
                          padding: EdgeInsets.symmetric(vertical: 8),
                          itemBuilder: (context, index) {
                            final user = controller.profileUsers[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 8.0,
                              ),
                              child: _buildUserCard(user),
                            );
                          },
                        );
          },),
        
    );
  }
 Widget _buildUserCard(Map<String, dynamic> user) {

    return Container(
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
                    ),Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color:
                              Colors.blueAccent,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            'speaker',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 9,
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
                              Icons.link,
                              size: 24,
                            ),
                            label: Text(
                              'Connect',
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


