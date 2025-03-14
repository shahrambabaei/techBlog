import 'package:flutter/material.dart';
import 'package:techblog/components/app_color.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fake_data.dart';

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
            tagList[index].title.toString(),
            style: textTheme.displayMedium,
          ),
        ],
      ),
    );
    
  }
}


