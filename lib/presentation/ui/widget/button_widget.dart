import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prestmit/presentation/ui/utils/app_color.dart';
import 'package:prestmit/presentation/ui/utils/app_image.dart';
import 'package:prestmit/presentation/ui/widget/text_view.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key,
      this.buttonText,
      this.color,
      this.buttonColor,
      this.isLight = true,
      this.buttonBorderColor,
      this.onPressed,
      this.isLoading = false});
  final String? buttonText;
  final Color? color;
  final Color? buttonColor;
  final Color? buttonBorderColor;
  final bool? isLight;
  final bool? isLoading;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          const BoxConstraints.tightFor(width: double.infinity, height: 56),
      child: TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(buttonColor!),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(52.0),
                      side: BorderSide(color: buttonBorderColor!, width: 1)))),
          child: Row(
            children: [
              Container(
                  padding: EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.white,
                  ),
                  child: SvgPicture.asset(AppImage.google)),
              SizedBox(width: 59.w),
              TextView(
                text: buttonText!,
                fontSize: 15.0,
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ],
          )),
    );
  }
}
