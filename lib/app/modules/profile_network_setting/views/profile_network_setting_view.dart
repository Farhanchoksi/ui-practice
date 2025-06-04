import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ui_project/app/modules/Meeting_Availability/controllers/meeting_availability_controller.dart';
import 'package:ui_project/app/modules/agenda_screen/views/agenda_screen_view.dart';
import 'package:ui_project/app/modules/network_privacy_setting/controllers/network_privacy_setting_controller.dart';

import '../controllers/profile_network_setting_controller.dart';

class ProfileNetworkSettingView
    extends GetView<ProfileNetworkSettingController> {
  const ProfileNetworkSettingView({super.key});
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
                        'Network Settings',
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
          Column(
            children: [
              20.verticalSpace,
              GestureDetector(
                      onTap: () {
                       Get.put(NetworkPrivacySettingController());
                        Get.toNamed('/network-privacy-setting');
                      },
                      child: Container(
                        padding: EdgeInsets.all(16).r,
                        margin: EdgeInsets.symmetric(horizontal: 16).w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: HexColor('#CBDCE6'), width: 1),
                          borderRadius: BorderRadius.circular(12).r,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           //SizedBox(width: 10),
                            Row(
                              children: [
                                Icon(
                                  Icons.edit_calendar_outlined,
                                  color: HexColor('#333F64'),
                                  size: 30,
                                ),
                           // SizedBox(width: 10),
                           10.horizontalSpace,
                                 Text(
                              'Networking Privacy Settings',
                              style: TextStyle(
                                fontSize: 16.sp,
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
                    10.verticalSpace,
              GestureDetector(
                      onTap: () {
                        Get.put(MeetingAvailabilityController());
                        Get.toNamed('/meeting-availability');
                      },
                      child: Container(
                        padding: EdgeInsets.all(16).r,
                        margin: EdgeInsets.symmetric(horizontal: 16).w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: HexColor('#CBDCE6'), width: 1),
                          borderRadius: BorderRadius.circular(12).r,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           //SizedBox(width: 10),
                            Row(
                              children: [
                                Icon(
                                  Icons.content_paste_search_outlined,
                                  color: HexColor('#333F64'),
                                  size: 30,
                                ),
                           // SizedBox(width: 10),
                           10.horizontalSpace,
                                 Text(
                              'Meeting Availability',
                              style: TextStyle(
                                fontSize: 16.sp,
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
            ],
          ),
        ],
      )
    );
  }
}
