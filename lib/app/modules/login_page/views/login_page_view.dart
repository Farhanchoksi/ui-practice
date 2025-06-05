import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({super.key});

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
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

          // Background gradient
          
          // Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ListView(
                children: [
                  SizedBox(height: Get.height * 0.09),
                  // Logo and title
                  Image.asset(
                    'assets/images/Logo.png',
                    height: Get.height * 0.09,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.09),
                  // const SizedBox(height: 80),
                  // Email field label
                  const Text(
                    'Enter your email',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  // Email input field
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: Colors.black,
                        ),
                        hintText: 'Email',
                        hintStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.03),
                  // Next button
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/otpverification');
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
                  SizedBox(height: Get.height * 0.3),
                  // Not registered text and sign up button
                  Center(
                    child: const Text(
                      'Not Registered?',
                      style: TextStyle(
                        color: Color.fromARGB(255, 122, 121, 121),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  TextButton(
                    onPressed: () {
                      Get.offNamed('/signup-page');
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 26,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                          color: const Color.fromARGB(255, 198, 198, 198),
                        ),
                      ),
                    ),
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        color: HexColor('#2D3A66'),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.03),
                  // Contact support button
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
                          fontSize: 16
                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
