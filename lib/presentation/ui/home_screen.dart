import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
              padding: const EdgeInsets.only(top: 20),
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 24),
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 22.0),
                            child: TextView(
                              text: 'Hello good Morning!',
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            height: 265,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: _onPageChangeValue > 0 ? 0 : 24.0),
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
                                          margin:
                                              const EdgeInsets.only(right: 16),
                                          decoration: BoxDecoration(
                                              color: AppColor.lightskyBlue,
                                              borderRadius:
                                                  BorderRadius.circular(32.0)),
                                          child: Image.asset(AppImage.bike)),
                                    );
                                  }),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (int i = 0; i < 6; i++)
                                Container(
                                  height: 8,
                                  width: 8,
                                  margin: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: _onPageChangeValue == i
                                        ? AppColor.black
                                        : AppColor.lightskyBlue1,
                                    shape: BoxShape.circle,
                                  ),
                                )
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 32, right: 27, top: 27, bottom: 26),
                            color: AppColor.yellow,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Flexible(
                                  child: TextView(
                                    text: 'Gotten your\nE-Bike yet?',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    textAlign: TextAlign.left,
                                    color: AppColor.primaryFaded,
                                  ),
                                ),
                                const SizedBox(
                                  width: 21,
                                ),
                                GestureDetector(
                                  onTap: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PackageTrackScreen())),
                                  child: Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        29, 16, 36.2, 16),
                                    decoration: BoxDecoration(
                                        color: AppColor.black,
                                        borderRadius:
                                            BorderRadius.circular(52)),
                                    child: Row(
                                      children: [
                                        TextView(
                                          text: 'Your Orders',
                                          color: AppColor.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        const SizedBox(
                                          width: 21,
                                        ),
                                        const Icon(
                                          Icons.arrow_forward_sharp,
                                          size: 25,
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
                                height: 161,
                                width: 161,
                                fit: BoxFit.scaleDown,
                              ),
                              Flexible(
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 23),
                                  child: TextView(
                                    text:
                                        'You too can join our\nElite squad of E-bikers',
                                    textAlign: TextAlign.start,
                                    fontSize: 14,
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
                  const SizedBox(
                    height: 20,
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
