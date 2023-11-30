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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentScreenIndex,
        backgroundColor: AppColor.lightskyBlue,
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
