import 'package:flutter/material.dart';
import 'package:techblog/constant/app_color.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/view/home_screen.dart';
import 'package:techblog/view/profile_screen.dart';

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
        appBar: AppBar(
          backgroundColor: SolidColors.scaffoldBg,
          elevation: 0,
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
          centerTitle: true,
          title: Image(
              image: AssetImage(
                Assets.images.logo.path,
              ),
              height: size.height / 15),
        ),
        body: Stack(
          children: [
            ProfileScreen(size: size, textTheme: textTheme),
            BottomNavigation(size: size),
          ],
        ),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: size.height * .1,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: GradientColors.bottomNavBackground,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Container(
            height: size.height * .08,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: GradientColors.bottomNav),
                borderRadius: BorderRadius.circular(24)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ImageIcon(
                  AssetImage(Assets.icons.home.path),
                  color: Colors.white,
                ),
                ImageIcon(
                  AssetImage(Assets.icons.write.path),
                  color: Colors.white,
                ),
                ImageIcon(
                  AssetImage(Assets.icons.user.path),
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
