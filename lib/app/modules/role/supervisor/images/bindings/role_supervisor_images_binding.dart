import 'package:get/get.dart';

import '../controllers/role_supervisor_images_controller.dart';

class RoleSupervisorImagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RoleSupervisorImagesController>(
      () => RoleSupervisorImagesController(),
    );
  }
}
