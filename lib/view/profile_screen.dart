import 'package:flutter/material.dart';
import 'package:techblog/components/techdivider.dart';

import 'package:techblog/constant/app_color.dart';
import 'package:techblog/constant/my_string.dart';
import 'package:techblog/gen/assets.gen.dart';

class ProfileScreen extends StatelessWidget {
  final Size size;
  final TextTheme textTheme;
  const ProfileScreen({
    super.key,
    required this.size,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const PageScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 80,
            ),
            Image(
              image: AssetImage(Assets.images.profileAvatar.path),
              height: 100,
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(
                  AssetImage(Assets.icons.bluePen.path),
                  color: SolidColors.seeMore,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  MyStrings.imageProfileEdit,
                  style: textTheme.displaySmall,
                )
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Text(
              "شهرام بابایی",
              style: textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "shahram.b696@gmail.com",
              style: textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 60,
            ),
            TechDivider(size: size),
            InkWell(
              onTap: () {},
              child: SizedBox(
                height: 45,
                child: Center(
                  child: Text(
                    MyStrings.myFavBlog,
                    style: textTheme.headlineMedium,
                  ),
                ),
              ),
            ),
            TechDivider(size: size),
            InkWell(
              onTap: () {},
              child: SizedBox(
                  height: 45,
                  child: Center(
                      child: Text(MyStrings.myFavPodcast,
                          style: textTheme.headlineMedium))),
            ),
            TechDivider(size: size),
            InkWell(
              onTap: () {},
              child: SizedBox(
                  height: 45,
                  child: Center(
                      child: Text(MyStrings.logOut,
                          style: textTheme.headlineMedium))),
            )
          ],
        ),
      ),
    );
  }
}
