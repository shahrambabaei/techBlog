import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:techblog/components/app_color.dart';
import 'package:techblog/components/my_component.dart';
import 'package:techblog/components/my_string.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/services/dio_service.dart';
import 'package:techblog/view/home_screen.dart';
import 'package:techblog/view/profile_screen.dart';
import 'package:techblog/view/register_intro_screen.dart';


GlobalKey<ScaffoldState> _key = GlobalKey();
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DioService().getData("https://techblog.sasansafari.com/Techblog/api/home/?command=index");
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    RxInt selectedScreen = 0.obs;
    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: Drawer(
          backgroundColor: SolidColors.scaffoldBg,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ListView(
              children: [
                DrawerHeader(
                  child: Center(
                    child: Image.asset(
                      Assets.images.logo.path,
                      scale: 1.5,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "پروفایل کاربری",
                    style: textTheme.headlineMedium,
                  ),
                  onTap: () {},
                ),
                const Divider(
                  color: SolidColors.dividerColor,
                ),
                ListTile(
                  title: Text(
                    "درباره تک‌بلاگ",
                    style: textTheme.headlineMedium,
                  ),
                  onTap: () {},
                ),
                const Divider(
                  color: SolidColors.dividerColor,
                ),
                ListTile(
                  title: Text(
                    "اشتراک گذاری تک بلاگ",
                    style: textTheme.headlineMedium,
                  ),
                  onTap: () async {
                    await Share.share(MyStrings.shareText);
                  },
                ),
                const Divider(
                  color: SolidColors.dividerColor,
                ),
                ListTile(
                  title: Text(
                    "تک‌بلاگ در گیت هاب",
                    style: textTheme.headlineMedium,
                  ),
                  onTap: () => checkLaunchUrl(MyStrings.teckBlogGithubUrl),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: SolidColors.scaffoldBg,
          elevation: 0,
          automaticallyImplyLeading: true,
          leading: IconButton(
            onPressed: () {
              _key.currentState!.openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ],
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
              child: Obx(() {
                return IndexedStack(
                  index: selectedScreen.value,
                  children: [
                    HomeScreen(size: size, textTheme: textTheme),
                    const RegisterIntroScreen(),
                    ProfileScreen(size: size, textTheme: textTheme)
                  ],
                );
              }),
            ),
            BottomNavigation(
              size: size,
              changeScreen: (int value) {
                selectedScreen.value = value;
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
