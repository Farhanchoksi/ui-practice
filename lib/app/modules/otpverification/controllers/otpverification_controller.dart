import 'dart:async';

import 'package:get/get.dart';

class OtpverificationController extends GetxController {
  //TODO: Implement OtpverificationController

  final seconds = 0.obs;
  Timer? Timercount;

  void starttimer(){
    seconds.value =5;
    Timercount = Timer.periodic(Duration(seconds: 1), (timer) {
      if (seconds.value > 0) {
        seconds.value -- ;
      }else{
        timer.cancel();
      }
    },);
  }



  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    Timercount?.cancel();
  }

  
}
