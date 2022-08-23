import 'package:get/get.dart';

import '../controllers/activity_info_controller.dart';

class ActivityInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ActivityInfoController>(
      () => ActivityInfoController(),
    );
  }
}
