import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import '../controllers/profile_agenda_controller.dart';




class ProfileAgendaView extends StatefulWidget {
  const ProfileAgendaView({super.key});

  @override
  State<ProfileAgendaView> createState() => _ProfileAgendaViewState();
}

class _ProfileAgendaViewState extends State<ProfileAgendaView> {
     final controller = Get.put(ProfileAgendaController());
  
  final List<String> _meetingTimes = [
    '1:00 PM - 1:30 PM',
    '2:00 PM - 2:30 PM',
    '3:00 PM - 3:30 PM',
  ];
  final List<String> _Times = [
    '1:00 PM - 1:30 PM',
    '2:00 PM - 2:30 PM',
    '3:00 PM - 3:30 PM',
  ];
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: HexColor('333F64')),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'My Agenda',
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
           padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                 Obx(() => Expanded(
                   child: DropdownButtonFormField<String>(
                     isExpanded: true,
                     value: controller.selectedTimeSlot.value.isEmpty ? null : controller.selectedTimeSlot.value,
                     icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Color(0xFF333F64)),
                     decoration: InputDecoration(
                      // prefixIcon: const Icon(Icons.access_time, color: Color(0xFF333F64)),
                       filled: true,
                       fillColor: Colors.white,
                       contentPadding:  EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                       enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10.r),
                         borderSide: const BorderSide(color: Color(0xFFE6EDF5)),
                       ),
                       focusedBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10.r),
                         borderSide: const BorderSide(color: Color(0xFF333F64)),
                       ),
                     ),
                     hint: const Text('Meeting Type', style: TextStyle(color: Color(0xFF333F64),fontSize: 14)),
                     items: _meetingTimes.map((time) => DropdownMenuItem(
                       value: time,
                       child: Text(time),
                     )).toList(),
                     onChanged: (val) {
                       if (val != null) {
                         controller.selectedTimeSlot.value = val;
                       }
                     },
                   ),
                 )),
                  10.horizontalSpace,

                Obx(() => Expanded(
                  child: DropdownButtonFormField<String>(
                    isExpanded: true,
                    value: controller.selectedTimeSlot.value.isEmpty ? null : controller.selectedTimeSlot.value,
                    icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Color(0xFF333F64)),
                    decoration: InputDecoration(
                     // prefixIcon: const Icon(Icons.access_time, color: Color(0xFF333F64)),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:  EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: const BorderSide(color: Color(0xFFE6EDF5)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Color(0xFF333F64)),
                      ),
                    ),
                    hint: const Text('Select Date', style: TextStyle(color: Color(0xFF333F64),fontSize: 14)),
                    items: _Times.map((time) => DropdownMenuItem(
                      value: time,
                      child: Text(time),
                    )).toList(),
                    onChanged: (val) {
                      if (val != null) {
                        controller.selectedTimeSlot.value = val;
                      }
                    },
                  ),
                )),

              ],
            )
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
                  controller.loadAgendaItems();
                  final items = controller.agendaItems;
                
                  if (items.isEmpty) {
                    return Center(child: Text("No agenda items found"));
                  }
                
                  return ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                
                      // Regular agenda item
                      return GestureDetector(
                  onTap: () {
                    Get.toNamed('/agenda-talk-detail');
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Time column (outside container)
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, top: 8.0),
                            child: Column(
                              children: [
                                Text(
                                  item.time,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  item.period,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 16),
                          // Divider that will match the height of the container
                          Container(
                            width: 1,
                            color: HexColor('#333F64'),
                            margin: EdgeInsets.symmetric(horizontal: 16),
                          ),
                          // Content container
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(right: 16),
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
                                        if (item.type.isNotEmpty)
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 8,
                                                  vertical: 4,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: item.type == "Talk"
                                                      ? HexColor('#2D3142')
                                                      : Colors.blue,
                                                  borderRadius: BorderRadius.circular(4),
                                                ),
                                                child: Text(
                                                  item.type,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 8),
                                              item.status == 'Pending'
                                              ? Container(
                                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                                decoration: BoxDecoration(
                                                  //color: Colors.purple.withOpacity(0.1),
                                                  borderRadius: BorderRadius.circular(4),
                                                ),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Icon(Icons.pending_actions_outlined, color: Colors.purple, size: 14),
                                                    SizedBox(width: 4),
                                                    Text(
                                                      'Pending',
                                                      style: TextStyle(
                                                      //  color: Colors.purple,
                                                        fontSize: 12,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ) : Container(),
                
                                            ],
                                          ),
                                        SizedBox(height: 8),
                                        // Title
                                        Text(
                                          item.title,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: HexColor('#333F64'),
                                          ),
                                        ),
                                        SizedBox(height: 4),
                                        // Description
                                        if (item.description.isNotEmpty)
                                          Text(
                                            item.description,
                                            style: TextStyle(
                                              color: HexColor('#333F64'),
                                              fontSize: 14,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        SizedBox(height: 8),
                                        // Speakers
                                        if (item.speakers.isNotEmpty) ...[
                                          Text(
                                            "Speakers",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: HexColor('#333F64'),
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Wrap(
                                            spacing: 8,
                                            runSpacing: 8,
                                            children: item.speakers.map((speaker) {
                                              return Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  CircleAvatar(
                                                    radius: 10,
                                                    backgroundColor: Colors.grey[300],
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
                                                      color: HexColor('#333F64'),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            }).toList(),
                                          ),
                                        ],
                                        // Venue
                                        if (item.venue.isNotEmpty) ...[
                                          SizedBox(height: 8),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.location_on_outlined,
                                                size: 14,
                                                color: Colors.grey[600],
                                              ),
                                              SizedBox(width: 4),
                                              Text(
                                                item.venue,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: HexColor('#333F64'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ],
                                    ),
                                  ),
                                  // Bookmark button
                                  Positioned(
                                    bottom: 8,
                                    right: 8,
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
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
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
                          },
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