import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ui_project/app/modules/splash_screen/controllers/splash_screen_controller.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final controller = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // White background
          Container(color: Colors.white),

          // Blurred circular shape (top-right)
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
                filter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
                child: Container(color: Colors.transparent),
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
                    const Color.fromARGB(0, 230, 230, 230),
                  ],
                  radius: 0.9,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                child: Container(color: Colors.transparent),
              ),
            ),
          ),
          Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                Image.asset(
                  'assets/images/Logo.png',
                  width: 210,
                  height: 210,
                  fit: BoxFit.contain,
                ),

                //  const Spacer(), // Pushes everything up
              ],
            ),
          ),
        ],
      ),
    );
  }
}
