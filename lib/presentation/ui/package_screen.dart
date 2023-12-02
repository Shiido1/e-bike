import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prestmit/presentation/notifier/fake_notifier.dart';
import 'package:prestmit/presentation/ui/track_screen.dart';
import 'package:prestmit/presentation/ui/utils/app_color.dart';
import 'package:prestmit/presentation/ui/widget/text_view.dart';
import 'package:prestmit/presentation/ui/widget/track_history.dart';
import 'package:shimmer/shimmer.dart';

import 'utils/app_image.dart';

class PackageTrackScreen extends ConsumerStatefulWidget {
  PackageTrackScreen({super.key});

  @override
  ConsumerState<PackageTrackScreen> createState() => _PackageTrackScreenState();
}

class _PackageTrackScreenState extends ConsumerState<PackageTrackScreen> {
  int currentScreenIndex = 0;

  late FakeNotifier _fakeNotifier;

  PageController controller = PageController();
  static dynamic currentPageValue = 0.0;
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
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(top: 42.w, right: 24.w, left: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 26.r,
                  backgroundColor: AppColor.white,
                  backgroundImage: const AssetImage(AppImage.preview),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 4.w),
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: AppColor.lightskyBlue),
                  child: SvgPicture.asset(AppImage.notification),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.only(top: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      text: 'Hello good Morning!',
                      fontWeight: FontWeight.w700,
                      fontSize: 18.sp,
                    ),
                    SizedBox(
                      height: 37.h,
                    ),
                    fakeState.isBusy
                        ? Padding(
                            padding: EdgeInsets.all(100.w),
                            child: const Center(
                                child: CupertinoActivityIndicator()),
                          )
                        : Center(
                            child: Container(
                              height: 308.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppColor.primary,
                                  borderRadius: BorderRadius.circular(32.r)),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          right: -46,
                                          child: SvgPicture.asset(
                                            AppImage.swingline3,
                                            height: 200.h,
                                            width: 200.w,
                                          ),
                                        ),
                                        Positioned(
                                          right: -64,
                                          child: SvgPicture.asset(
                                            AppImage.swingline3,
                                            height: 200.h,
                                            width: 200.w,
                                          ),
                                        ),
                                        Positioned(
                                          right: -30,
                                          child: SvgPicture.asset(
                                            AppImage.swingline3,
                                            height: 200.h,
                                            width: 200.w,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    left: 20,
                                    top: 60,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextView(
                                            text: 'Track Your Package',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18.sp,
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          TextView(
                                            text:
                                                'Enter the receipt number that has\nbeen given by the officer',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.sp,
                                            color: AppColor.primaryFaded,
                                          ),
                                          SizedBox(
                                            height: 29.h,
                                          ),
                                          Container(
                                            width: 290.h,
                                            padding: EdgeInsets.fromLTRB(
                                                34.w, 16.w, 68.w, 16.w),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(28),
                                                border: Border.all(
                                                    color: AppColor.black,
                                                    width: .9.w)),
                                            child: TextView(
                                              text: 'Enter the receipt number',
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          GestureDetector(
                                            onTap: () => Navigator.of(context)
                                                .push(MaterialPageRoute(
                                                    builder: (context) =>
                                                        TrackScreen())),
                                            child: Container(
                                              width: 290.w,
                                              padding: EdgeInsets.fromLTRB(
                                                  34.w, 16.w, 28.2.w, 16.w),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          28.r),
                                                  color: AppColor.black),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  TextView(
                                                    text: 'Track Now',
                                                    color: AppColor.white,
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  SizedBox(
                                                    width: 109.w,
                                                  ),
                                                  Icon(
                                                    Icons.arrow_forward_sharp,
                                                    size: 25.sp,
                                                    color: AppColor.white,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                    SizedBox(
                      height: 40.h,
                    ),
                    TextView(
                      text: 'Tracking history',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                    fakeState.isBusy
                        ? Column(
                            children: [
                              ...[1, 2, 3]
                                  .map(
                                    (e) => Padding(
                                      padding: EdgeInsets.only(top: 16.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Shimmer.fromColors(
                                            baseColor: const Color.fromARGB(
                                                255, 205, 207, 211),
                                            highlightColor: AppColor.white,
                                            child: Container(
                                              height: 50.h,
                                              width: 50.w,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color.fromARGB(
                                                    255, 205, 207, 211),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Shimmer.fromColors(
                                                baseColor: const Color.fromARGB(
                                                    255, 205, 207, 211),
                                                highlightColor: AppColor.white,
                                                child: Container(
                                                  height: 10.h,
                                                  width: 200.w,
                                                  decoration: BoxDecoration(
                                                      color: AppColor.grey,
                                                      shape: BoxShape.rectangle,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 11.2.h,
                                              ),
                                              Shimmer.fromColors(
                                                baseColor: const Color.fromARGB(
                                                    255, 205, 207, 211),
                                                highlightColor: AppColor.white,
                                                child: Container(
                                                  height: 8.h,
                                                  width: 140.w,
                                                  decoration: BoxDecoration(
                                                      color: AppColor.grey,
                                                      shape: BoxShape.rectangle,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList()
                            ],
                          )
                        : Column(
                            children: [
                              TrackerHistory(
                                image: AppImage.box,
                                text1: 'SCP9374826473',
                                text2: 'In the process',
                              ),
                              TrackerHistory(
                                image: AppImage.van,
                                text1: 'SCP6653728497',
                                text2: 'In delivery',
                              ),
                            ],
                          ),
                    SizedBox(
                      height: 36.h,
                    ),
                  ],
                ),
              ),
            ),
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
