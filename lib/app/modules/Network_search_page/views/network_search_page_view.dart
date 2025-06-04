import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../controllers/network_search_page_controller.dart';

class NetworkSearchPageView extends GetView<NetworkSearchPageController> {
  NetworkSearchPageView({super.key});

  final controller = Get.put(NetworkSearchPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            // Handle back button press
            Get.back();
          },
        ),
        title: Text('Search', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
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
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              child: Row(
                children: [
                  // Search Bar
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: HexColor('#CBDCE6')),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.08),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          suffixIcon: Icon(Icons.search, size: 30),
                          border: InputBorder.none,
                          isDense: true,

                          contentPadding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  // Filter Icon
                  Container(
                    // padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: HexColor('#CBDCE6'), width: 1),
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Get.bottomSheet(
                          Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24),
                                topRight: Radius.circular(24),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Filter",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 20),

                                // Country Dropdown
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Obx(
                                    () => DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        value:
                                            controller
                                                    .selectedCountry
                                                    .value
                                                    .isEmpty
                                                ? null
                                                : controller
                                                    .selectedCountry
                                                    .value,
                                        isExpanded: true,
                                        hint: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 12,
                                          ),
                                          child: Text("Country"),
                                        ),
                                        icon: Icon(Icons.keyboard_arrow_down),
                                        items:
                                            controller.countryList
                                                .map(
                                                  (country) => DropdownMenuItem(
                                                    value: country,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                            horizontal: 12,
                                                          ),
                                                      child: Text(country),
                                                    ),
                                                  ),
                                                )
                                                .toList(),
                                        onChanged: controller.selectCountry,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Obx(
                                    () => DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        value:
                                            controller.selectedJob.value.isEmpty
                                                ? null
                                                : controller.selectedJob.value,
                                        isExpanded: true,
                                        hint: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 12,
                                          ),
                                          child: Text("Job title"),
                                        ),
                                        icon: Icon(Icons.keyboard_arrow_down),
                                        items:
                                            controller.jobList
                                                .map(
                                                  (job) => DropdownMenuItem(
                                                    value: job,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                            horizontal: 12,
                                                          ),
                                                      child: Text(job),
                                                    ),
                                                  ),
                                                )
                                                .toList(),
                                        onChanged: controller.selectJob,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16),
                                // Interests Dropdown
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
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
                                        icon: Icon(Icons.keyboard_arrow_down),
                                        items:
                                            controller.interestList
                                                .where(
                                                  (interest) =>
                                                      !controller
                                                          .selectedInterests
                                                          .contains(interest),
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
                                        onChanged: controller.selectInterest,
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
                                                        ? HexColor('#CBDCE6')
                                                        : HexColor('#CBDCE6'),
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
                                SizedBox(height: 24),

                                // Show Results Button
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: HexColor('#333F64'),
                                      foregroundColor: Colors.white,
                                      padding: EdgeInsets.symmetric(
                                        vertical: 12,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    onPressed: () {
                                      // Apply filter logic if needed
                                      Get.back();
                                    },
                                    child: Text(
                                      "Show results",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      icon: Icon(Icons.filter_list),
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Stack(
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

                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(Icons.search, size: 150, color: HexColor('333F64')),
                      Text(
                        'No results found',
                        style: TextStyle(fontSize: 16, color: HexColor('333F64')),
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
