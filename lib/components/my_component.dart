import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:techblog/components/app_color.dart';
import 'package:techblog/controller/home_screen_controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fake_data.dart';
import 'package:url_launcher/url_launcher.dart';

//checkLaunchUrl
Future<void> checkLaunchUrl(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri)) {
    throw Exception('Could not launch $url');
  }
}

//MainTag
class MainTag extends StatelessWidget {
  final int index;
  final TextTheme textTheme;
  const MainTag({super.key, required this.index, required this.textTheme});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
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
            Get.find<HomeScreenController>().tagList[index].title!,
            style: textTheme.displayMedium,
          ),
        ],
      ),
    );
  }
}

//TechDivider

class TechDivider extends StatelessWidget {
  const TechDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: SolidColors.dividerColor,
      indent: size.width / 6,
      endIndent: size.width / 6,
      thickness: 1.5,
    );
  }
}

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SpinKitCircle(
      color: SolidColors.primaryColor,
      size: 50,
    );
  }
}


PreferredSize appBar(String title) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(65),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions:  [
          Center(
            child: Text(title
              ,
              style: const TextStyle(
                  fontSize: 18,
                  color: SolidColors.primaryColor,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
        leading: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: SolidColors.primaryColor.withBlue(100)),
          child: const Icon(Icons.arrow_back_ios_new_outlined,color: Colors.white,),
        ),
      ),
    ),
  );
}
