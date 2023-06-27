import 'package:get/get.dart';

import '../controllers/authController.dart';
class Binding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AuthhController());
  }
}