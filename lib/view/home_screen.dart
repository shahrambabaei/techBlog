import 'package:flutter/material.dart';
import 'package:techblog/constant/app_color.dart';
import 'package:techblog/constant/my_string.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fake_data.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.menu),
                  Assets.images.logo.image(height: size.height / 15),
                  const Icon(Icons.search)
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
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
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10),
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
            ),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
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
            ),
          const  SizedBox(height: 20,),
            SizedBox(
              height: size.height / 4.1,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemCount: 5,
                  itemBuilder: (BuildContext, int) {
                    return Container(
                      width: 100,
                      height: 100,
                      color: Colors.lime,
                    );
                  }),
            )
          ],
        )),
      ),
    );
  }
}
