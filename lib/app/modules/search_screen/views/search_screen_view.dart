import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import '../controllers/search_screen_controller.dart';

class SearchScreenView extends GetView<SearchScreenController> {
  const SearchScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
        title: Text('Search', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Container(
            width: 1.sw,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24.r),
                bottomRight: Radius.circular(24.r),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.10),
                  blurRadius: 16,
                  offset: Offset(10, 10),
                ),
              ],
            ),
            child: Column(
              children: [
                // Search Bar with Filter Button
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12.0,
                  ).r,
                  child: Row(
                    children: [
                      // Search Bar
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: HexColor('#CBDCE6')),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.08),
                                blurRadius: 8,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: TextField(
                            controller: controller.searchController,
                            onChanged: (value) => controller.searchUsers(value),
                            decoration: InputDecoration(
                              hintText: 'Abdulrahman',
                              suffixIcon: Icon(Icons.search, size: 30),
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      // Filter Icon
                      Container(
                        // padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: HexColor('#CBDCE6'),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: IconButton(
                          onPressed: () {
                            Get.bottomSheet(
                              Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(24),
                                    topRight: Radius.circular(24),
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Filter",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 20),

                                    // Country Dropdown
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey.shade300,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Obx(
                                        () => DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            value:
                                                controller
                                                        .selectedCountry
                                                        .value
                                                        .isEmpty
                                                    ? null
                                                    : controller
                                                        .selectedCountry
                                                        .value,
                                            isExpanded: true,
                                            hint: Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 12,
                                              ),
                                              child: Text("Country"),
                                            ),
                                            icon: Icon(
                                              Icons.keyboard_arrow_down,
                                            ),
                                            items:
                                                controller.countryList
                                                    .map(
                                                      (
                                                        country,
                                                      ) => DropdownMenuItem(
                                                        value: country,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.symmetric(
                                                                horizontal: 12,
                                                              ),
                                                          child: Text(country),
                                                        ),
                                                      ),
                                                    )
                                                    .toList(),
                                            onChanged: controller.selectCountry,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 16),

                                    // Interests Dropdown
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey.shade300,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Obx(
                                        () => DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            value: null,
                                            isExpanded: true,
                                            hint: Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 12,
                                              ),
                                              child: Text("Interests"),
                                            ),
                                            icon: Icon(
                                              Icons.keyboard_arrow_down,
                                            ),
                                            items:
                                                controller.interestList
                                                    .where(
                                                      (interest) =>
                                                          !controller
                                                              .selectedInterests
                                                              .contains(
                                                                interest,
                                                              ),
                                                    )
                                                    .map(
                                                      (
                                                        interest,
                                                      ) => DropdownMenuItem(
                                                        value: interest,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.symmetric(
                                                                horizontal: 12,
                                                              ),
                                                          child: Text(interest),
                                                        ),
                                                      ),
                                                    )
                                                    .toList(),
                                            onChanged:
                                                controller.selectInterest,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 16),

                                    // Selected Interests Chips
                                    Obx(
                                      () => Wrap(
                                        spacing: 8,
                                        runSpacing: 8,
                                        children:
                                            controller.selectedInterests
                                                .map(
                                                  (interest) => Chip(
                                                    label: Text(interest),
                                                    backgroundColor:
                                                        interest == "Production"
                                                            ? const Color.fromARGB(
                                                              255,
                                                              238,
                                                              217,
                                                              184,
                                                            )
                                                            : interest ==
                                                                "Direction"
                                                            ? HexColor(
                                                              '#CBDCE6',
                                                            )
                                                            : HexColor(
                                                              '#CBDCE6',
                                                            ),
                                                    deleteIcon: Icon(
                                                      Icons.close,
                                                      size: 18,
                                                    ),
                                                    onDeleted:
                                                        () => controller
                                                            .removeInterest(
                                                              interest,
                                                            ),
                                                    labelPadding:
                                                        EdgeInsets.symmetric(
                                                          horizontal: 4,
                                                        ),
                                                  ),
                                                )
                                                .toList(),
                                      ),
                                    ),
                                    SizedBox(height: 24),

                                    // Show Results Button
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: HexColor('#333F64'),
                                          foregroundColor: Colors.white,
                                          padding: EdgeInsets.symmetric(
                                            vertical: 12,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          // Apply filter logic if needed
                                          Get.back();
                                        },
                                        child: Text(
                                          "Show results",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          icon: Icon(Icons.filter_list),
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ),

                // Filter Tabs
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    // right: 16.0,
                    bottom: 16.0,
                  ),
                  child: Row(
                    children: [
                      Obx(
                        () => Flexible(
                          child: GestureDetector(
                            onTap: () => controller.applyFilter('All'),
                            child: Container(
                              width: 50,
                              padding: EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    controller.selectedFilter.value == 'All'
                                        ? HexColor('CBDCE6')
                                        : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color:
                                      controller.selectedFilter.value == 'All'
                                          ? HexColor('#E6EDF5')
                                          : HexColor('CBDCE6'),
                                  width: 1,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'All',
                                  style: TextStyle(
                                    color:
                                        controller.selectedFilter.value == 'All'
                                            ? HexColor('#333F64')
                                            : Colors.grey.shade600,
                                    fontWeight:
                                        controller.selectedFilter.value == 'All'
                                            ? FontWeight.bold
                                            : FontWeight.normal,
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
                          flex: 2,
                          child: GestureDetector(
                            onTap: () => controller.applyFilter('Profile'),
                            child: Container(
                              //width: 80,
                              padding: EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    controller.selectedFilter.value == 'Profile'
                                        ? HexColor('CBDCE6')
                                        : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color:
                                      controller.selectedFilter.value ==
                                              'Profile'
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
                                        controller.selectedFilter.value ==
                                                'Profile'
                                            ? HexColor('#333F64')
                                            : Colors.grey.shade600,
                                    fontWeight:
                                        controller.selectedFilter.value ==
                                                'Profile'
                                            ? FontWeight.bold
                                            : FontWeight.normal,
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
                          flex: 2,
                          child: GestureDetector(
                            onTap: () => controller.applyFilter('Session'),
                            child: Container(
                              // width: 80,
                              padding: EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    controller.selectedFilter.value == 'Session'
                                        ? HexColor('#CBDCE6')
                                        : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color:
                                      controller.selectedFilter.value ==
                                              'Session'
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
                                        controller.selectedFilter.value ==
                                                'Session'
                                            ? HexColor('#333F64')
                                            : Colors.grey.shade600,
                                    fontWeight:
                                        controller.selectedFilter.value ==
                                                'Session'
                                            ? FontWeight.bold
                                            : FontWeight.normal,
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
              ],
            ),
          ),

          // Results List
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
                  } else if (controller.userList.isEmpty) {
                    return Center(child: Text('No results found'));
                  } else {
                    return ListView.builder(
                      itemCount: controller.userList.length,
                      padding: EdgeInsets.symmetric(vertical: 8),
                      itemBuilder: (context, index) {
                        final user = controller.userList[index];
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
                      radius: 24.r,
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
                // SizedBox(width: 12),
                12.horizontalSpace,
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
                    // SizedBox(height: 4),
                    4.verticalSpace,
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
    );
  }

  Widget _buildTag(String text, Color bgColor, Color textColor) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
