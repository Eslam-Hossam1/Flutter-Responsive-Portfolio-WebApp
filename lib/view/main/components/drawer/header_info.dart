import 'package:flutter/material.dart';
import 'package:flutter_portfolio/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../res/constants.dart';

class AreaInfoText extends StatelessWidget {
  const AreaInfoText({super.key, required this.title, required this.text});
  final String title;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white)
                .copyWith(fontSize: 14.sp.fontClamper(14)),
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 12.sp.fontClamper(14),
                color: const Color(0xff8B8B8D)),
          ),
        ],
      ),
    );
  }
}
