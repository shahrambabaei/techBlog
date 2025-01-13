import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techblog/constant/app_color.dart';
import 'package:techblog/constant/my_string.dart';
import 'package:techblog/gen/assets.gen.dart';

class RegisterIntroScreen extends StatelessWidget {
  const RegisterIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.images.tcbot.path,
                height: 100,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                MyStrings.welcome,
                textAlign: TextAlign.center,
                style: textTheme.headlineMedium,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: SolidColors.primaryColor,
                      foregroundColor: Colors.white,
                      elevation: 0, // Shadow depth
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15), // Padding
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(5), // Rounded corners
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "بزن بریم",
                      style: textTheme.displayLarge,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
