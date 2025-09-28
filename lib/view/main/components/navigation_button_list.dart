import 'package:flutter/material.dart';
import 'package:flutter_portfolio/res/constants.dart';
import 'package:flutter_portfolio/view%20model/controller.dart';
import 'package:flutter_portfolio/view%20model/responsive.dart';
import 'package:flutter_portfolio/view/main/components/connect_button.dart';
import 'package:flutter_portfolio/widgets/menu_button.dart';

import 'navigation_button.dart';

class NavigationButtonList extends StatelessWidget {
  const NavigationButtonList({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    final isDesktop = width > 1040;
    final isTiny = width <= 380;
    final isLittleTiny = width <= 450;
    final isBiggerTiny = width <= 500;
    double bigPadding = MediaQuery.sizeOf(context).width * 0.1;
    double innerButtonsGap = MediaQuery.sizeOf(context).width * 0.02;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: isTiny
              ? 12
              : isLittleTiny
                  ? 24
                  : isBiggerTiny
                      ? 30
                      : bigPadding),
      child: Row(
        children: [
          !Responsive.isLargeMobile(context)
              ? Image.asset(
                  'assets/images/triange_icon.png',
                  width:
                      (MediaQuery.sizeOf(context).width * 0.06).clamp(12, 60),
                )
              : MenuButton(
                  onTap: () => Scaffold.of(context).openDrawer(),
                ),
          Expanded(
            child: ValueListenableBuilder<int>(
              valueListenable: currentPageIndex,
              builder: (context, activeIndex, _) {
                return TweenAnimationBuilder(
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: const Duration(milliseconds: 200),
                  builder: (context, value, child) {
                    return Transform.scale(
                      scale: value,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          NavigationTextButton(
                            isActive: activeIndex == 0,
                            onTap: () {
                              currentPageIndex.value = 0;
                              controller.animateToPage(0,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                            },
                            text: 'Home',
                          ),
                          SizedBox(
                            width: innerButtonsGap,
                          ),
                          NavigationTextButton(
                            isActive: activeIndex == 1,
                            onTap: () {
                              currentPageIndex.value = 1;
                              controller.animateToPage(1,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                            },
                            text: 'Projects',
                          ),
                          SizedBox(
                            width: innerButtonsGap,
                          ),
                          NavigationTextButton(
                            isActive: activeIndex == 2,
                            onTap: () {
                              currentPageIndex.value = 2;
                              controller.animateToPage(2,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                            },
                            text: 'Certifications',
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          width > 800 ? ConnectButton() : SizedBox.shrink(),
        ],
      ),
    );
  }
}
