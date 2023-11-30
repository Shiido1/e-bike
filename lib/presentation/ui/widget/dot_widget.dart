import 'package:flutter/material.dart';

class DotWidget extends StatelessWidget {
  DotWidget({super.key, required this.color});
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.2,
      width: 6.2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
