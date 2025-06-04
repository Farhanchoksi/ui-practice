import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


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
      appBar: AppBar(
        title: const Text('MeetingAvailabilityView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                   const Padding(
                  padding: EdgeInsets.only(left: 4, bottom: 4),
                  child: Text(
                    'Slot time',
                    style: TextStyle(
                      color: Color(0xFF333F64),
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
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
                SizedBox(height: 18),
                Row(
                  children: [
                    // From
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('From', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: Color(0xFF333F64))),
                          SizedBox(height: 6),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Color(0xFFE6EDF5)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('9:00', style: TextStyle(fontSize: 15, color: Color(0xFF333F64))),
                                SizedBox(width: 8),
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
                    SizedBox(width: 18),
                    // To
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('To', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: Color(0xFF333F64))),
                          SizedBox(height: 6),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Color(0xFFE6EDF5)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('18:00', style: TextStyle(fontSize: 15, color: Color(0xFF333F64))),
                                SizedBox(width: 8),
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
                    SizedBox(width: 14),
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
          ],
        ),
      ),
    );
  }
}