import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ahmed_profile_controller.dart';

class AhmedProfileView extends GetView<AhmedProfileController> {
  const AhmedProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AhmedProfileView'),
        centerTitle: true,
      ),
      body: Obx(() {
        return ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          final user = controller.profileUsers[index];
          return Row(
            children: [
              Stack(
                //fit: StackFit.loose,

                children: [
                
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(user['image']),
                        fit: BoxFit.cover,
                      ),
                    ),
                    ),
                  
                      Positioned(
                    bottom: -10,
                    left: 20,
                    
                    child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    color: Colors.orange.shade300,
                    ),
                    child: Text(user['profileType'], style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold), ),
                  )),
                ],
              )
            ],
          );
        },
      );
      },)
    );
  }
}
