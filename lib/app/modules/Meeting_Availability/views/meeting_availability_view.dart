import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import 'package:table_calendar/table_calendar.dart';
import 'package:ui_project/app/modules/agenda_screen/views/agenda_screen_view.dart';





class MeetingAvailabilityView extends StatefulWidget {
  const MeetingAvailabilityView({super.key});

  @override
  State<MeetingAvailabilityView> createState() => _MeetingAvailabilityViewState();
}

class _MeetingAvailabilityViewState extends State<MeetingAvailabilityView> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  String? _selectedTime;
  //final TextEditingController _reasonController = TextEditingController();


  final List<String> _times = [
    '15 minutes',
    '30 minutes',
  
  ];

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
                        'Meeting Availability',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
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
          SingleChildScrollView(
            
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                15.verticalSpace,
                Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: HexColor('#CBDCE6'), width: 1),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.07),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TableCalendar(
                        firstDay: DateTime.utc(2020, 1, 1),
                        lastDay: DateTime.utc(2030, 12, 31),
                        focusedDay: _focusedDay,
          
                        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                        onDaySelected: (selectedDay, focusedDay) {
                          setState(() {
                            _selectedDay = selectedDay;
                            _focusedDay = focusedDay;
                          });
                        },
                        calendarFormat: CalendarFormat.month,
                        headerStyle: HeaderStyle(
                          formatButtonVisible: false,
                          titleCentered: true,
                          titleTextStyle: TextStyle(
                            color: HexColor('#333F64'),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          leftChevronIcon: Icon(Icons.chevron_left, color: HexColor('#333F64')),
                          rightChevronIcon: Icon(Icons.chevron_right, color: HexColor('#333F64')),
                        ),
                        daysOfWeekStyle: const DaysOfWeekStyle(
                          weekdayStyle: TextStyle(color: Color(0xFFB0B6C3)),
                          weekendStyle: TextStyle(color: Color(0xFFB0B6C3)),
          
                        ),
                        calendarStyle: CalendarStyle(
                          selectedTextStyle: TextStyle(
                            color: HexColor('#333F64')
                          ),
                          todayDecoration: BoxDecoration(
                            color: HexColor('333F64'),
                            borderRadius: BorderRadius.circular(8),
                            shape: BoxShape.rectangle,
                          ),
                          selectedDecoration: BoxDecoration(
                           // color: Colors.white,
          
                            border: Border.all(color: HexColor('#CBDCE6')),
                            borderRadius: BorderRadius.circular(8),
                            shape: BoxShape.rectangle,
                          ),
                          markerDecoration: BoxDecoration(
                            color: const Color(0xFF333F64),
                            borderRadius: BorderRadius.circular(8),
                            shape: BoxShape.rectangle,
                          ),
                          outsideDecoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                            shape: BoxShape.rectangle,
                          ),
                          disabledDecoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                            shape: BoxShape.rectangle,
                          ),
                          withinRangeDecoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                            shape: BoxShape.rectangle,
                          ),
                          rangeStartDecoration: BoxDecoration(
                            color: const Color(0xFF333F64),
                            borderRadius: BorderRadius.circular(8),
                            shape: BoxShape.rectangle,
                          ),
                          rangeEndDecoration: BoxDecoration(
                            color: const Color(0xFF333F64),
                            borderRadius: BorderRadius.circular(8),
                            shape: BoxShape.rectangle,
                          ),
                          holidayDecoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                            shape: BoxShape.rectangle,
                          ),
                          weekendDecoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                            shape: BoxShape.rectangle,
                          ),
                          defaultDecoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                            shape: BoxShape.rectangle,
                          ),
                        ),
                      ),
                    ),
                        20.verticalSpace,
                       Padding(
                      padding: EdgeInsets.only(left: 4, bottom: 4),
                      child: Text(
                        'Slot time',
                        style: TextStyle(
                          color: Color(0xFF333F64),
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                    DropdownButtonFormField<String>(
                      value: _selectedTime,
                      icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Color(0xFF333F64)),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.access_time, color: Color(0xFF333F64)),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Color(0xFFE6EDF5)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Color(0xFF333F64)),
                        ),
                      ),
                      hint: const Text('Select Slot', style: TextStyle(color: Color(0xFF333F64))),
                      items: _times.map((time) => DropdownMenuItem(
                        value: time,
                        child: Text(time),
                      )).toList(),
                      onChanged: (val) => setState(() => _selectedTime = val),
                    ),
                    18.verticalSpace,
                    Row(
                      children: [
                        // From
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('From', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp, color: Color(0xFF333F64))),
                              SizedBox(height: 6),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Color(0xFFE6EDF5)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('9:00', style: TextStyle(fontSize: 15, color: Color(0xFF333F64))),
                                    //SizedBox(width: 24.w),
                                    Container(
                                      
                                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF6F7F9),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Text('GMT+3', style: TextStyle(fontSize: 12, color: Color(0xFFB0B6C3))),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                       10.horizontalSpace,
                        // To
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('To', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp, color: Color(0xFF333F64))),
                              SizedBox(height: 6),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Color(0xFFE6EDF5)),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('18:00', style: TextStyle(fontSize: 15, color: Color(0xFF333F64))),
                                    //SizedBox(width: 24.w),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF6F7F9),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Text('GMT+3', style: TextStyle(fontSize: 12, color: Color(0xFFB0B6C3))),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        10.horizontalSpace,
                        // Slots
                        Padding(
                          padding: const EdgeInsets.only(top: 24.0),
                          child: Text(
                            '18 Slots',
                            style: TextStyle(
                              color: Color(0xFFB0B6C3),
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                    60.verticalSpace,
                     SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF333F64),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                        ),
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
                                            Text('Your Request Sent Successfully',
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
                        child: const Text(
                          'Request meeting',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
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