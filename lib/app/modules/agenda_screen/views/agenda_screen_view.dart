import 'dart:ui';

import 'package:dashed_outline/dashed_outline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/agenda_screen_controller.dart';

// HexColor class for color conversion
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

class AgendaScreenView extends GetView<AgendaScreenController> {
  AgendaScreenView({super.key});

  final controller = Get.put(AgendaScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            // Handle back button press
            Get.back();
          },
        ),
        title: Row(
          //
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Agenda',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: HexColor('#333F64'),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Get.toNamed('/agenda-book-meeting');
              },
              child: Text(
                '15 March 2025',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: HexColor('#333F64'),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Icon(Icons.arrow_drop_down),
          ],
        ),

        // elevation: 0,
        //actions: [Icon(Icons.arrow_drop_down)],
      ),
      body: Column(
        children: [
          // Top container with search and hall selection
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.10),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Search field
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      //horizontal: 5.0,
                      vertical: 3.0,
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
                              //controller: controller.searchController,
                              //onChanged: (value) => controller.searchUsers(value),
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
                            border: Border.all(
                              color: HexColor('#CBDCE6'),
                              width: 1,
                            ),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
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
                                                child: Text("Session Type"),
                                              ),
                                              icon: Icon(
                                                Icons.keyboard_arrow_down,
                                              ),
                                              items:
                                                  controller.countryList
                                                      .map(
                                                        (
                                                          country,
                                                        ) => DropdownMenuItem(
                                                          value: country,
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.symmetric(
                                                                  horizontal:
                                                                      12,
                                                                ),
                                                            child: Text(
                                                              country,
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                      .toList(),
                                              onChanged:
                                                  controller.selectCountry,
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
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
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
                                                                  horizontal:
                                                                      12,
                                                                ),
                                                            child: Text(
                                                              interest,
                                                            ),
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
                                                          interest ==
                                                                  "Production"
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
                                      SizedBox(height: 24),

                                      // Show Results Button
                                      SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: HexColor(
                                              '#333F64',
                                            ),
                                            foregroundColor: Colors.white,
                                            padding: EdgeInsets.symmetric(
                                              vertical: 12,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
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
                  SizedBox(height: Get.height * 0.015),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: HexColor('#CBDCE6')),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Obx(
                      () => DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value:
                              controller.selectedCountry.value.isEmpty
                                  ? null
                                  : controller.selectedCountry.value,
                          isExpanded: true,
                          hint: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text("Select Hall"),
                          ),
                          icon: Icon(Icons.keyboard_arrow_down),
                          items:
                              controller.countryList
                                  .map(
                                    (country) => DropdownMenuItem(
                                      value: country,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
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
                ],
              ),
            ),
          ),

          // Agenda items list
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
                      child: Container(
                        color: const Color.fromARGB(221, 245, 245, 245),
                      ),
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
                  final items = controller.agendaItems;

                  if (items.isEmpty) {
                    return Center(child: Text("No agenda items found"));
                  }

                  return ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];

                      // Free time item has a different layout
                      if (item.title == "Free Time") {
                        return Padding(
                          padding: const EdgeInsets.only(
                            top: 8.0,
                            bottom: 8.0,
                            right: 16,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Time column (outside container)
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 20.0,
                                  top: 8.0,
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      item.time,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      item.period,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 16),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 16),
                                //padding: EdgeInsets.all(4), // Optional
                                // Or any background color if needed
                                child: Dash(
                                  direction: Axis.vertical,
                                  length: 50,
                                  dashLength: 5,
                                  dashGap: 3,
                                  dashColor: Color(0xFF333F64),
                                  dashThickness: 1,
                                ),
                              ),

                              //  SizedBox(width: Get.width * 0.08),
                              // Content container
                              Expanded(
                                child: DashedOutline(
                                  borderType: BorderType.rRect,
                                  radius: 12,
                                  dashPattern: [5, 5],
                                  color: HexColor('#333F64'),
                                  strokeWidth: 1,
                                  child: Container(
                                    //  margin: EdgeInsets.only(right: 16),
                                    padding: EdgeInsets.symmetric(
                                      vertical: 16,
                                      horizontal: 16,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          blurRadius: 6,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        item.title,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: HexColor('#333F64'),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }

                      // Regular agenda item
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed('/agenda-talk-detail');
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Time column (outside container)
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 20.0,
                                  top: 8.0,
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      item.time,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      item.period,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 16),
                              Container(
                                height: Get.height * 0.35,
                                width: 1,
                                color: HexColor('#333F64'),
                                margin: EdgeInsets.symmetric(horizontal: 16),
                              ),
                              // Content container
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(right: 16),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        blurRadius: 6,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Type badge
                                            if (item.type.isNotEmpty)
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 8,
                                                  vertical: 4,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: HexColor('#2D3142'),
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                child: Text(
                                                  item.type,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            SizedBox(height: 8),
                                            // Title
                                            Text(
                                              item.title,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: HexColor('#333F64'),
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            // Description
                                            if (item.description.isNotEmpty)
                                              Text(
                                                item.description,
                                                style: TextStyle(
                                                  color: HexColor('#333F64'),
                                                  fontSize: 14,
                                                ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            SizedBox(height: 8),
                                            // Speakers
                                            if (item.speakers.isNotEmpty) ...[
                                              Text(
                                                "Speakers",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: HexColor('#333F64'),
                                                ),
                                              ),
                                              SizedBox(height: 8),
                                              Wrap(
                                                spacing: 8,
                                                runSpacing: 8,
                                                children:
                                                    item.speakers.map((
                                                      speaker,
                                                    ) {
                                                      return Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          CircleAvatar(
                                                            radius: 10,
                                                            backgroundColor:
                                                                Colors
                                                                    .grey[300],
                                                            child: Icon(
                                                              Icons.person,
                                                              size: 12,
                                                              color:
                                                                  Colors
                                                                      .grey[700],
                                                            ),
                                                          ),
                                                          SizedBox(width: 4),
                                                          Text(
                                                            speaker.name,
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              color: HexColor(
                                                                '#333F64',
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    }).toList(),
                                              ),
                                            ],
                                            SizedBox(height: 8),
                                            // Tags
                                            if (item.tags.isNotEmpty)
                                              Wrap(
                                                spacing: 4,
                                                runSpacing: 4,
                                                children:
                                                    item.tags.map((tag) {
                                                      return Container(
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              horizontal: 8,
                                                              vertical: 4,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          color:
                                                              tag == "Business"
                                                                  ? Colors
                                                                      .grey[200]
                                                                  : tag ==
                                                                      "Development"
                                                                  ? HexColor(
                                                                    '#CBDCE6',
                                                                  )
                                                                  : tag ==
                                                                      "Tags"
                                                                  ? Colors
                                                                      .blue[200]
                                                                  : Colors
                                                                      .grey[200],
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                4,
                                                              ),
                                                        ),
                                                        child: Text(
                                                          tag,
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color:
                                                                tag ==
                                                                            "Business" ||
                                                                        tag ==
                                                                            "Development"
                                                                    ? HexColor(
                                                                      '#333F64',
                                                                    )
                                                                    : HexColor(
                                                                      '#333F64',
                                                                    ),
                                                          ),
                                                        ),
                                                      );
                                                    }).toList(),
                                              ),
                                            // Venue
                                            if (item.venue.isNotEmpty) ...[
                                              SizedBox(height: 8),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_on_outlined,
                                                    size: 14,
                                                    color: Colors.grey[600],
                                                  ),
                                                  SizedBox(width: 4),
                                                  Text(
                                                    item.venue,
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: HexColor(
                                                        '#333F64',
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ],
                                        ),
                                      ),
                                      // Bookmark button
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: IconButton(
                                          icon: Icon(
                                            item.isBookmarked
                                                ? Icons.bookmark
                                                : Icons.bookmark_border,
                                            color:
                                                item.isBookmarked
                                                    ? Colors.indigo[800]
                                                    : Colors.grey,
                                            size: 20,
                                          ),
                                          onPressed:
                                              () => controller.toggleBookmark(
                                                index,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
