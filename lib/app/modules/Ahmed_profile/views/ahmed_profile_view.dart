import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
//import 'package:http/http.dart';
import 'package:ui_project/app/modules/agenda_screen/views/agenda_screen_view.dart';

import '../controllers/ahmed_profile_controller.dart';

class AhmedProfileView extends GetView<AhmedProfileController> {
   AhmedProfileView({super.key ,  this.userdata});
  final Map<String, dynamic>? userdata;
  final controller = Get.put(AhmedProfileController());
  
  @override
  Widget build(BuildContext context) {
   // final hasabout = userdata!['about'] != null && userdata!['about'].isNotEmpty;
   // final hassession = userdata!['session'] != null && userdata!['session'].isNotEmpty;


    if (userdata == null) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AhmedProfileView'),
        centerTitle: true,
      ),
      body: Center(child: Text('No user data!')),
    );
  }
    
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
                        'Profile',
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
        
           Stack(
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
               Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 80,
                          height: 90,
                          child: Stack(
                            //fit: StackFit.loose,
                              fit: StackFit.loose,
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(14),
                                  child: Image.network(
                                    userdata!['image'],
                                   fit: BoxFit.cover,
                                   // width: 100,
                          //height: 100,
                                  ),
                                ),
                              ),
                              
                                  Positioned(
                                bottom: 0,
                                left: 15.w,
                                
                                child: Container(
                                padding: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                color: Colors.orange.shade300,
                                ),
                                child: Text(userdata!['profileType'] ?? 'unknow', style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold), ),
                              )),
                            ],
                          ),
                        ),
                        10.horizontalSpace,
                    
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(userdata!['name'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: HexColor('#333F64')),),
                        Text(userdata!['title'], style: TextStyle(fontSize: 14, color: HexColor('#333F64')),),
                        Icon(Icons.abc_sharp)
                          ],
                        )
                    
                      ],
                    ),
                    10.verticalSpace,
                     Wrap(
                            spacing: 4,
                            runSpacing: 4,
                            children: [
                              // Show all tags from API data
                              if (userdata!['tags'] != null && userdata!['tags'] is List)
                                ...List<String>.from(userdata!['tags']).map((tag) {
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
                                20.verticalSpace,
                            ],
                          ),
               
                          10.verticalSpace,
                          Builder(
                    builder: (context) {
                      // Check if user has only bookmark action
                      bool hasOnlyBookmark =
                          userdata!['actions'] != null &&
                          userdata!['actions'] is List &&
                          userdata!['actions'].length == 1 &&
                          userdata!['actions'][0]['type'] == 'bookmark';
                     
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
                          if (userdata!['actions'] != null &&
                              userdata!['actions'] is List &&
                              userdata!['actions'].any(
                                (action) =>
                                    action['type'] == 'connect' ||
                                    action['type'] == 'message',
                              ))
                            Expanded(
                              child: Container(
                               // padding: EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: HexColor('#CBDCE6')),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: TextButton.icon(
                                  onPressed: () {},
                                  icon: Icon(
                                    userdata!['profileType'] == 'visitor'
                                        ? Icons.link
                                        : Icons.message_outlined,
                                    size: 24,
                                  ),
                                  label: Text(
                                    userdata!['profileType'] == 'visitor'
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
                     
                          if (userdata!['actions'] != null &&
                              userdata!['actions'] is List &&
                              userdata!['actions'].any(
                                (action) =>
                                    action['type'] == 'connect' ||
                                    action['type'] == 'message',
                              ))
                            SizedBox(width: 8.w),
                     
                          // Meet Button (if available)
                          if (userdata!['actions'] != null &&
                              userdata!['actions'] is List &&
                              userdata!['actions'].any(
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
                     
                          if (userdata!['actions'] != null &&
                              userdata!['actions'] is List &&
                              userdata!['actions'].any(
                                (action) => action['type'] == 'meet',
                              ))
                            SizedBox(width: 8.w),
                     
                          // Bookmark Button (as icon only when other buttons are present)
                          if (userdata!['actions'] != null &&
                              userdata!['actions'] is List &&
                              userdata!['actions'].any(
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
                  10.verticalSpace,
                  Divider(
                    color: HexColor('#CBDCE6'),
                    thickness: 1,
                  ),
                 // 10.verticalSpace,
               
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0.w,
                      vertical: 12.0.h,
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
                                      controller.selectedTab.value == 'About'
                                          ? HexColor('CBDCE6')
                                          : Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color:
                                        controller.selectedTab.value == 'About'
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
                                          controller.selectedTab.value == 'About'
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
               
               
                  Obx(
                    () {
                      if(controller.selectedTab.value == 'About') {
                  return Container(
                    padding: const EdgeInsets.all(18.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.10),
                          blurRadius: 16,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),  
               
                    child: Column(
                      
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('About ${userdata!['name']}',
                        style: TextStyle(
                          fontSize: 16.sp ,
                          color: HexColor('#333F64'),
                          fontWeight: FontWeight.bold,
                        ),),
                        Text(userdata!['about'] ?? 'No about info' , style: TextStyle(
                          color: HexColor('#333F64'),
                          
                        ),)
                        
                      ],
                    ),
               
                    ); }
               
                    else if(controller.selectedTab.value == 'Session') {
                      controller.loadAgendaItems();
                        return Expanded(
                          child: ListView.builder(
                            itemCount: controller.agendaItems.length,
                           // padding: EdgeInsets.symmetric(vertical: 8),
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
                                          Divider(
                                            color: HexColor('#CBDCE6'),
                                          ),
                                          
                                          Wrap(
                            spacing: 4,
                            runSpacing: 4,
                            children: [
                              // Show all tags from API data
                              if (userdata!['tags'] != null && userdata!['tags'] is List)
                                ...List<String>.from(userdata!['tags']).map((tag) {
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
                                20.verticalSpace,
                            ],
                          ),
                                        5.verticalSpace,
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
                          ),
                        );
                      
                    } else {
                      return Container();
                    }
                    },
                  )
               
                  
               
               
               
                  ],
                ),
                         ),
             ],
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


