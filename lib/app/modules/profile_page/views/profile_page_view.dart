import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ui_project/app/modules/Ahmed_profile/controllers/ahmed_profile_controller.dart';
import 'package:ui_project/app/modules/Edit_profile/controllers/edit_profile_controller.dart';
import 'package:ui_project/app/modules/agenda_screen/views/agenda_screen_view.dart';
import 'package:ui_project/app/modules/profile_agenda/views/profile_agenda_view.dart';
import 'package:ui_project/app/modules/profile_bookmark/views/profile_bookmark_view.dart';
import 'package:ui_project/app/modules/profile_connection/controllers/profile_connection_controller.dart';
import 'package:ui_project/app/modules/profile_network_setting/controllers/profile_network_setting_controller.dart';

import '../controllers/profile_page_controller.dart';

class ProfilePageView extends GetView<ProfilePageController> {
  const ProfilePageView({super.key});
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
                  Positioned(
                    left: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        'My Profile',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 120,
                    child: Icon(Icons.qr_code_scanner_rounded, size: 28),
                  ),
                  Positioned(right: 80, child: Icon(Icons.search, size: 28)),
                  Positioned(
                    right: 40,
                    child: Icon(Icons.chat_outlined, size: 28),
                  ),
                  Positioned(
                    right: 0,
                    child: Icon(Icons.notifications_active_outlined, size: 28),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Stack(
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
                child: Container(
                  color: const Color.fromARGB(221, 245, 245, 245),
                ),
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
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: Get.height * 0.44,
                  child: Stack(
                    fit: StackFit.loose,
                    alignment: Alignment.topCenter,

                    children: [
                      Positioned(
                        top: 100,
                        child: Container(
                          padding: EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: HexColor('#CBDCE6')),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.10),
                                blurRadius: 16,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Image.asset(
                            'assets/images/Qr_Code.png',
                            height: Get.height * 0.25,
                          ),
                        ),
                      ),

                      Positioned(
                        left: MediaQuery.of(context).size.width * 0.33,
                        child: Container(
                          padding: EdgeInsets.all(0),
                          child: Image.asset(
                            'assets/images/image.png',
                            height: Get.height * 0.15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // SizedBox(height: Get.height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Ahmad Qurany',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: HexColor('333F64'),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    GestureDetector(
                      onTap: () {
                        Get.put(EditProfileController());
                        Get.toNamed('/edit-profile');
                      },
                      child: Icon(Icons.edit, color: HexColor('#333F64')),
                    ),
                  ],
                ),
                Center(
                  child: Text(
                    'Manager @ Sajilni',
                    style: TextStyle(
                      fontSize: 16,
                      //fontWeight: FontWeight.bold,
                      color: HexColor('333F64'),
                    ),
                  ),
                ),
                SizedBox(height: Get.height * 0.02),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: HexColor('#CBDCE6'), width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(ProfileBookmarkView());
                              },
                              child: Icon(
                                Icons.bookmark_border,
                                color: HexColor('#333F64'),
                                size: 30.sp,
                              ),
                            ),
                            Text(
                              'My Bookmarks',
                              style: TextStyle(
                                fontSize: 14.sp,
                                // fontWeight: FontWeight.bold,
                                color: HexColor('333F64'),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: Get.width * 0.05),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => ProfileAgendaView());
                          },
                          child: Column(
                            children: [
                              Icon(
                                Icons.calendar_month,
                                color: HexColor('#333F64'),
                                size: 30.sp,
                              ),
                              Text(
                                'My Agenda',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  //fontWeight: FontWeight.bold,
                                  color: HexColor('333F64'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: Get.width * 0.05),
                        GestureDetector(
                          onTap: () {
                            Get.put(ProfileConnectionController());
                            Get.toNamed('/profile-connection');
                          },
                          child: Column(
                            children: [
                              Icon(
                                Icons.person_2_outlined,
                                color: HexColor('#333F64'),
                                size: 30.sp,
                              ),
                              Text(
                                'My Connections',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  //fontWeight: FontWeight.bold,
                                  color: HexColor('333F64'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: Get.height * 0.01),
                GestureDetector(
                  onTap: () {
                    Get.put(ProfileNetworkSettingController());
                    Get.toNamed('/profile-network-setting');
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: HexColor('#CBDCE6'), width: 1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //SizedBox(width: 10),
                        Row(
                          children: [
                            Icon(
                              Icons.person_add_alt,
                              color: HexColor('#333F64'),
                              size: 30,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Networking Settings',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: HexColor('333F64'),
                              ),
                            ),
                          ],
                        ),

                        //  SizedBox(width: Get.width * 0.2),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: HexColor('#333F64'),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: Get.height * 0.01),
                GestureDetector(
                  onTap: () {
                    Get.put(AhmedProfileController());
                    Get.toNamed('/ahmed-profile');
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: HexColor('#CBDCE6'), width: 1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //SizedBox(width: 10),
                        Row(
                          children: [
                            Icon(
                              Icons.headphones_outlined,
                              color: HexColor('#333F64'),
                              size: 30,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Help & Support',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: HexColor('333F64'),
                              ),
                            ),
                          ],
                        ),
                        //  SizedBox(width: 10),

                        //  SizedBox(width: Get.width * 0.31),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: HexColor('#333F64'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
