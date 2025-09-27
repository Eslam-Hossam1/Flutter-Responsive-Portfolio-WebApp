import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view%20model/responsive.dart';
import 'package:flutter_portfolio/widgets/menu_button.dart';

import 'navigation_button_list.dart';

class TopNavigationBar extends StatelessWidget {
  const TopNavigationBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Expanded(
          flex: 2,
          child: SizedBox(
            width: 24,
          ),
        ),

        !Responsive.isLargeMobile(context)
            ? Image.asset(
                'assets/images/triange_icon.png',
                width: MediaQuery.sizeOf(context).width * 0.04,
              )
            : MenuButton(
                onTap: () => Scaffold.of(context).openDrawer(),
              ),

        // if(Responsive.isLargeMobile(context)) MenuButton(),


        
        if (!(MediaQuery.sizeOf(context).width < 330))
          const Spacer(
            flex: 2,
          ),
        if (!(MediaQuery.sizeOf(context).width < 330))
          const Spacer(
            flex: 2,
          ),
        const Expanded(
          child: SizedBox(
            width: 24,
          ),
        ),
      ],
    );
  }
}
