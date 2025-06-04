import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_project/app/modules/agenda_screen/views/agenda_screen_view.dart';
import '../controllers/agenda_talk_detail_controller.dart';

class AgendaTalkDetailView extends GetView<AgendaTalkDetailController> {
  AgendaTalkDetailView({super.key});

  // Helper method to build tag widgets
  Widget _buildTag(String text, String bgColor, String textColor) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: HexColor(bgColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 12, color: HexColor(textColor)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Initialize controller and load agenda items
    final controller = Get.put(AgendaTalkDetailController());
    controller.loadAgendaItems();

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
          'Talk Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: HexColor('333F64'),
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark_border, color: HexColor('333F64')),
            onPressed: () {
              // Toggle bookmark functionality
            },
          ),
        ],
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
                        onTap: () => controller.applyFilter('About'),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            color:
                                controller.selectedtab == 'About'
                                    ? HexColor('CBDCE6')
                                    : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color:
                                  controller.selectedtab == 'About'
                                      ? HexColor('#E6EDF5')
                                      : HexColor('CBDCE6'),
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'About',
                              style: TextStyle(
                                color:
                                    controller.selectedtab == 'About'
                                        ? HexColor('#333F64')
                                        : Colors.grey.shade600,
                                fontWeight:
                                    FontWeight.bold,
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
                        onTap: () => controller.applyFilter('Speakers'),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            color:
                                controller.selectedtab == 'Speakers'
                                    ? HexColor('#CBDCE6')
                                    : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color:
                                  controller.selectedtab == 'Speakers'
                                      ? HexColor('#E6EDF5')
                                      : HexColor('CBDCE6'),
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Speakers',
                              style: TextStyle(
                                color:
                                    controller.selectedtab == 'Speakers'
                                        ? HexColor('#333F64')
                                        : Colors.grey.shade600,
                                fontWeight:
                                  FontWeight.bold,
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

          // Content Area
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
                  if (controller.filterAgendaItem.isEmpty) {
                    return Center(child: Text('No data available'));
                  }
                
                  // Get the first item as shown in the screenshot
                  final item = controller.filterAgendaItem[0];
                
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Combined title and description section (only shown in About tab)
                          if (controller.selectedtab == 'About') ...[
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.title,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: HexColor('#333F64'),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.access_time,
                                        size: 16,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        '${item.time} ${item.period}',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        size: 16,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        item.venue,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: Get.height * 0.01),
                
                                  Divider(color: Colors.grey, thickness: 1),
                                  SizedBox(height: Get.height * 0.01),
                                  // Talk description
                                  Text(
                                    'Talk Description',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: HexColor('#333F64'),
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  Text(
                                    'At HealthHub Solutions, we believe in the power of community and connection to transform lives. Our mission is to create innovative solutions that make health and wellness accessible to everyone. SnagFit Connect is our latest endeavor, designed to empower individuals on their fitness journeys by fostering a supportive and engaging community. Join us in building a healthier and more connected world, one workout at a time.',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[700],
                                      height: 1.5,
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  // Tags
                                  Wrap(
                                    spacing: 8,
                                    runSpacing: 8,
                                    children:
                                        item.tags.asMap().entries.map((entry) {
                                          final index = entry.key;
                                          final tag = entry.value;
                
                                          // Define different colors for tags
                                          final List<Map<String, String>>
                                          tagColors = [
                                            {
                                              'bg': '#E6EDF5',
                                              'text': '#333F64',
                                            }, // Blue
                                            {
                                              'bg': '#FFE9E9',
                                              'text': '#D85A5A',
                                            }, // Red
                                            {
                                              'bg': '#E9F7EF',
                                              'text': '#27AE60',
                                            }, // Green
                                            {
                                              'bg': '#FFF4E6',
                                              'text': '#F39C12',
                                            }, // Orange
                                            {
                                              'bg': '#F4ECF7',
                                              'text': '#8E44AD',
                                            }, // Purple
                                            {
                                              'bg': '#EAECEE',
                                              'text': '#566573',
                                            }, // Gray
                                          ];
                
                                          // Use modulo to cycle through colors
                                          final colorIndex =
                                              index % tagColors.length;
                                          final bgColor =
                                              tagColors[colorIndex]['bg']!;
                
                                          return Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 4,
                                            ),
                                            decoration: BoxDecoration(
                                              color: HexColor(bgColor),
                                              borderRadius: BorderRadius.circular(
                                                12,
                                              ),
                                            ),
                                            child: Text(
                                              tag,
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: HexColor('#333F64'),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                  ),
                                ],
                              ),
                            ),
                
                            SizedBox(height: 16),
                          ],
                
                          // Speakers section
                          if (controller.selectedtab == 'Speakers' &&
                              item.speakers.isNotEmpty) ...[
                            // Special Guest section
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8.0,
                                    bottom: 8.0,
                                  ),
                                  child: Text(
                                    'Special Guest',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: HexColor('#333F64'),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        blurRadius: 4,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      if (item.speakers.isNotEmpty) ...[
                                        Row(
                                          children: [
                                            // Profile image
                                            item.speakers[0].image != null
                                                ? CircleAvatar(
                                                  radius: 24,
                                                  backgroundImage: NetworkImage(
                                                    item.speakers[0].image!,
                                                  ),
                                                )
                                                : CircleAvatar(
                                                  radius: 24,
                                                  backgroundColor: HexColor(
                                                    '#E6EDF5',
                                                  ),
                                                  child: Text(
                                                    item.speakers[0].name.substring(
                                                      0,
                                                      1,
                                                    ),
                                                    style: TextStyle(
                                                      color: HexColor('#333F64'),
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                            SizedBox(width: 16),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    item.speakers[0].name,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold,
                                                      color: HexColor('#333F64'),
                                                    ),
                                                  ),
                                                  SizedBox(height: 4),
                                                  Text(
                                                    item.speakers[0].role,
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.grey[600],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 12),
                                        // Tags
                                        Wrap(
                                          spacing: 8,
                                          runSpacing: 8,
                                          children: [
                                            _buildTag(
                                              'Speaker',
                                              '#FFE9E9',
                                              '#333F64',
                                            ),
                                            _buildTag(
                                              'Business',
                                              '#E6EDF5',
                                              '#333F64',
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 16),
                                        // Action buttons
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: HexColor('#CBDCE6'),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: TextButton.icon(
                                                  onPressed: () {},
                                                  icon: Icon(Icons.link, size: 24),
                                                  label: Text(
                                                    'Connect',
                                                    style: TextStyle(
                                                      fontSize:
                                                          Get.size.width * 0.037,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  style: TextButton.styleFrom(
                                                    foregroundColor: HexColor(
                                                      '333F64',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 12),
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: HexColor('#CBDCE6'),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: TextButton.icon(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.calendar_today_outlined,
                                                    size: 24,
                                                  ),
                                                  label: Text(
                                                    'Meet',
                                                    style: TextStyle(
                                                      fontSize:
                                                          Get.size.width * 0.037,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  style: TextButton.styleFrom(
                                                    foregroundColor: HexColor(
                                                      '333F64',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                              ],
                            ),
                
                            SizedBox(height: 16),
                
                            // Host section
                            if (item.speakers.length > 1) ...[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 8.0,
                                      bottom: 8.0,
                                    ),
                                    child: Text(
                                      'Host',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: HexColor('#333F64'),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          blurRadius: 4,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            // Profile image
                                            item.speakers[1].image != null
                                                ? CircleAvatar(
                                                  radius: 24,
                                                  backgroundImage: NetworkImage(
                                                    item.speakers[1].image!,
                                                  ),
                                                )
                                                : CircleAvatar(
                                                  radius: 24,
                                                  backgroundColor: HexColor(
                                                    '#E6EDF5',
                                                  ),
                                                  child: Text(
                                                    item.speakers[1].name.substring(
                                                      0,
                                                      1,
                                                    ),
                                                    style: TextStyle(
                                                      color: HexColor('#333F64'),
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                            SizedBox(width: 16),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    item.speakers[1].name,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold,
                                                      color: HexColor('#333F64'),
                                                    ),
                                                  ),
                                                  SizedBox(height: 4),
                                                  Text(
                                                    item.speakers[1].role,
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.grey[600],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 12),
                                        // Tags
                                        Wrap(
                                          spacing: 8,
                                          runSpacing: 8,
                                          children: [
                                            _buildTag(
                                              'Speaker',
                                              '#FFE9E9',
                                              '#333F64',
                                            ),
                                            _buildTag(
                                              'Business',
                                              '#E6EDF5',
                                              '#333F64',
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 16),
                                        // Action buttons
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: HexColor('#CBDCE6'),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: TextButton.icon(
                                                  onPressed: () {},
                                                  icon: Icon(Icons.link, size: 24),
                                                  label: Text(
                                                    'Connect',
                                                    style: TextStyle(
                                                      fontSize:
                                                          Get.size.width * 0.037,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  style: TextButton.styleFrom(
                                                    foregroundColor: HexColor(
                                                      '333F64',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 12),
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: HexColor('#CBDCE6'),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: TextButton.icon(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.calendar_today_outlined,
                                                    size: 24,
                                                  ),
                                                  label: Text(
                                                    'Meet',
                                                    style: TextStyle(
                                                      fontSize:
                                                          Get.size.width * 0.037,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  style: TextButton.styleFrom(
                                                    foregroundColor: HexColor(
                                                      '333F64',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 12),
                                             Container(
                                              decoration: BoxDecoration(
                                                // color: HexColor('#E6EDF5'),
                                                border: Border.all(
                                                  color: HexColor('#CBDCE6'),
                                                ),
                                                borderRadius: BorderRadius.circular(
                                                  8,
                                                ),
                                              ),
                                              child: IconButton(
                                                icon: Icon(
                                                  Icons.bookmark_border,
                                                  color: HexColor('#333F64'),
                                                ),
                                                onPressed: () {},
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                
                            SizedBox(height: 16),
                
                            // Speakers section
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8.0,
                                    bottom: 8.0,
                                  ),
                                  child: Text(
                                    'Speakers',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: HexColor('#333F64'),
                                    ),
                                  ),
                                ),
                                if (item.speakers.length > 0) ...[
                                  Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          blurRadius: 4,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            // Profile image
                                            item.speakers[0].image != null
                                                ? CircleAvatar(
                                                  radius: 24,
                                                  backgroundImage: NetworkImage(
                                                    item.speakers[0].image!,
                                                  ),
                                                )
                                                : CircleAvatar(
                                                  radius: 24,
                                                  backgroundColor: HexColor(
                                                    '#E6EDF5',
                                                  ),
                                                  child: Text(
                                                    item.speakers[0].name.substring(
                                                      0,
                                                      1,
                                                    ),
                                                    style: TextStyle(
                                                      color: HexColor('#333F64'),
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                            SizedBox(width: 16),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    item.speakers[0].name,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold,
                                                      color: HexColor('#333F64'),
                                                    ),
                                                  ),
                                                  SizedBox(height: 4),
                                                  Text(
                                                    item.speakers[0].role,
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.grey[600],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 12),
                                        // Tags
                                        Wrap(
                                          spacing: 8,
                                          runSpacing: 8,
                                          children: [
                                            _buildTag(
                                              'Speaker',
                                              '#FFE9E9',
                                              '#333F64',
                                            ),
                                            _buildTag(
                                              'Business',
                                              '#E6EDF5',
                                              '#333F64',
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 16),
                                        // Action buttons
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: HexColor('#CBDCE6'),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: TextButton.icon(
                                                  onPressed: () {},
                                                  icon: Icon(Icons.link, size: 24),
                                                  label: Text(
                                                    'Connect',
                                                    style: TextStyle(
                                                      fontSize:
                                                          Get.size.width * 0.037,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  style: TextButton.styleFrom(
                                                    foregroundColor: HexColor(
                                                      '333F64',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 12),
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: HexColor('#CBDCE6'),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: TextButton.icon(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.calendar_today_outlined,
                                                    size: 24,
                                                  ),
                                                  label: Text(
                                                    'Meet',
                                                    style: TextStyle(
                                                      fontSize:
                                                          Get.size.width * 0.037,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  style: TextButton.styleFrom(
                                                    foregroundColor: HexColor(
                                                      '333F64',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 12),
                                            Container(
                                              decoration: BoxDecoration(
                                                // color: HexColor('#E6EDF5'),
                                                border: Border.all(
                                                  color: HexColor('#CBDCE6'),
                                                ),
                                                borderRadius: BorderRadius.circular(
                                                  8,
                                                ),
                                              ),
                                              child: IconButton(
                                                icon: Icon(
                                                  Icons.bookmark_border,
                                                  color: HexColor('#333F64'),
                                                ),
                                                onPressed: () {},
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ],
                        ],
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
