import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view/main/components/drawer/drawer_bottom_social_buttons.dart';
import 'package:flutter_portfolio/view/main/components/drawer/personal_info.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../res/constants.dart';
import 'knowledges.dart';
import 'about.dart';
import 'my_skill.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    bool isDesktop = width >= 1000;
    bool isTablet = width >= 600 && width < 1000;
    bool isBigMobile = width >= 420 && width < 600;
    bool isMobile = width >= 350 && width < 420;
    return Drawer(
      width: isDesktop
          ? width * .4
          : isTablet
              ? width * .6
              : isMobile
                  ? width * .9
                  : isBigMobile
                      ? width * .8
                      : null,
      backgroundColor: bgColor,
      child: SingleChildScrollView(
        child: Container(
          color: bgColor,
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: defaultPadding / 2, horizontal: 10.w.clamp(10, 20)),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                About(),
                PersonalInfo(),
                Divider(),
                MySKills(),
                Knowledges(),
                Divider(),
                DrawerBottomSocialButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
