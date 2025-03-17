import 'dart:developer';

import 'package:get/get.dart';
import 'package:news_getx_app/model/news_model.dart';

class ApiHelper extends GetConnect implements GetxService {
  Future<List<NewsModel>> getHeadlines() async {
    Response response = await get(
      'https://newsapi.org/v2/top-headlines?country=us&category=general&apiKey=a1a230a06cf74108b4843311b6b29641',
      // 'https://newsapi.org/v2/top-headlines?country=us&apiKey=a1a230a06cf74108b4843311b6b29641',
    );
    List news = response.body['articles'];
    List<NewsModel> newsList = [];
    //* Tow ways to convert json response to model object using *map* and *for* loop method
    //?(both are correct)
    // newsList = news.map((e) => NewsModel.fromJson(e)).toList();
    for (var item in news) {
      newsList.add(NewsModel.fromJson(item));
    }

    log(newsList.toString());
    // log(news.toString());
    return newsList;
  }

  Future<List<NewsModel>> getCategory({required String category}) async {
    Response response = await get(
      'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=a1a230a06cf74108b4843311b6b29641',
      // 'https://newsapi.org/v2/top-headlines?country=us&apiKey=a1a230a06cf74108b4843311b6b29641',
    );
    List news = response.body['articles'];
    List<NewsModel> newsList = [];
    //* Tow ways to convert json response to model object using *map* and *for* loop method
    //?(both are correct)
    // newsList = news.map((e) => NewsModel.fromJson(e)).toList();
    for (var item in news) {
      newsList.add(NewsModel.fromJson(item));
    }

    log(newsList.toString());
    // log(news.toString());
    return newsList;
  }
}
