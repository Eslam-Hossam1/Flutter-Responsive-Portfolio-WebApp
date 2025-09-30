import 'package:flutter/material.dart';
import 'package:flutter_portfolio/font_clamper_extension.dart';
import 'package:flutter_portfolio/res/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'drawer_image.dart';

class About extends StatelessWidget {
  const About({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: bgColor,
        child: Column(
          children: [
            SizedBox(
              height: (60.h).clamp(40, 80),
            ),
            const DrawerImage(),
            SizedBox(
              height: (40.h).clamp(30, 45),
            ),
            Text(
              'Eslam Hossam',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(fontSize: 24.sp.fontClamper(28)),
            ),
            SizedBox(
              height: 8.h.clamp(4, 16),
            ),
            Text(
              'Flutter Developer',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18.sp.fontClamper(20),
                  fontWeight: FontWeight.w200,
                  height: 1.5),
            ),
            SizedBox(
              height: (60.h).clamp(40, 80),
            ),
          ],
        ),
      ),
    );
  }
}
