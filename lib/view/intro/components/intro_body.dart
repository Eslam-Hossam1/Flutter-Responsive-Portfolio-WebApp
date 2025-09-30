import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view/intro/components/my_animated_image.dart';
import 'package:flutter_portfolio/view/intro/components/social_media_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../res/constants.dart';
import '../../../view model/responsive.dart';
import 'animated_image_container.dart';
import 'combine_subtitle.dart';
import 'description_text.dart';
import 'download_button.dart';
import 'headline_text.dart';

class IntroBody extends StatelessWidget {
  const IntroBody({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    // double getHeight(){
    //   double width = MediaQuery.sizeOf(context).width;
    //   double height = MediaQuery.sizeOf(context).height;
    //   if(width>1000){
    //     return height-100;
    //   }else if(width>5)
    // }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: MediaQuery.sizeOf(context).width * 0.05),
        if (!Responsive.isLargeMobile(context)) const SocialMediaIconList(),
        SizedBox(width: MediaQuery.sizeOf(context).width * 0.05),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40.h),
            if (Responsive.isDesktop(context)) SizedBox(height: 160.h),
            if (!Responsive.isDesktop(context))
              SizedBox(
                height: size.height * 0.06,
              ),
            if (!Responsive.isDesktop(context))
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.23,
                  ),
                  const MyAnimatedImage(
                    width: 150,
                    height: 200,
                  ),
                ],
              ),
            if (!Responsive.isDesktop(context))
              SizedBox(
                height: size.height * 0.1,
              ),
            const Responsive(
                desktop: MyPortfolioText(start: 40, end: 50),
                largeMobile: MyPortfolioText(start: 40, end: 35),
                mobile: MyPortfolioText(start: 35, end: 30),
                tablet: MyPortfolioText(start: 50, end: 40)),
            const CombineSubtitleText(),
            const SizedBox(height: defaultPadding / 2),
            const Responsive(
              desktop: AnimatedDescriptionText(start: 14, end: 15),
              largeMobile: AnimatedDescriptionText(start: 14, end: 12),
              mobile: AnimatedDescriptionText(start: 14, end: 12),
              tablet: AnimatedDescriptionText(start: 17, end: 14),
            ),
            const SizedBox(
              height: defaultPadding * 2,
            ),
            const DownloadButton(),
            const SizedBox(
              height: defaultPadding * 2,
            ),
          ],
        ),
        const Spacer(),
        if (Responsive.isDesktop(context)) const MyAnimatedImage(),
        const Spacer()
      ],
    );
  }
}
