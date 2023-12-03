import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prestmit/presentation/ui/utils/app_color.dart';
import 'package:prestmit/presentation/ui/widget/text_view.dart';

import 'utils/app_image.dart';

class TrackScreen extends StatelessWidget {
 const TrackScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightskyBlue,
      body: Stack(children: [
        SvgPicture.asset(AppImage.map, height: double.infinity),
        Column(children: [
          SafeArea(
            minimum: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                const Icon(Icons.arrow_back_ios_new,
                    color: AppColor.primary4, size: 20),
                const Spacer(),
                TextView(
                  text: 'Tracking Details',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            width: double.infinity,
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(46),
                color: AppColor.primary),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 87.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: AppColor.black, width: .5)),
              child: Center(
                child: TextView(
                    text: 'SCP6653728497',
                    textAlign: TextAlign.center,
                    color: AppColor.primary5,
                    fontSize: 14,
                    letterSpacing: .5,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(height: 125.h),
          SvgPicture.asset(AppImage.track, height: 171.h, width: 295.w),
        ]),
        ExpandableBottomSheet(
          background: const SizedBox.shrink(),
          persistentHeader: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(32.r))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextView(
                              text: 'Estimate arrives in',
                              color: AppColor.grey,
                              fontSize: 14.sp,
                              letterSpacing: .5,
                              fontWeight: FontWeight.w400),
                          SizedBox(height: 4.h),
                          TextView(
                              text: '2h 40m',
                              color: AppColor.greythick1,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w600),
                        ],
                      ),
                    ),
                    SvgPicture.asset(AppImage.menu)
                  ],
                ),
              ],
            ),
          ),
          expandableContent: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height * .7,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              children: [
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
                          text: 'No receipt : SCP6653728497',
                          color: AppColor.grey,
                          fontSize: 12.sp,
                          letterSpacing: .5,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Divider(
                            color: AppColor.primary6,
                            height: 1.h,
                            thickness: 1),
                        SizedBox(
                          height: 16.h,
                        ),
                        TextView(
                          text: '2,50 USD',
                          color: AppColor.greythick1,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        TextView(
                          text: 'Postal fee',
                          color: AppColor.grey,
                          fontSize: 12.sp,
                          letterSpacing: .5,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Divider(
                            color: AppColor.primary6,
                            height: 1.h,
                            thickness: 1),
                        SizedBox(
                          height: 16.h,
                        ),
                        TextView(
                          text: 'Bali, Indonesia',
                          color: AppColor.greythick1,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        TextView(
                            text: 'Parcel, 24kg',
                            color: AppColor.grey,
                            fontSize: 12.sp,
                            letterSpacing: .5,
                            fontWeight: FontWeight.w400),
                      ],
                    )),
                SizedBox(
                  height: 24.h,
                ),
                TextView(
                    text: 'History',
                    color: AppColor.greythick1,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600),
                SizedBox(height: 24.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 56.h,
                              width: 56.w,
                              padding: EdgeInsets.all(16.w),
                              decoration: const BoxDecoration(
                                color: AppColor.primary,
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(AppImage.van),
                            ),
                          ],
                        ),
                        SizedBox(width: 12.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextView(
                              text: 'In Delivery',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColor.greythick,
                            ),
                            SizedBox(height: 8.h),
                            TextView(
                              text: 'Bali, Indonesia',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColor.grey,
                            ),
                          ],
                        ),
                        const Spacer(),
                        TextView(
                          text: '00.00 PM',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColor.grey,
                        ),
                      ],
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 20.w),
                        height: 40,
                        child: const VerticalDivider(
                            thickness: 1.5, color: AppColor.greythick3)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 56.h,
                          width: 56.w,
                          padding: EdgeInsets.all(16.w),
                          decoration: const BoxDecoration(
                            color: AppColor.lightskyBlue,
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(AppImage.mailbox),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextView(
                              text: 'Transit - Sending City',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColor.greythick,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            TextView(
                              text: 'Jakarta, Indonesia',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColor.grey,
                            ),
                          ],
                        ),
                        const Spacer(),
                        TextView(
                          text: '21.00 PM',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColor.grey,
                        ),
                      ],
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 20.w),
                        height: 40,
                        child: const VerticalDivider(
                            thickness: 1.5, color: AppColor.greythick3)),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 56.h,
                      width: 56.w,
                      padding: EdgeInsets.all(16.w),
                      decoration: const BoxDecoration(
                        color: AppColor.lightskyBlue,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        AppImage.box,
                      ),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          text: 'Send Form Sukabumi',
                          fontSize: 14.sp,
                          color: AppColor.greythick,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextView(
                          text: 'Sukabumi, Indonesia',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColor.grey,
                        ),
                      ],
                    ),
                    const Spacer(),
                    TextView(
                      text: '19.00 PM',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColor.grey,
                    ),
                  ],
                ),
                SizedBox(height: 30.h)
              ],
            ),
          ),
        )
      ]),
    );
  }
}
