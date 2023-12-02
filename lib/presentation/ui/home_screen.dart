import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

  late FakeNotifier _fakeNotifier;

  PageController controller =
      PageController(initialPage: 1, viewportFraction: 0.65);
  static dynamic currentPageValue = 0.0;
  int _onPageChangeValue = 1;

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
          : SingleChildScrollView(
              padding: EdgeInsets.only(top: 24.w),
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 26.r,
                          backgroundColor: AppColor.white,
                          backgroundImage: AssetImage(AppImage.preview),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 4.w),
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 10.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: AppColor.lightskyBlue),
                          child: SvgPicture.asset(AppImage.notification),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: EdgeInsets.only(top: 18.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 22.w),
                            child: TextView(
                              text: 'Hello good Morning!',
                              fontWeight: FontWeight.w700,
                              fontSize: 18.sp,
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
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
                                  controller: controller,
                                  padEnds: _onPageChangeValue != 0,
                                  itemCount: 6,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, position) {
                                    return AnimatedOpacity(
                                      duration:
                                          const Duration(milliseconds: 250),
                                      opacity: _onPageChangeValue == position
                                          ? 1
                                          : .3,
                                      child: Container(
                                          margin: EdgeInsets.only(right: 16.w),
                                          decoration: BoxDecoration(
                                              color: AppColor.lightskyBlue,
                                              borderRadius:
                                                  BorderRadius.circular(32.w)),
                                          child: Image.asset(AppImage.bike)),
                                    );
                                  }),
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (int i = 0; i < 6; i++)
                                Container(
                                  height: 8.h,
                                  width: 8.w,
                                  margin: EdgeInsets.all(5.w),
                                  decoration: BoxDecoration(
                                    color: _onPageChangeValue == i
                                        ? AppColor.black
                                        : AppColor.lightskyBlue1,
                                    shape: BoxShape.circle,
                                  ),
                                )
                            ],
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 32.w,
                                right: 27.w,
                                top: 27.w,
                                bottom: 26.w),
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
                                SizedBox(
                                  width: 21.w,
                                ),
                                GestureDetector(
                                  onTap: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PackageTrackScreen())),
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(
                                        29.w, 16.w, 36.2.w, 16.w),
                                    decoration: BoxDecoration(
                                        color: AppColor.black,
                                        borderRadius:
                                            BorderRadius.circular(52)),
                                    child: Row(
                                      children: [
                                        TextView(
                                          text: 'Your Orders',
                                          color: AppColor.white,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        SizedBox(
                                          width: 21.w,
                                        ),
                                        Icon(
                                          Icons.arrow_forward_sharp,
                                          size: 25.sp,
                                          color: AppColor.white,
                                        )
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
                  ),
                  SizedBox(
                    height: 20.h,
                  )
                ],
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
              padding: EdgeInsets.only(top: 10.w),
              child: SvgPicture.asset(
                AppImage.home,
                height: 24.w,
                width: 24.w,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 10.w),
              child: SvgPicture.asset(
                AppImage.bookmark,
                height: 24.h,
                width: 24.w,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 10.w),
              child: SvgPicture.asset(
                AppImage.send,
                height: 24.h,
                width: 24.w,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 10.w),
              child: SvgPicture.asset(
                AppImage.setting,
                height: 24.h,
                width: 24.w,
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
