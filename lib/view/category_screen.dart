import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techblog/components/main_tags.dart';
import 'package:techblog/constant/app_color.dart';
import 'package:techblog/constant/my_string.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fake_data.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                SvgPicture.asset(
                  Assets.images.tcbot.path,
                  height: 150,
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  MyStrings.successfulRegister,
                  textAlign: TextAlign.center,
                  style: textTheme.headlineMedium!.copyWith(fontSize: 16),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: TextField(
                    style: textTheme.headlineMedium,
                    decoration: InputDecoration(
                      hintText: "نام و نام خانوادگی",
                      hintStyle: textTheme.headlineSmall,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(MyStrings.chooseCats, style: textTheme.headlineMedium),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    scrollDirection: Axis.horizontal,
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: .3,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: tagList.length,
                    itemBuilder: (context, index) {
                      return MainTag(index: index, textTheme: textTheme);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 50),
                  child: ImageIcon(
                    AssetImage(
                      Assets.icons.downArrow.path,
                    ),
                    size: 70,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    scrollDirection: Axis.horizontal,
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: .3,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: tagList.length,
                    itemBuilder: (context, index) {
                      return MainTag(index: index, textTheme: textTheme);
                    },
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(onPressed: () {}, child: const Text("ادامه"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
