import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_getx_app/controller/api_helper.dart';
import 'package:news_getx_app/model/news_model.dart';

class NewsController extends GetxController {
  final box = GetStorage();
  final pageController = PageController();
  int index = 0;

  void changeThemeModeApp() {
    String? theme = box.read('theme');
    if (theme == null || theme == 'light') {
      Get.changeThemeMode(ThemeMode.dark);
      box.write('theme', 'dark');
    } else {
      Get.changeThemeMode(ThemeMode.light);
      box.write('theme', 'light');
    }
    update();
  }

  IconData changeIconTheme() {
    String? theme = box.read('theme');
    if (theme == 'light') {
      return Icons.light_mode_outlined;
    } else {
      return Icons.dark_mode_outlined;
    }
  }

  void changeIndexNavBar({required int currentIndex}) {
    index = currentIndex;
    update();
  }

  ApiHelper apiHelper = ApiHelper();
  List<NewsModel> newsList = [];
  List<NewsModel> categoryList = [];
  void getHeadlines() async {
    newsList = await apiHelper.getHeadlines();
    update();
  }

  Future<List<NewsModel>> getCategory({required String category}) async {
    categoryList = await apiHelper.getCategory(category: category);
    update();
    return categoryList;
  }

  @override
  void onInit() {
    getHeadlines();
    super.onInit();
  }
}
