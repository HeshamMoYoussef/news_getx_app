import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_getx_app/controller/news_controller.dart';
import 'package:news_getx_app/model/news_model.dart';

class ListItemsWidget extends GetView<NewsController> {
  const ListItemsWidget({this.newsModel, super.key});
  final List<NewsModel>? newsModel;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newsModel!.length,
      itemBuilder: (context, index) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.21,
          width: double.infinity,
          margin: const EdgeInsets.all(6),

          // padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: NetworkImage(
                // 'https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty.jpg',
                '${newsModel![index].urlToImage}',
              ),
              fit: BoxFit.cover,
            ),
          ),
          alignment: Alignment.bottomCenter,

          child: Container(
            alignment: Alignment.center,
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black.withAlpha(100),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.all(10),
            child: Text(
              '${newsModel![index].title}',
              style: Theme.of(
                context,
              ).textTheme.titleSmall!.copyWith(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
