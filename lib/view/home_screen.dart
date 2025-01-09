import 'package:flutter/material.dart';
import 'package:techblog/constant/app_color.dart';
import 'package:techblog/constant/my_string.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fake_data.dart';

class HomeScreen extends StatelessWidget {
  final Size size;
  final TextTheme textTheme;
  const HomeScreen({
    super.key,
    required this.size,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            HomeScreenBanner(size: size, textTheme: textTheme),
            const SizedBox(
              height: 12,
            ),
            HomeScreenTagList(textTheme: textTheme),
            const SizedBox(
              height: 32,
            ),
            SeeMoreBlog(textTheme: textTheme),
            const SizedBox(
              height: 20,
            ),
            HomeScreenBlogList(size: size, textTheme: textTheme),
            SeeMorePodcast(textTheme: textTheme),
            const SizedBox(
              height: 20,
            ),
            HomeScreenPadcastList(size: size, textTheme: textTheme),
            SizedBox(
              height: size.height * .1,
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreenPadcastList extends StatelessWidget {
  const HomeScreenPadcastList({
    super.key,
    required this.size,
    required this.textTheme,
  });

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.2,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          scrollDirection: Axis.horizontal,
          itemCount: blogList.getRange(0, 5).length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width / 2.3,
                    height: size.height / 4.2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image(
                          fit: BoxFit.cover,
                          width: size.width / 2.3,
                          height: size.height / 4.4,
                          image: NetworkImage(blogList[index].imageUrl)),
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
          }),
    );
  }
}

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

class HomeScreenBlogList extends StatelessWidget {
  const HomeScreenBlogList({
    super.key,
    required this.size,
    required this.textTheme,
  });

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height / 3.2,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          itemCount: blogList.getRange(0, 5).length,
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
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(blogList[index].imageUrl)),
                          ),
                          foregroundDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              gradient: const LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: GradientColors.blogPost)),
                        ),
                        Positioned(
                            bottom: 20,
                            right: 10,
                            left: 10,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      blogList[index].writer,
                                      style: textTheme.titleMedium,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      blogList[index].views,
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
                      child: Text(blogList[index].title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.headlineMedium!
                              .copyWith(color: Colors.black)))
                ],
              ),
            );
          }),
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

class HomeScreenBanner extends StatelessWidget {
  const HomeScreenBanner({
    super.key,
    required this.size,
    required this.textTheme,
  });

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height * .25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(homepageBanner["imageAsset"]))),
            foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: GradientColors.homePosterCoverGradiant)),
          ),
          Positioned(
              bottom: 20,
              right: 10,
              left: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            homepageBanner["writer"] +
                                " _ " +
                                homepageBanner["date"],
                            style: textTheme.titleMedium,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            homepageBanner["view"],
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
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    homepageBanner["titleBanner"],
                    style: textTheme.displayMedium!.copyWith(
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}

class HomeScreenTagList extends StatelessWidget {
  final TextTheme textTheme;
  const HomeScreenTagList({super.key, required this.textTheme});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        itemCount: tagList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: GradientColors.tags),
                  borderRadius: BorderRadius.circular(18)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ImageIcon(
                      AssetImage(
                        Assets.icons.hashTagIcon.path,
                      ),
                      size: 14,
                      color: Colors.white),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    tagList[index].title.toString(),
                    style: textTheme.displayMedium,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
