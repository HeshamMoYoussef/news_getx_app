import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_getx_app/controller/news_controller.dart';
import 'package:news_getx_app/view/widgets/list_items_widget.dart';

class HomeWidget extends GetView<NewsController> {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<NewsController>();
    return GetBuilder<NewsController>(
      builder:
          (controller) =>
              controller.newsList.isNotEmpty
                  ? ListItemsWidget(newsModel: controller.newsList)
                  : Center(child: CircularProgressIndicator()),

      // {
      //   if (controller.newsList.isNotEmpty) {
      //     return ListItemsWidget(newsModel: controller.newsList);
      //   } else {
      //     return Center(child: Text('No news available'));
      //   }
      // }
    );
  }
}
