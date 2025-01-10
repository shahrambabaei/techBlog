import 'package:flutter/material.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage(Assets.images.profileAvatar.path),
            height: 100,
          ),
          const SizedBox(
            height: 32,
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
          )
        ],
      ),
    );
  }
}
