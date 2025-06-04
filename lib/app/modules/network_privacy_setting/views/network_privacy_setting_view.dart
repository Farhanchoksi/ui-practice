import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ui_project/app/modules/agenda_screen/views/agenda_screen_view.dart';

import '../controllers/network_privacy_setting_controller.dart';

// Custom circle checkbox widget
class _CircleCheckbox extends StatelessWidget {
  final bool isChecked;
  const _CircleCheckbox({Key? key, required this.isChecked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isChecked ? HexColor('#333F64') : Colors.grey.shade400,
          width: 2,
        ),
        color: Colors.white,
      ),
      child: isChecked
          ? Center(
              child: Icon(
                Icons.check,
                size: 16,
                
                color: HexColor('#333F64'),
              ),
            )
          : null,
    );
  }
}

class NetworkPrivacySettingView extends GetView<NetworkPrivacySettingController> {
  const NetworkPrivacySettingView({super.key});
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
          Obx(() {
            return Column(
              children: [
                50.verticalSpace,
                Container(
                  //  padding: EdgeInsets.all(8).r,
                  margin: EdgeInsets.symmetric(horizontal: 16).w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        controller.selectedborder.value == 1
                            ? Border.all(color: HexColor('#333F64'), width: 1)
                            : Border.all(color: HexColor('#CBDCE6'), width: 1),
                    borderRadius: BorderRadius.circular(12).r,
                  ),
                  child: ListTile(
                    leading: _CircleCheckbox(isChecked: controller.selectedcheckbox.value == 1),
                    title: Text("Public", style: TextStyle(color: HexColor('#333F64'), fontSize: 16.sp, fontWeight: FontWeight.bold)),
                    subtitle: Text(
                      "Anyone can connect, send message and request meeting with you",
                    ),
                    onTap: () {
                      controller.onCheckboxChange(1, true);
                    },
                  ),
                ),
                10.verticalSpace,
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16).w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        controller.selectedborder.value == 2
                            ? Border.all(color: HexColor('#333F64'), width: 1)
                            : Border.all(color: HexColor('#CBDCE6'), width: 1),
                    borderRadius: BorderRadius.circular(12).r,
                  ),
                  child: ListTile(
                    leading: _CircleCheckbox(isChecked: controller.selectedcheckbox.value == 2),
                    title: Text("By Request", style: TextStyle(color: HexColor('#333F64'), fontSize: 16.sp, fontWeight: FontWeight.bold)),
                    subtitle: Text(
                      "No one can connect, send message and request meeting with you unless he requested to connect with you",
                    ),
                    onTap: () {
                      controller.onCheckboxChange(2, true);
                    },
                  ),
                ),
                10.verticalSpace,
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16).w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        controller.selectedborder.value == 2
                            ? Border.all(color: HexColor('#333F64'), width: 1)
                            : Border.all(color: HexColor('#CBDCE6'), width: 1),
                    borderRadius: BorderRadius.circular(12).r,
                  ),
                  child: ListTile(
                    leading: _CircleCheckbox(isChecked: controller.selectedcheckbox.value == 3),
                    title: Text("Private", style: TextStyle(color: HexColor('#333F64'), fontSize: 16.sp, fontWeight: FontWeight.bold)),
                    subtitle: Text(
                      "No one can connect, send message and request meeting with you",
                    ),
                    onTap: () {
                      controller.onCheckboxChange(3, true);
                    },
                  ),
                ),
                
              ],
            );
          }),
        ],
      ),
    );
  }
}
