import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ui_project/app/modules/agenda_screen/views/agenda_screen_view.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});
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
                        'Edit Profile',
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
      body:  Stack(
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


          SingleChildScrollView(
            child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 100,
                                height: 120,
                                child: Stack(
                                  //fit: StackFit.loose,
                                    fit: StackFit.loose,
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 100,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: Image.network(
                                          'https://randomuser.me/api/portraits/men/32.jpg',
                                         fit: BoxFit.cover,
                                         // width: 100,
                                //height: 100,
                                        ),
                                      ),
                                    ),
                                    
                                        Positioned(
                                      bottom: 0,
                                      left: 30.w,
                                      
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                      padding: EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      color: HexColor('#CBDCE6'),
                                      ),
                                      child: Icon(Icons.edit),
                                    )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text('Full Name', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),),
                          ),
                          5.verticalSpace,
                          TextField(
                            
                            decoration: InputDecoration(
                              //label: Text('Name'),
                              contentPadding: EdgeInsets.symmetric(vertical: 02.h, horizontal: 16.w),
                              hintText: 'Ahmed Qurany',
                              focusColor: Colors.redAccent,
                              
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: HexColor('#CBDCE6')),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: HexColor('#333F64'))
                              )
                            ),
                          ),
                          10.verticalSpace,
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text('Email', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),),
                          ),
                          5.verticalSpace,
                          TextField(
                            
                            decoration: InputDecoration(
                              //label: Text('Name'),
                              contentPadding: EdgeInsets.symmetric(vertical: 02.h, horizontal: 16.w),
                              hintText: 'ahmed.qurany@gmail.com',
                              focusColor: Colors.redAccent,
                              
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: HexColor('#CBDCE6')),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: HexColor('#333F64'))
                              )
                            ),
                          ),
                          10.verticalSpace,
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text('Company Number', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),),
                          ),
                          5.verticalSpace,
                          TextField(
                            
                            decoration: InputDecoration(
                              //label: Text('Name'),
                              contentPadding: EdgeInsets.symmetric(vertical: 02.h, horizontal: 16.w),
                              hintText: '123456789',
                              focusColor: Colors.redAccent,
                              
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: HexColor('#CBDCE6')),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: HexColor('#333F64'))
                              )
                            ),
                          ),
                          10.verticalSpace,
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text('Work Title', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),),
                          ),
                          5.verticalSpace,
                          TextField(
                            
                            decoration: InputDecoration(
                              //label: Text('Name'),
                              contentPadding: EdgeInsets.symmetric(vertical: 02.h, horizontal: 16.w),
                              hintText: 'Manager',
                              focusColor: Colors.redAccent,
                              
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: HexColor('#CBDCE6')),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: HexColor('#333F64'))
                              )
                            ),
                          ),
                          10.verticalSpace,
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text('Company Name', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),),
                          ),
                          5.verticalSpace,
                          TextField(
                            
                            decoration: InputDecoration(
                              //label: Text('Name'),
                              contentPadding: EdgeInsets.symmetric(vertical: 02.h, horizontal: 16.w),
                              hintText: 'Saljini',
                              focusColor: Colors.redAccent,
                              
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: HexColor('#CBDCE6')),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: HexColor('#333F64'))
                              )
                            ),
                          ),
                          10.verticalSpace,
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text('Description', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),),
                          ),
                          5.verticalSpace,
                          TextField(
                            
                            decoration: InputDecoration(
                              //label: Text('Name'),
                              contentPadding: EdgeInsets.symmetric(vertical: 02.h, horizontal: 16.w),
                              hintText: 'About the company...',
                              focusColor: Colors.redAccent,
                              
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: HexColor('#CBDCE6')),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(color: HexColor('#333F64'))
                              )
                            ),
                          ),
                          10.verticalSpace,
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Text('Interests', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),),
                          ),
                          5.verticalSpace,
                          Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: HexColor('#CBDCE6'),
                                            ),
                                            borderRadius: BorderRadius.circular(12),
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
          
                                        Container(
                                          width:  Get.width,
                                          
                                          child: ElevatedButton(
                                                              onPressed: () {
                                                               // Get.toNamed('/otpverification');
                                                              },
                                                              style: ElevatedButton.styleFrom(
                                                                backgroundColor: HexColor('#333F64'),
                                                                foregroundColor: Colors.white,
                                                                padding: const EdgeInsets.symmetric(vertical: 16),
                                                                shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(14),
                                                                ),
                                                                
                                                              ),
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  Icon(Icons.check , size: 20),
                                                                  5.horizontalSpace,
                                                                  Text(
                                                                'Save Changes',
                                                                style: TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight: FontWeight.bold,
                                                                ),
                                                              ),
                                                                  
                                                                ],
                                                              )
                                                            ),
                                        ),
                        ],
                      ),
            ),
          ),
        ],
      ),
    );
  }
}
