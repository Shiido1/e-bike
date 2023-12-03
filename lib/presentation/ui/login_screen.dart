import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prestmit/presentation/ui/home_screen.dart';
import 'package:prestmit/presentation/ui/utils/app_color.dart';
import 'package:prestmit/presentation/ui/utils/app_image.dart';
import 'package:prestmit/presentation/ui/widget/button_widget.dart';
import 'package:prestmit/presentation/ui/widget/dot_widget.dart';
import 'package:prestmit/presentation/ui/widget/text_view.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primarylight,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              AppImage.swingline,
              height: 200.h,
              width: 200.w,
            ),
            // child: Stack(
            //   children: [
            //     SvgPicture.asset(
            //       AppImage.swingline,
            //       height: 200.h,
            //       width: 200.w,
            //     ),
            //     Positioned(
            //       right: 5,
            //       child: SvgPicture.asset(
            //         AppImage.swingline1,
            //         height: 200.h,
            //         width: 200.w,
            //       ),
            //     ),
            //     Positioned(
            //       right: -7,
            //       child: SvgPicture.asset(
            //         AppImage.swingline1,
            //         height: 200.h,
            //         width: 200.w,
            //       ),
            //     ),
            //   ],
            // ),
          ),
          CustomPaint(
            painter: OpenPainter(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 70.h,
                  ),
                  SvgPicture.asset(
                    AppImage.loginImage,
                    height: 200.h,
                    width: double.infinity,
                    // width: 200.w,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  TextView(
                    text: 'Welcome to E-Bikes',
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: TextView(
                      text:
                          'Buying Electric bikes just got a lot easier, Try us today.',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                      letterSpacing: .5,
                      color: AppColor.primaryFaded,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DotWidget(color: AppColor.black),
                      SizedBox(
                        width: 16.w,
                      ),
                      DotWidget(color: AppColor.white),
                      SizedBox(
                        width: 16.w,
                      ),
                      DotWidget(color: AppColor.white),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  ButtonWidget(
                    buttonText: 'Login with Google',
                    color: AppColor.white,
                    buttonColor: AppColor.black,
                    buttonBorderColor: AppColor.black,
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomeScreen())),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextView(
                        text: 'Don’t have any account?',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.center,
                        letterSpacing: .5,
                        color: AppColor.primaryFaded,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      TextView(
                        text: 'Sign Up',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.center,
                        letterSpacing: .5,
                        color: AppColor.black,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OpenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = AppColor.primary
      ..style = PaintingStyle.fill;
    canvas.drawCircle(const Offset(60, 270), 250, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
