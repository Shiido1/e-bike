// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_color.dart';
import 'text_view.dart';

class TrackerHistory extends StatelessWidget {
  TrackerHistory({super.key, this.image, this.text1, this.text2});
  String? image;
  String? text1;
  String? text2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.w, 24.w, 10.w, 0.w),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: const BoxDecoration(
              color: AppColor.lightskyBlue,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              image!,
              height: 24.h,
              width: 24.w,
            ),
          ),
          SizedBox(
            width: 12.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextView(
                text: text1!,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 10.h,
              ),
              TextView(
                text: text2!,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColor.grey,
              ),
            ],
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 14.sp,
            color: AppColor.greythick,
          )
        ],
      ),
    );
  }
}
