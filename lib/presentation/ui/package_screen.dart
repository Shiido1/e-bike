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
  const PackageTrackScreen({super.key});

  @override
  ConsumerState<PackageTrackScreen> createState() => _PackageTrackScreenState();
}

class _PackageTrackScreenState extends ConsumerState<PackageTrackScreen> {
  int currentScreenIndex = 0;

  // ignore: unused_field
  late FakeNotifier _fakeNotifier;

  PageController controller = PageController();

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
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
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
            SizedBox(height: 24.h),
            SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                      text: 'Hello good Morning!',
                      fontWeight: FontWeight.w700,
                      fontSize: 18.sp,
                      color: AppColor.primary1),
                  SizedBox(
                    height: 37.h,
                  ),
                  fakeState.isBusy
                      ? Padding(
                          padding: EdgeInsets.all(100.w),
                          child:
                              const Center(child: CupertinoActivityIndicator()),
                        )
                      : Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: AppColor.yellow,
                              borderRadius: BorderRadius.circular(32.r)),
                          child: Stack(
                            children: [
                              Align(
                                  alignment: Alignment.topRight,
                                  child: SvgPicture.asset(AppImage.swingline)),
                              Container(
                                margin: EdgeInsets.only(
                                    top: 53.h,
                                    left: 24.w,
                                    bottom: 32.h,
                                    right: 24.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextView(
                                        text: 'Track Your Package',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18.sp,
                                        color: AppColor.primary2),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    TextView(
                                        text:
                                            'Enter the receipt number that has\nbeen given by the officer',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.sp,
                                        letterSpacing: 1.2,
                                        color: AppColor.primaryFaded),
                                    SizedBox(
                                      height: 29.h,
                                    ),
                                    Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.fromLTRB(
                                            34.w, 16.h, 68.w, 16.h),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(28),
                                            border: Border.all(
                                                color: AppColor.primary3,
                                                width: .5.w)),
                                        child: TextView(
                                          text: 'Enter the receipt number',
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          textAlign: TextAlign.left,
                                        )),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    GestureDetector(
                                      onTap: () => Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const TrackScreen())),
                                      child: Container(
                                        width: double.infinity,
                                        padding: EdgeInsets.fromLTRB(
                                            34.w, 16.h, 28.w, 16.h),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(28.r),
                                            color: AppColor.black),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                                child: TextView(
                                                    text: 'Track Now',
                                                    color: AppColor.white,
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w600,
                                                    textAlign: TextAlign.left)),
                                            SvgPicture.asset(AppImage.arrow)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                  SizedBox(height: 40.h),
                  TextView(
                      text: 'Tracking history',
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: AppColor.greythick1),
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
          ],
        ),
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
                // height: 24.w,
                // width: 24.w,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImage.bookmark,
                // height: 24.h,
                // width: 24.w,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImage.send,
                // height: 24.h,
                // width: 24.w,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImage.setting,
                // height: 24.h,
                // width: 24.w,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
