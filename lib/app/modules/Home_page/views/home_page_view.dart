import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ui_project/app/modules/Network_page/views/network_page_view.dart';
import 'package:ui_project/app/modules/agenda_screen/views/agenda_screen_view.dart';
import 'package:ui_project/app/modules/profile_page/views/profile_page_view.dart';
import 'package:ui_project/app/screen/Homescreen.dart';
import '../controllers/home_page_controller.dart';
import 'custom_bottom_nav_bar.dart';

class HomePageView extends GetView<HomePageController> {
  HomePageView({super.key});

  final List<Widget> screens = [
    Homescreen(),
    NetworkPageView(),
    AgendaScreenView(),
    ProfilePageView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: screens[controller.selectedIndex.value],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            // borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.only(bottom: 27, left: 20, right: 20),
          child: CustomBottomNavBar(
            selectedIndex: controller.selectedIndex.value,
            onItemTapped: (index) {
              controller.selectedIndex.value = index;
            },
          ),
        ),
        //extendBody: true,
      );
    });
  }
}
