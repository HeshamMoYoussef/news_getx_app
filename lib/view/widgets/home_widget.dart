import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_getx_app/controller/news_controller.dart';
import 'package:news_getx_app/view/widgets/list_items.dart';

class HomeWidget extends GetView<NewsController> {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListItems();
  }
}
