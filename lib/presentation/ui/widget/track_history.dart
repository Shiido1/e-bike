// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
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
      padding: const EdgeInsets.fromLTRB(0, 24, 10, 0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: AppColor.lightskyBlue,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              image!,
              height: 24,
              width: 24,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextView(
                text: text1!,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(
                height: 10,
              ),
              TextView(
                text: text2!,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColor.grey,
              ),
            ],
          ),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 14,
            color: AppColor.greythick,
          )
        ],
      ),
    );
  }
}
