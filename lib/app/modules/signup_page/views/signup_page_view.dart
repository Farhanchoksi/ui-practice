import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../controllers/signup_page_controller.dart';

class SignupPageView extends GetView<SignupPageController> {
  const SignupPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Image.asset(
              'assets/images/Logo.png',
              height: 50,
              width: 50,
              alignment: Alignment.topLeft,
            ),
              SizedBox(height: Get.height * 0.03),
             Text(
                      'Sign Up Form',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold , color: HexColor('#333F64')),
                    ),
              SizedBox(height: Get.height * 0.03),
            CustomTextField(hinttext: 'First name', icon: Icons.person, keyboardType: TextInputType.name),
            SizedBox(height: Get.height * 0.03),
            CustomTextField(hinttext: 'Last name', icon: Icons.person, keyboardType: TextInputType.name),
            SizedBox(height: Get.height * 0.03),
            CustomTextField(hinttext: 'Email', icon: Icons.email, keyboardType: TextInputType.name),
            SizedBox(height: Get.height * 0.03),
            CustomTextField(hinttext: 'Mobile Number', icon: Icons.phone, keyboardType: TextInputType.name),
            SizedBox(height: Get.height * 0.03),
            CustomTextField(hinttext: 'Company Name', icon: Icons.cabin, keyboardType: TextInputType.name),
            SizedBox(height: Get.height * 0.03),
            CustomTextField(hinttext: 'Position', icon: Icons.person_pin_circle_outlined, keyboardType: TextInputType.name),
            SizedBox(height: Get.height * 0.06),
            ElevatedButton(
                      onPressed: () {
                        Get.bottomSheet(BottomSheet(onClosing: () {
                              Get.back();
                            },  builder: (context) {
                              return Container(
                                height: Get.height * 0.3,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.check_circle_outline_outlined , size: 110, color: HexColor('#333F64'),),
                                    Text('Your sign up form has been submitted successfully',
                                    style: TextStyle(
                                      color: HexColor('#333F64'),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19
                                    ),
                                    ),
                                    
                                  ],
                                ),
                              );
                            },));
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
        
                SizedBox(height: Get.height * 0.03),
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
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.hinttext,
    required this.icon,
    required this.keyboardType,
    this.controller,
    Key? key,
  }) : super(key: key);

  final String hinttext;
  final IconData icon;
  final TextEditingController? controller;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hinttext,
        prefixIcon: Icon(icon),
        hintStyle: TextStyle(color: Colors.grey),
        prefixIconColor: HexColor('#333F64'),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey,width: 3),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: HexColor('#333F64'), width: 3)
        ),
      ),
    );
  }
}
