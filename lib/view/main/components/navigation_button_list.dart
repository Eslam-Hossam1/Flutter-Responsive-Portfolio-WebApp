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
                return ValueListenableBuilder<bool>(
                  valueListenable: isNavigating,
                  builder: (context, navigating, __) {
                    return IgnorePointer(
                      ignoring: navigating,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          NavigationTextButton(
                            isActive: activeIndex == 0,
                            onTap: () => goToPage(0),
                            text: 'Home',
                          ),
                          SizedBox(width: innerButtonsGap),
                          NavigationTextButton(
                            isActive: activeIndex == 1,
                            onTap: () => goToPage(1),
                            text: 'Projects',
                          ),
                          SizedBox(width: innerButtonsGap),
                          NavigationTextButton(
                            isActive: activeIndex == 2,
                            onTap: () => goToPage(2),
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
