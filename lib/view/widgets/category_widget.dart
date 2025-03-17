import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_getx_app/controller/news_controller.dart';
import 'package:news_getx_app/model/news_model.dart';
import 'package:news_getx_app/shared/constants.dart';
import 'package:news_getx_app/view/widgets/list_items_widget.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});
  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget>
    with SingleTickerProviderStateMixin {
  final NewsController newsController = Get.find<NewsController>();
  late TabController? tabController = TabController(
    length: CategoryList.categoryItems.length,
    vsync: this,
  );

  @override
  Widget build(BuildContext context) {
    newsController;
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
            // children: [...CategoryList.categoryItems.map((e) => ListItems())],
            children:
                CategoryList.categoryItems
                    .map(
                      (e) => FutureBuilder(
                        future: newsController.getCategory(category: e),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListItemsWidget(
                              newsList: snapshot.data as List<NewsModel>,
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    )
                    .toList(),
          ),
        ),
      ],
    );
  }
}
