import 'package:flutter/material.dart';
import 'package:techblog/constant/app_color.dart';
import 'package:techblog/gen/assets.gen.dart';

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
          children: [
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
                            image: AssetImage(Assets.images.banner.path))),
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
                              Text(
                                "شهرام بابایی",
                                style: textTheme.titleMedium,
                              ),
                              Text(
                                "like 258",
                                style: textTheme.titleMedium,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            " برنامه نویسب فلاتر...",
                            style: textTheme.displayMedium,
                          )
                        ],
                      ))
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
