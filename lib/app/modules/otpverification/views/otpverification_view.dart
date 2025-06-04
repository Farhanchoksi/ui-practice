import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pinput/pinput.dart';

import '../controllers/otpverification_controller.dart';

class OtpverificationView extends GetView<OtpverificationController> {
  final TextEditingController pinController = TextEditingController();
  final FocusNode pinFocusNode = FocusNode();

  OtpverificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ListView(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // const SizedBox(height: 48),
                  // Bilingual Heading
                  SizedBox(height: Get.height * 0.08),
                  Image.asset(
                    'assets/images/Logo.png',
                    height: Get.height * 0.09,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.09),
                  // Confirm OTP
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'Confirm OTP',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  // OTP Input using Pinput
                  Pinput(
                    preFilledWidget: Text(
                      '0',
                      style: TextStyle(color: Colors.grey, fontSize: 22),
                    ),
                    length: 4,
                    controller: pinController,
                    focusNode: pinFocusNode,
                    defaultPinTheme: PinTheme(
                      width: Get.width * 0.21,
                      height: 60,
                      textStyle: const TextStyle(fontSize: 22),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    focusedPinTheme: PinTheme(
                      width: Get.width * 0.21,
                      height: 60,
                      textStyle: const TextStyle(fontSize: 22),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: HexColor('#333F64')),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    submittedPinTheme: PinTheme(
                      width: Get.width * 0.21,
                      height: 60,
                      textStyle: const TextStyle(fontSize: 22),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onCompleted: (pin) {
                      // Handle completed pin
                      print('OTP Entered: $pin');
                    },
                    onChanged: (value) {
                      // Update controller if needed
                    },
                    crossAxisAlignment: CrossAxisAlignment.center,
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: true,
                    cursor: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 9),
                          width: 22,
                          height: 1,
                          color: HexColor('#333F64'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  // Info text
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: const [
                        Icon(Icons.info_outline, size: 18, color: Colors.grey),
                        SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            'we sent code to mail@company.com',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  // Next button
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/event-page');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: HexColor('#333F64'),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  // Didn't receive it?
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Didn't receive it? ",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                      Obx(() {
                        return controller.seconds.value == 0
                            ? Container(
                              width: 90,
                              height: 40,
                              // padding: EdgeInsets.all(0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: HexColor('#CBDCE6'),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: InkWell(
                                onTap: () {
                                  controller.starttimer();
                                  Get.bottomSheet(
                                    BottomSheet(
                                      onClosing: () {
                                        Get.back();
                                      },
                                      builder: (context) {
                                        return Container(
                                          height: Get.height * 0.3,
                                          width: Get.width,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons
                                                    .check_circle_outline_outlined,
                                                size: 110,
                                                color: HexColor('#333F64'),
                                              ),
                                              Text(
                                                'OTP has been send successfully',
                                                style: TextStyle(
                                                  color: HexColor('#333F64'),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 19,
                                                ),
                                              ),
                                              Text(
                                                'Check your email inbox and spam folder',
                                                style: TextStyle(
                                                  color: HexColor('#333F64'),
                                                  //fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                                child: Center(
                                  child: Text(
                                    'Resend',
                                    style: TextStyle(
                                      color: HexColor('#333F64'),
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            )
                            : Text('${controller.seconds.value} seconds..');
                      }),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.3),
                  // Contact Support
                  Center(
                    child: TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.headset_mic_outlined,
                        color: HexColor('#2D3A66'),
                      ),
                      label: Text(
                        'Contact Support',
                        style: TextStyle(
                          color: HexColor('#2D3A66'),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
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
