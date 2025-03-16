import 'package:get/get.dart';
import 'package:news_getx_app/controller/news_controller.dart';

class NewsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewsController());
  }
}
