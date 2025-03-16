import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_getx_app/controller/news_controller.dart';

class ListItems extends GetView<NewsController> {
  const ListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
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
                'https://imagekit.io/blog/content/images/2019/12/image-optimization.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          alignment: Alignment.bottomCenter,

          child: Container(
            alignment: Alignment.bottomCenter,

            height: 50,
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
              'Title $index',
              style: Theme.of(
                context,
              ).textTheme.titleMedium!.copyWith(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
