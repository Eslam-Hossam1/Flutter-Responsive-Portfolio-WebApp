import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view%20model/controller.dart';

import 'navigation_button.dart';

class NavigationButtonList extends StatelessWidget {
  const NavigationButtonList({super.key});
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: currentPageIndex,
      builder: (context, activeIndex, _) {
        return TweenAnimationBuilder(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 200),
          builder: (context, value, child) {
            return Transform.scale(
              scale: value,
              child: Row(
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
                    width: MediaQuery.sizeOf(context).width * 0.02,
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
                    width: MediaQuery.sizeOf(context).width * 0.02,
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
    );
  }
}
