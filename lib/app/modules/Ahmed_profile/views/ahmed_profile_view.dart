import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
//import 'package:http/http.dart';
import 'package:ui_project/app/modules/agenda_screen/views/agenda_screen_view.dart';

import '../controllers/ahmed_profile_controller.dart';

class AhmedProfileView extends GetView<AhmedProfileController> {
  const AhmedProfileView({super.key ,  this.userdata});
  final Map<String, dynamic>? userdata;
  @override
  Widget build(BuildContext context) {
    
    if (userdata == null) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AhmedProfileView'),
        centerTitle: true,
      ),
      body: Center(child: Text('No user data!')),
    );
  }
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('AhmedProfileView'),
        centerTitle: true,
      ),
      body: 
        
           Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 100,
                      height: 110,
                      child: Stack(
                        //fit: StackFit.loose,
                          fit: StackFit.loose,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: Image.network(
                                userdata!['image'],
                               fit: BoxFit.cover,
                               // width: 100,
                      //height: 100,
                              ),
                            ),
                          ),
                          
                              Positioned(
                            bottom: 0,
                            left: 30.w,
                            
                            child: Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            color: Colors.orange.shade300,
                            ),
                            child: Text(userdata!['profileType'] ?? 'unknow', style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold), ),
                          )),
                        ],
                      ),
                    ),
                    10.horizontalSpace,
                
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(userdata!['name']),
                    Text(userdata!['title']),
                    Icon(Icons.abc_sharp)
                      ],
                    )
                
                  ],
                ),
                10.verticalSpace,
                 Wrap(
                        spacing: 4,
                        runSpacing: 4,
                        children: [
                          // Show all tags from API data
                          if (userdata!['tags'] != null && userdata!['tags'] is List)
                            ...List<String>.from(userdata!['tags']).map((tag) {
                              // Determine color based on tag
                              Color bgColor;
                              if (tag == 'IT') {
                                bgColor = Colors.grey[200]!;
                              } else if (tag == 'Business') {
                                bgColor = Colors.indigo[100]!;
                              } else if (tag == 'Developer' ||
                                  tag == 'Development') {
                                bgColor = Colors.blue[100]!;
                              } else if (tag == 'Workshop') {
                                bgColor = Colors.amber[100]!;
                              } else if (tag == 'Design' || tag == 'UX') {
                                bgColor = Colors.purple[100]!;
                              } else if (tag == 'Mobile') {
                                bgColor = Colors.teal[100]!;
                              } else if (tag == 'Management') {
                                bgColor = Colors.green[100]!;
                              } else {
                                bgColor = Colors.grey[200]!;
                              }
            
                              return _buildTag(tag, bgColor, HexColor('333F64'));
                            }).toList(),
                            20.verticalSpace,
                        ],
                      ),
              ],
            ),
          ),
          
          
       
      
    );
  }

  Widget _buildTag(String text, Color bgColor, Color textColor) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}


