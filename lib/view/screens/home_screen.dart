import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_getx_app/controller/news_controller.dart';
import 'package:news_getx_app/view/widgets/category_widget.dart';
import 'package:news_getx_app/view/widgets/home_widget.dart';

class HomeScreen extends GetView<NewsController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<NewsController>();
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        return await Get.dialog(
          AlertDialog(
            title: const Text('close the app', textAlign: TextAlign.center),
            content: const Text(
              'Are you sure to close the app?',
              textAlign: TextAlign.center,
            ),
            actions: [
              TextButton(onPressed: () => Get.back(), child: const Text('No')),
              TextButton(
                onPressed: () => Get.back(result: true),
                child: const Text('Yes'),
              ),
            ],
          ),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'News App',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                controller.changeThemeModeApp();
                log(controller.box.read('theme').toString());
              },
              icon: Icon(controller.changeIconTheme()),
            ),
          ],
        ),
        body: PageView(
          onPageChanged: (index) {
            controller.changeIndexNavBar(currentIndex: index);
            log(index.toString());
          },
          controller: controller.pageController,
          children: [HomeWidget(), CategoryWidget()],
        ),
        bottomNavigationBar: GetBuilder<NewsController>(
          builder:
              (controller) => BottomNavigationBar(
                currentIndex: controller.index,
                fixedColor: Colors.blue,
                type: BottomNavigationBarType.fixed,
                onTap: (index) {
                  controller.changeIndexNavBar(currentIndex: index);
                  controller.pageController.jumpToPage(index);

                  log(index.toString());
                },
                // type: BottomNavigationBarType.fixed,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.category_outlined),
                    label: 'Category',
                  ),
                ],
              ),
        ),
      ),
    );
  }
}
