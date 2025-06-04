import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class Speakerscreen extends StatefulWidget {
  const Speakerscreen({super.key});

  @override
  State<Speakerscreen> createState() => _SpeakerscreenState();
}

class _SpeakerscreenState extends State<Speakerscreen> {
  // Use a Set to store bookmarked speaker indices (can be replaced with IDs from API in future)
  Set<int> bookmarkedSpeakers = {};
  final List<Map<String, dynamic>> speakers = [
    {
      'name': 'Abdelrahman Eid',
      'title': 'CTO @ PalPay',
      'image': 'https://randomuser.me/api/portraits/men/32.jpg',
      'tags': ['IT', 'Speaker'],
      'actions': ['message', 'meet', 'bookmark'],
    },
    {
      'name': 'Ahmad Qurany',
      'title': 'CTO @ PalPay',
      'image': 'https://randomuser.me/api/portraits/men/41.jpg',
      'tags': ['IT', 'Speaker', 'Business'],
      'actions': ['bookmark'],
    },
    {
      'name': 'Abdelrahman Eid',
      'title': 'CTO @ PalPay',
      'image': 'https://randomuser.me/api/portraits/men/32.jpg',
      'tags': ['IT', 'Speaker', 'Business'],
      'actions': ['message', 'meet', 'bookmark'],
    },
    {
      'name': 'Ola Ahmad',
      'title': 'CTO @ PalPay',
      'image': 'https://randomuser.me/api/portraits/women/44.jpg',
      'tags': ['IT', 'Speaker', 'Business'],
      'actions': ['message', 'meet', 'bookmark'],
    },
  ];

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
        title: Text('Speakers', style: TextStyle(fontWeight: FontWeight.bold)),
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
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: HexColor('#CBDCE6'), width: 1),
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Icon(
                      Icons.filter_alt_outlined,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: speakers.length,
              itemBuilder: (context, index) {
                final speaker = speakers[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 24,
                                    backgroundImage: NetworkImage(
                                      speaker['image'],
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      padding: EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        color: Colors.blueAccent,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Text(
                                        'Speaker',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 8,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    speaker['name'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: HexColor('333F64'),
                                    ),
                                  ),
                                  Text(
                                    speaker['title'],
                                    style: TextStyle(
                                      color: HexColor('333F64'),
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Row(
                                    children: [
                                      for (final tag in speaker['tags'])
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            right: 4.0,
                                          ),
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 2,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  tag == 'IT'
                                                      ? Colors.grey[200]
                                                      : tag == 'Speaker'
                                                      ? Colors.orange.shade100
                                                      : Colors.indigo[100],
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: Text(
                                              tag,
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: HexColor('333F64'),
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              if (speaker['actions'].contains('message'))
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: HexColor('#CBDCE6'),
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: TextButton.icon(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.message_outlined,
                                        size: 24,
                                      ),
                                      label: Text(
                                        'Message',
                                        style: TextStyle(
                                          fontSize: Get.size.width * 0.037,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      style: TextButton.styleFrom(
                                        foregroundColor: HexColor('333F64'),
                                      ),
                                    ),
                                  ),
                                ),
                              if (speaker['actions'].contains('message'))
                                SizedBox(width: 8),
                              if (speaker['actions'].contains('meet'))
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: HexColor('#CBDCE6'),
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: TextButton.icon(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.calendar_today_outlined,
                                        size: 24,
                                      ),
                                      label: Text(
                                        'Meet',
                                        style: TextStyle(
                                          fontSize: Get.size.width * 0.037,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      style: TextButton.styleFrom(
                                        foregroundColor: HexColor('333F64'),
                                      ),
                                    ),
                                  ),
                                ),
                              if (speaker['actions'].contains('meet'))
                                SizedBox(width: 8),
                              if (speaker['actions'].contains('bookmark'))
                                (speaker['actions'].length == 1 &&
                                        speaker['actions'][0] == 'bookmark')
                                    ? Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: HexColor('#CBDCE6'),
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: TextButton.icon(
                                          icon:
                                              bookmarkedSpeakers.contains(index)
                                                  ? Icon(
                                                    Icons.bookmark,
                                                    size: 24,
                                                    color: HexColor('333F64'),
                                                  )
                                                  : Icon(
                                                    Icons.bookmark_border,
                                                    size: 24,
                                                    color: HexColor('333F64'),
                                                  ),
                                          label: Text(
                                            'Bookmark',
                                            style: TextStyle(
                                              fontSize: Get.size.width * 0.037,
                                              fontWeight: FontWeight.bold,
                                              color: HexColor('333F64'),
                                            ),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              if (bookmarkedSpeakers.contains(
                                                index,
                                              )) {
                                                bookmarkedSpeakers.remove(
                                                  index,
                                                );
                                              } else {
                                                bookmarkedSpeakers.add(index);
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    )
                                    : Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: HexColor('#CBDCE6'),
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: IconButton(
                                        icon:
                                            bookmarkedSpeakers.contains(index)
                                                ? Icon(
                                                  Icons.bookmark,
                                                  size: 24,
                                                  color: HexColor('333F64'),
                                                )
                                                : Icon(
                                                  Icons.bookmark_border,
                                                  size: 24,
                                                  color: HexColor('333F64'),
                                                ),
                                        onPressed: () {
                                          setState(() {
                                            if (bookmarkedSpeakers.contains(
                                              index,
                                            )) {
                                              bookmarkedSpeakers.remove(index);
                                            } else {
                                              bookmarkedSpeakers.add(index);
                                            }
                                          });
                                        },
                                      ),
                                    ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
