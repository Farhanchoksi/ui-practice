
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';


import '../controllers/event_page_controller.dart';

class EventPageView extends GetView<EventPageController> {
  const EventPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
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
              padding: const EdgeInsets.all(29),
              child: ListView(
                children: [
                  SizedBox(height: Get.height * 0.09),
                  Image.asset(
                    'assets/images/Logo.png',
                    height: Get.height * 0.09,
                  ),
                  SizedBox(height: Get.height * 0.06),
                  EventCard(
                    date: ('April 9'),
                    title: ('April`s Event'),
                    isActive: false,
                  ),
                  SizedBox(height: Get.height * 0.03),
                  EventCard(
                    date: ('July 21'),
                    title: ('July`s Event'),
                    isActive: true,
                  ),
                   SizedBox(height: Get.height * 0.45),
                  
                  TextButton.icon(
                    
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String date;
  final String title;
  final bool isActive;

  const EventCard({
    Key? key,
    required this.date,
    required this.title,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              date.split(' ')[0],
              style: TextStyle(
                fontSize: 16,
                color: isActive ? HexColor('#333F64') : Colors.blueGrey,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              date.split(' ')[1],
              style: TextStyle(
                fontSize: 14,
                color: isActive ? HexColor('#333F64') : Colors.blueGrey,
              ),
            ),
          ],
        ),
        // SizedBox(width: 1),
        Container(
          height: 45,
          width: 1,
          color: HexColor('#333F64'),
          margin: EdgeInsets.symmetric(horizontal: 16),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              Get.offAllNamed('/home-page');
            },
            child: 
           Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(12),
              border:
                  isActive
                      ? Border.all(color: HexColor('CBDCE6'), width: 1)
                      : Border.all(color: Colors.grey.shade300, width: 1),
            ),
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isActive ? HexColor('#333F64') : Colors.blueGrey,
                fontSize: 16,
              ),
            ),
          ),
        ),
        ),
      ],
    );
  }
}
