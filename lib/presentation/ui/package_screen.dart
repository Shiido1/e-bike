import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 26,
                    backgroundColor: AppColor.white,
                    backgroundImage: AssetImage(AppImage.preview),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColor.lightskyBlue),
                    child: SvgPicture.asset(AppImage.notification),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22.0),
                      child: TextView(
                        text: 'Hello good Morning!',
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 37,
                    ),
                    fakeState.isBusy
                        ? const Padding(
                            padding: EdgeInsets.all(100),
                            child: Center(child: CupertinoActivityIndicator()),
                          )
                        : Center(
                            child: Container(
                              height: 308,
                              width: 327,
                              decoration: BoxDecoration(
                                  color: AppColor.primary,
                                  borderRadius: BorderRadius.circular(32)),
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
                                            height: 200,
                                            width: 200,
                                          ),
                                        ),
                                        Positioned(
                                          right: -64,
                                          child: SvgPicture.asset(
                                            AppImage.swingline3,
                                            height: 200,
                                            width: 200,
                                          ),
                                        ),
                                        Positioned(
                                          right: -30,
                                          child: SvgPicture.asset(
                                            AppImage.swingline3,
                                            height: 200,
                                            width: 200,
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
                                            fontSize: 18,
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          TextView(
                                            text:
                                                'Enter the receipt number that has\nbeen given by the officer',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: AppColor.primaryFaded,
                                          ),
                                          const SizedBox(
                                            height: 29,
                                          ),
                                          Container(
                                            width: 290,
                                            padding: const EdgeInsets.fromLTRB(
                                                34, 16, 68, 16),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(28),
                                                border: Border.all(
                                                    color: AppColor.black,
                                                    width: .9)),
                                            child: TextView(
                                              text: 'Enter the receipt number',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          GestureDetector(
                                            onTap: () => Navigator.of(context)
                                                .push(MaterialPageRoute(
                                                    builder: (context) =>
                                                        const TrackScreen())),
                                            child: Container(
                                              width: 290,
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      34, 16, 28.2, 16),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(28),
                                                  color: AppColor.black),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  TextView(
                                                    text: 'Track Now',
                                                    color: AppColor.white,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  const SizedBox(
                                                    width: 109,
                                                  ),
                                                  const Icon(
                                                    Icons.arrow_forward_sharp,
                                                    size: 25,
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
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22.0),
                      child: TextView(
                        text: 'Tracking history',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    fakeState.isBusy
                        ? Padding(
                            padding: const EdgeInsets.only(left: 22.0, top: 16),
                            child: Column(
                              children: [
                                ...[1, 2, 3]
                                    .map(
                                      (e) => Padding(
                                        padding:
                                            const EdgeInsets.only(top: 12.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Shimmer.fromColors(
                                              baseColor: const Color.fromARGB(
                                                  255, 205, 207, 211),
                                              highlightColor: AppColor.white,
                                              child: Container(
                                                child: Container(
                                                  height: 50,
                                                  width: 50,
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color.fromARGB(
                                                        255, 205, 207, 211),
                                                  ),
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
                                                  baseColor:
                                                      const Color.fromARGB(
                                                          255, 205, 207, 211),
                                                  highlightColor:
                                                      AppColor.white,
                                                  child: Container(
                                                    height: 10,
                                                    width: 200,
                                                    decoration: BoxDecoration(
                                                        color: AppColor.grey,
                                                        shape:
                                                            BoxShape.rectangle,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8)),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 11.2,
                                                ),
                                                Shimmer.fromColors(
                                                  baseColor:
                                                      const Color.fromARGB(
                                                          255, 205, 207, 211),
                                                  highlightColor:
                                                      AppColor.white,
                                                  child: Container(
                                                    height: 8,
                                                    width: 140,
                                                    decoration: BoxDecoration(
                                                        color: AppColor.grey,
                                                        shape:
                                                            BoxShape.rectangle,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8)),
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
                            ),
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
                    const SizedBox(
                      height: 36,
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
