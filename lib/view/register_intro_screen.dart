import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:validators/validators.dart';
import 'package:techblog/components/my_string.dart';
import 'package:techblog/gen/assets.gen.dart';

class RegisterIntroScreen extends StatelessWidget {
  const RegisterIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
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
                    onPressed: () {
                      _showEmailbottomSheet(context, size, textTheme);
                    },
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

  Future<dynamic> _showEmailbottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: size.height / 2,
              width: size.width,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(24),
                      topLeft: Radius.circular(24)),
                  color: Colors.white),
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Text(
                    MyStrings.insertYourEmail,
                    style: textTheme.headlineMedium!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    child: TextField(
                      style: textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: "emxample@gmail.com",
                        hintStyle: textTheme.headlineSmall,
                      ),
                      onChanged: (value) {
                      
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _activatecodebottomSheet(context, size, textTheme);
                      },
                      child: const Text("ادامه"))
                ],
              ),
            ),
          );
        });
  }

  Future<dynamic> _activatecodebottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: size.height / 2,
              width: size.width,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(24),
                      topLeft: Radius.circular(24)),
                  color: Colors.white),
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Text(
                    MyStrings.activateCode,
                    style: textTheme.headlineMedium!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    child: TextField(
                      style: textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: "*******",
                        hintStyle: textTheme.headlineSmall,
                      ),
                      onChanged: (value) {
                     
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
          );
        });
  }
}
