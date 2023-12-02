import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prestmit/presentation/ui/utils/app_color.dart';
import 'package:prestmit/presentation/ui/widget/text_view.dart';

import 'utils/app_image.dart';

class TrackScreen extends StatelessWidget {
  const TrackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SvgPicture.asset(AppImage.map),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 46),
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
            const SizedBox(
              height: 125,
            ),
            SvgPicture.asset(
              AppImage.track,
              height: 171,
              width: 295,
            ),
          ]),
        ),
      ]),
    );
  }
}
