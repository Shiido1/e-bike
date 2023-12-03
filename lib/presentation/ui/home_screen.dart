import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prestmit/presentation/notifier/fake_notifier.dart';
import 'package:prestmit/presentation/ui/package_screen.dart';
import 'package:prestmit/presentation/ui/utils/app_color.dart';
import 'utils/app_image.dart';
import 'widget/text_view.dart';

class HomeScreen extends ConsumerStatefulWidget {
  HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int currentScreenIndex = 0;

  // ignore: unused_field
  late FakeNotifier _fakeNotifier;

  int _onPageChangeValue = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _fakeNotifier = ref.read(fakeNotifierProvider.notifier)..getFakeBicycle();
    });
  }

  @override
  Widget build(BuildContext context) {
    final fakeState = ref.watch(fakeNotifierProvider);
    return Scaffold(
      backgroundColor: AppColor.white,
      body: fakeState.isBusy
          ? const Center(child: CupertinoActivityIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 48.h,
                          width: 48.w,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(AppImage.preview),
                                  fit: BoxFit.contain)),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 11.5.w, vertical: 10.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: AppColor.lightskyBlue),
                          child: SvgPicture.asset(AppImage.notification),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      SizedBox(height: 24.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: TextView(
                            text: 'Hello good Morning!',
                            fontWeight: FontWeight.w700,
                            fontSize: 18.sp,
                            color: AppColor.primary1),
                      ),
                      SizedBox(height: 40.h),
                      SizedBox(
                        height: 265.h,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: _onPageChangeValue > 0 ? 0.w : 24.w),
                          child: PageView.builder(
                              onPageChanged: (value) {
                                _onPageChangeValue = value;
                                setState(() {});
                              },
                              controller:
                                  PageController(viewportFraction: 0.75),
                              padEnds: _onPageChangeValue != 0,
                              itemCount: 6,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, position) {
                                return Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 28.w, vertical: 18.h),
                                  margin: EdgeInsets.only(right: 10.w),
                                  decoration: BoxDecoration(
                                      color: _onPageChangeValue == position
                                          ? AppColor.lightskyBlue
                                          : AppColor.lightskyBlue
                                              .withOpacity(.8),
                                      borderRadius:
                                          BorderRadius.circular(32.w)),
                                  child: AnimatedOpacity(
                                    duration: const Duration(milliseconds: 250),
                                    opacity:
                                        _onPageChangeValue == position ? 1 : .3,
                                    child: Image.asset(
                                      AppImage.bike,
                                      height: 229.h,
                                      width: 199.w,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < 6; i++)
                            Container(
                              height: 6.h,
                              width: 6.w,
                              margin: EdgeInsets.all(7.w),
                              decoration: BoxDecoration(
                                color: _onPageChangeValue == i
                                    ? AppColor.black
                                    : AppColor.lightskyBlue1,
                                shape: BoxShape.circle,
                              ),
                            )
                        ],
                      ),
                      SizedBox(height: 25.h),
                      Container(
                        padding: EdgeInsets.only(
                            left: 32.w, right: 27.w, top: 27.h, bottom: 26.h),
                        color: AppColor.yellow,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                              child: TextView(
                                text: 'Gotten your\nE-Bike yet?',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                textAlign: TextAlign.left,
                                color: AppColor.primaryFaded,
                              ),
                            ),
                            SizedBox(width: 27.w),
                            GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PackageTrackScreen())),
                              child: Container(
                                padding: EdgeInsets.fromLTRB(
                                    29.w, 16.w, 36.2.w, 16.w),
                                decoration: BoxDecoration(
                                    color: AppColor.black,
                                    borderRadius: BorderRadius.circular(52)),
                                child: Row(
                                  children: [
                                    Text('Your Orders',
                                        style: GoogleFonts.lato(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.sp)),
                                    SizedBox(width: 21.w),
                                    SvgPicture.asset(AppImage.arrow)
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            AppImage.movingbike,
                            height: 161.h,
                            width: 161.w,
                            fit: BoxFit.scaleDown,
                          ),
                          Flexible(
                            child: Container(
                              margin: EdgeInsets.only(bottom: 23.w),
                              child: TextView(
                                text:
                                    'You too can join our\nElite squad of E-bikers',
                                textAlign: TextAlign.start,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
      bottomNavigationBar: SizedBox(
        height: 80.h,
        child: BottomNavigationBar(
          currentIndex: currentScreenIndex,
          backgroundColor: AppColor.lightskyBlue,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 4,
          type: BottomNavigationBarType.fixed,
          onTap: (value) => setState(() => currentScreenIndex = value),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImage.home,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImage.bookmark,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImage.send,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImage.setting,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
