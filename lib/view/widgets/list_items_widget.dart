import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_getx_app/controller/news_controller.dart';
import 'package:news_getx_app/model/news_model.dart';

class ListItemsWidget extends GetView<NewsController> {
  const ListItemsWidget({required this.newsList, super.key});
  final List<NewsModel> newsList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newsList.length,
      itemBuilder: (context, index) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.21,
          width: double.infinity,
          margin: const EdgeInsets.all(6),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: NetworkImage('${newsList[index].urlToImage}'),
              fit: BoxFit.cover,
            ),
          ),
          alignment: Alignment.bottomCenter,

          child: Container(
            alignment: Alignment.center,
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black.withAlpha(150),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.all(10),
            child: Text(
              '${newsList[index].title}',
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
