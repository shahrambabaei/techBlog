import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/components/my_component.dart';
import 'package:techblog/controller/article_controller.dart';

class ArticlelListScreen extends StatelessWidget {
  const ArticlelListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ArticleController articleController = Get.put(ArticleController());
    return SafeArea(
      child: Scaffold(
        appBar: appBar("لیست مقاله ها"),
        body: Obx(() {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: articleController.articleList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    constraints:
                        const BoxConstraints(maxHeight: double.infinity),
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: CachedNetworkImage(
                            imageUrl:
                                articleController.articleList[index].image!,
                            imageBuilder: (context, imageProvider) {
                              return Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover)),
                              );
                            },
                            placeholder: (context, url) => const Loading(),
                            errorWidget: (context, url, error) => const Icon(
                              Icons.image_not_supported_outlined,
                              size: 50,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                            child: SizedBox(
                          height: 120,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(articleController.articleList[index].title!),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(articleController
                                          .articleList[index].author!),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Wrap(
                                        children: [
                                          const Text("بازدید"),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(articleController
                                              .articleList[index].view!)
                                        ],
                                      )
                                    ],
                                  ),
                                  Text(articleController
                                      .articleList[index].catName!),
                                ],
                              )
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                );
              });
        }),
      ),
    );
  }
}
