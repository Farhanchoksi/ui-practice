import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_project/app/modules/search_screen/controllers/search_screen_controller.dart';
import 'package:ui_project/app/modules/search_screen/views/search_screen_view.dart';
import 'package:ui_project/app/screen/Aboutscreen.dart';
import 'package:ui_project/app/screen/Agendascreen.dart';
import 'package:ui_project/app/screen/Speakerscreen.dart';

import '../modules/agenda_screen/views/agenda_screen_view.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final List Events = [
    {
      'image':
          'https://as2.ftcdn.net/v2/jpg/03/84/55/29/1000_F_384552930_zPoe9zgmCF7qgt8fqSedcyJ6C6Ye3dFs.jpg',
      'name': 'About',
      'routes': () => Get.to(() => Aboutscreen()),
    },
    {
      'image':
          'https://media.istockphoto.com/id/2162214185/photo/modern-business-interior-with-desks-and-pc-computers-in-row-window-mockup-wall.jpg?s=1024x1024&w=is&k=20&c=8kb2LkeHjyB8cDRUtWMfDoYKY529NMhNOt1PhCbmiUA=',
      'name': 'Speakers',
      'routes': () => Get.to(() => Speakerscreen()),
    },
    {
      'image':
          'https://media.istockphoto.com/id/2154829060/photo/office-meeting-room-interior-with-table-and-panoramic-window-mock-up-frame.jpg?s=1024x1024&w=is&k=20&c=17iHIU4NFwOBR4UjUhy8khbOkq6nt1G7tU0g6eUZhdA=',
      'name': 'Agenda ',
      'routes': () => Get.to(() => Agendascreen()),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // actionsPadding: EdgeInsets.all(20),
        backgroundColor: Colors.white,
        title: Image.asset('assets/images/Logo.png', height: Get.height * 0.06),
        
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.qr_code_scanner_rounded, size: 28),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                // Initialize the controller before navigation
                Get.lazyPut(() => SearchScreenController());
                Get.to(() => const SearchScreenView());
              },
              child: Icon(Icons.search, size: 28),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.chat_outlined, size: 28),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.notifications_active_outlined, size: 28),
          ),
        ],
      ),
      body: Stack(
        children: [
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
              children: [
                //  SizedBox(height: 16),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: const Color.fromARGB(255, 85, 104, 113),
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ListTile(
                          title: Text(
                            'July`s Event',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 85, 104, 113),
                            ),
                          ),
                          subtitle: Text(
                            '21 Jul - 22 Jul 2025',
                            style: TextStyle(
                              fontSize: 14,
                              color: const Color.fromARGB(255, 85, 104, 113),
                            ),
                          ),
                          trailing: Icon(
                            Icons.location_on_outlined,
                            color: const Color.fromARGB(255, 85, 104, 113),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: Events.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Events[index]['routes']();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: NetworkImage(Events[index]['image']),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              // alignment: Alignment.bottomCenter,
                              child: Container(
                                width: Get.width,
                                padding: EdgeInsets.symmetric(
                                  vertical: 4,
                                  horizontal: 6,
                                ),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Colors.black.withOpacity(0.6),
                                      Colors.transparent,
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    Events[index]['name'],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
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
