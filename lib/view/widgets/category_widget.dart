import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_getx_app/controller/news_controller.dart';
import 'package:news_getx_app/shared/constants.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});
  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget>
    with SingleTickerProviderStateMixin {
  late TabController? tabController = TabController(
    length: CategoryList.categoryItems.length,
    vsync: this,
  );

  @override
  Widget build(BuildContext context) {
    Get.find<NewsController>();
    return Column(
      children: [
        TabBar(
          controller: tabController,
          isScrollable: true,
          padding: const EdgeInsets.all(10),
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.blue,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: [for (var item in CategoryList.categoryItems) Tab(text: item)],
          physics: const BouncingScrollPhysics(),
          onTap: (value) {},
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              for (var item in CategoryList.categoryItems)
                Center(child: Text(item)),
            ],
          ),
        ),
      ],
    );
  }
}
