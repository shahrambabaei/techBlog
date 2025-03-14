import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techblog/components/main_tags.dart';
import 'package:techblog/components/app_color.dart';
import 'package:techblog/components/my_string.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fake_data.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
                      return InkWell(
                          onTap: () {
                            setState(() {
                              selectesTags.add(tagList[index]);
                            });
                          },
                          child: MainTag(index: index, textTheme: textTheme));
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 50),
                  child: ImageIcon(
                    AssetImage(
                      Assets.icons.downArrow.path,
                    ),
                    size: 60,
                  ),
                ),
                GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 45,
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: selectesTags.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: SolidColors.surface,
                          borderRadius: BorderRadius.circular(18)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            selectesTags[index].title.toString(),
                            style: textTheme.headlineMedium,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                selectesTags.removeAt(index);
                              });
                            },
                            child: const Icon(Icons.delete_forever_outlined,
                                size: 14, color: Colors.grey),
                          )
                        ],
                      ),
                    );
                  },
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
