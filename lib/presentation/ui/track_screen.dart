import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prestmit/presentation/ui/utils/app_color.dart';
import 'package:prestmit/presentation/ui/widget/text_view.dart';

import 'utils/app_image.dart';

class TrackScreen extends StatelessWidget {
  TrackScreen({super.key});

  final _sheet = GlobalKey();
  final _controller = DraggableScrollableController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightskyBlue,
      body: Stack(fit: StackFit.expand, children: [
        SvgPicture.asset(
          AppImage.map,
          height: double.infinity,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 50),
          child: Column(children: [
            Row(
              children: [
                const Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColor.black,
                  size: 20,
                ),
                const SizedBox(
                  width: 49,
                ),
                TextView(
                  text: 'Tracking Details',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 88,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(46),
                  color: AppColor.primary),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 856,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(color: AppColor.black, width: .7)),
                child: Center(
                  child: TextView(
                    text: 'SCP6653728497',
                    textAlign: TextAlign.center,
                    color: AppColor.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 125.h,
            ),
            SvgPicture.asset(
              AppImage.track,
              height: 171.h,
              width: 295.w,
            ),
          ]),
        ),
        DraggableScrollableSheet(
          key: _sheet,
          initialChildSize: 0.3,
          maxChildSize: 0.8,
          minChildSize: 0.1,
          expand: true,
          snap: true,
          snapSizes: const [0.5],
          controller: _controller,
          builder: (BuildContext context, ScrollController scrollController) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Container(
                  height: 100.h,
                  color: AppColor.white,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    controller: scrollController,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 16.h,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              height: 5.h,
                              width: 48.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: AppColor.grey1),
                            ),
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          TextView(
                            text: 'Estimate arrives in',
                            color: AppColor.grey,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          TextView(
                            text: '2h 40m',
                            color: AppColor.black,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Container(
                              padding: EdgeInsets.all(24.w),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppColor.primary,
                                  borderRadius: BorderRadius.circular(32.r)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextView(
                                    text: 'Sukabumi, Indonesia',
                                    color: AppColor.greythick1,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  TextView(
                                    text: 'Estimate arrives in',
                                    color: AppColor.grey,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  Divider(
                                    color: AppColor
                                        .primaryFaded, //color of divider
                                    height: 1.h, //height spacing of divider
                                    thickness: .5, //thickness of divier line
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  TextView(
                                    text: 'Sukabumi, Indonesia',
                                    color: AppColor.greythick1,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  TextView(
                                    text: 'Estimate arrives in',
                                    color: AppColor.grey,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  Divider(
                                    color: AppColor
                                        .primaryFaded, //color of divider
                                    height: 1.h, //height spacing of divider
                                    thickness: .5, //thickness of divier line
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  TextView(
                                    text: 'Sukabumi, Indonesia',
                                    color: AppColor.greythick1,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  TextView(
                                    text: 'Estimate arrives in',
                                    color: AppColor.grey,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  Divider(
                                    color: AppColor
                                        .primaryFaded, //color of divider
                                    height: 1.h, //height spacing of divider
                                    thickness: .5, //thickness of divier line
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                ],
                              )),
                        ]),
                  )),
            );
          },
        )
      ]),
    );
  }
}
