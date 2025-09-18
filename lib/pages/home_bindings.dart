import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get_state_mixin/pages/home_controller.dart';
import 'package:get_state_mixin/pages/home_controller_state_mixin.dart';
import 'package:get_state_mixin/pages/home_super_controller.dart';
import 'package:get_state_mixin/repository/viacep_repository.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ViacepRepository());
    Get.put(HomeController(Get.find()));
    Get.put(HomeControllerStateMixin(Get.find()));
    Get.put(HomeSuperController(Get.find()));
  }
}
