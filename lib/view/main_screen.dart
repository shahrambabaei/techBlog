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
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu),
                  Assets.images.logo.image(height: size.height / 15),
                  Icon(Icons.search)
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
                  ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Assets.images.banner.image(
                          fit: BoxFit.cover,
                          width: size.width,
                          height: size.height * .25)),
                  Container(
                    width: size.width,
                    height: size.height * .25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: GradientColors.homePosterCoverGradiant)),
                  ),

                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
