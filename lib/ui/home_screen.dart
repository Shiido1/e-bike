import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prestmit/ui/utils/app_color.dart';
import 'utils/app_image.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.white,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 4),
              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColor.lightskyBlue),
              child: SvgPicture.asset(AppImage.notification),
            ),
          )
        ],
        leading: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: CircleAvatar(
            backgroundColor: AppColor.white,
            backgroundImage: AssetImage(AppImage.preview),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentScreenIndex,
        backgroundColor: AppColor.lightskyBlue,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: (value) => setState(() => currentScreenIndex = value),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: SvgPicture.asset(
                AppImage.home,
                height: 20,
                width: 20,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: SvgPicture.asset(
                AppImage.bookmark,
                height: 20,
                width: 20,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: SvgPicture.asset(
                AppImage.send,
                height: 20,
                width: 20,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: SvgPicture.asset(
                AppImage.setting,
                height: 20,
                width: 20,
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
