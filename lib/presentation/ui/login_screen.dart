import 'package:flutter/material.dart';
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
            child: Stack(
              children: [
                SvgPicture.asset(
                  AppImage.swingline,
                  height: 200,
                  width: 200,
                ),
                Positioned(
                  right: 5,
                  child: SvgPicture.asset(
                    AppImage.swingline1,
                    height: 200,
                    width: 200,
                  ),
                ),
                Positioned(
                  right: -7,
                  child: SvgPicture.asset(
                    AppImage.swingline1,
                    height: 200,
                    width: 200,
                  ),
                ),
              ],
            ),
          ),
          CustomPaint(
            painter: OpenPainter(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 70,
                  ),
                  SvgPicture.asset(
                    AppImage.loginImage,
                    height: 200,
                    width: 200,
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  TextView(
                    text: 'Welcome to E-Bikes',
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: TextView(
                      text:
                          'Buying Electric bikes just got a lot easier, Try us today.',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.center,
                      letterSpacing: .5,
                      color: AppColor.primaryFaded,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DotWidget(color: AppColor.black),
                      const SizedBox(
                        width: 16,
                      ),
                      DotWidget(color: AppColor.white),
                      const SizedBox(
                        width: 16,
                      ),
                      DotWidget(color: AppColor.white),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ButtonWidget(
                    buttonText: 'Login with Google',
                    color: AppColor.white,
                    buttonColor: AppColor.black,
                    buttonBorderColor: AppColor.black,
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) =>  HomeScreen())),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextView(
                        text: 'Don’t have any account?',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.center,
                        letterSpacing: .5,
                        color: AppColor.primaryFaded,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      TextView(
                        text: 'Sign Up',
                        fontSize: 14,
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
