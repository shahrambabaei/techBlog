import 'package:flutter/material.dart';
import 'package:techblog/constant/app_color.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/view/home_screen.dart';
import 'package:techblog/view/profile_screen.dart';
import 'package:techblog/view/register_intro.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedScreen = 0;
  late var size;
  late var textTheme;
  late List<Widget> techMAinScreenList;
  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    textTheme = Theme.of(context).textTheme;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
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
            Positioned.fill(
                child: IndexedStack(
              index: selectedScreen,
              children: [
                HomeScreen(size: size, textTheme: textTheme),
                RegisterIntroScreen(),
                ProfileScreen(size: size, textTheme: textTheme)
              ],
            )),
            BottomNavigation(
              size: size,
              changeScreen: (value) {
                setState(() {
                  selectedScreen = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation(
      {super.key, required this.size, required this.changeScreen});

  final Size size;
  final Function(int) changeScreen;

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
                gradient:
                    const LinearGradient(colors: GradientColors.bottomNav),
                borderRadius: BorderRadius.circular(24)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () => changeScreen(0),
                  icon: ImageIcon(
                    AssetImage(Assets.icons.home.path),
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () => changeScreen(1),
                  icon: ImageIcon(
                    AssetImage(Assets.icons.write.path),
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () => changeScreen(2),
                  icon: ImageIcon(
                    AssetImage(Assets.icons.user.path),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
