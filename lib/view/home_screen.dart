import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:techblog/components/app_color.dart';
import 'package:techblog/components/my_component.dart';
import 'package:techblog/components/my_string.dart';
import 'package:techblog/controller/home_screen_controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fake_data.dart';

class HomeScreen extends StatelessWidget {
  final Size size;
  final TextTheme textTheme;
  HomeScreen({
    super.key,
    required this.size,
    required this.textTheme,
  });
  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Obx(() {
            return !homeScreenController.isLoading.value
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      poster(),
                      const SizedBox(
                        height: 12,
                      ),
                      tagList(),
                      const SizedBox(
                        height: 32,
                      ),
                      SeeMoreBlog(textTheme: textTheme),
                      const SizedBox(
                        height: 20,
                      ),
                      topVisited(),
                      SeeMorePodcast(textTheme: textTheme),
                      const SizedBox(
                        height: 20,
                      ),
                      topPodcast(),
                      SizedBox(
                        height: size.height * .1,
                      ),
                    ],
                  )
                : const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Loading(),
                      ],
                    ),
                  );
          })),
    );
  }

  Widget tagList() {
    return SizedBox(
      height: 50,
      child: Obx(() {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          itemCount: homeScreenController.tagList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 10),
              child: MainTag(index: index, textTheme: textTheme),
            );
          },
        );
      }),
    );
  }

  Widget poster() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Obx(() {
        return Stack(
          children: [
            Container(
              width: size.width,
              height: size.height * .25,
              foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: GradientColors.homePosterCoverGradiant),
              ),
              child: CachedNetworkImage(
                imageUrl: homeScreenController.poster.value.image!,
                imageBuilder: (context, imageProvider) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover)),
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
            Positioned(
                bottom: 20,
                right: 10,
                left: 10,
                child: Text(
                  homeScreenController.poster.value.title!,
                  style: const TextStyle(color: Colors.white),
                ))
          ],
        );
      }),
    );
  }

  Widget topVisited() {
    return SizedBox(
      height: size.height / 3.2,
      child: Obx(() {
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            itemCount: homeScreenController.topVisitedList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width / 2.3,
                      height: size.height / 4.2,
                      child: Stack(
                        children: [
                          Container(
                            foregroundDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                gradient: const LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: GradientColors.blogPost)),
                            child: CachedNetworkImage(
                              imageUrl: homeScreenController
                                  .topVisitedList[index].image!,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover)),
                              ),
                              placeholder: (context, url) => const Loading(),
                              errorWidget: (context, url, error) => const Icon(
                                Icons.image_not_supported_outlined,
                                size: 50,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 20,
                              right: 10,
                              left: 10,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        homeScreenController
                                            .topVisitedList[index].author!,
                                        style: textTheme.titleMedium,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        homeScreenController
                                            .topVisitedList[index].view!,
                                        style: textTheme.titleMedium,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Icon(
                                        Icons.remove_red_eye_sharp,
                                        color: Colors.white,
                                        size: 16,
                                      )
                                    ],
                                  ),
                                ],
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                        width: size.width / 2.3,
                        child: Text(
                            homeScreenController.topVisitedList[index].title!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: textTheme.headlineMedium!
                                .copyWith(color: Colors.black)))
                  ],
                ),
              );
            });
      }),
    );
  }

  Widget topPodcast() {
    return SizedBox(
      height: size.height / 3.2,
      child: Obx(() {
        return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            scrollDirection: Axis.horizontal,
            itemCount: homeScreenController.topPodcastList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width / 2.3,
                      height: size.height / 4.2,
                      child: CachedNetworkImage(
                        imageUrl:
                            homeScreenController.topPodcastList[index].poster!,
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover)),
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
                    SizedBox(
                        width: size.width / 2.3,
                        child: Text(blogList[index].title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: textTheme.headlineMedium!
                                .copyWith(color: Colors.black)))
                  ],
                ),
              );
            });
      }),
    );
  }
}

// 
class SeeMorePodcast extends StatelessWidget {
  const SeeMorePodcast({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ImageIcon(
            AssetImage(Assets.icons.microphon.path),
            color: SolidColors.seeMore,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            MyStrings.viewHotestPodCasts,
            style: textTheme.displaySmall,
          )
        ],
      ),
    );
  }
}

class SeeMoreBlog extends StatelessWidget {
  const SeeMoreBlog({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ImageIcon(
            AssetImage(Assets.icons.bluePen.path),
            color: SolidColors.seeMore,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            MyStrings.viewHotestBlog,
            style: textTheme.displaySmall,
          )
        ],
      ),
    );
  }
}


