import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view/main/components/drawer/contact_icons.dart';
import 'package:flutter_portfolio/view/main/components/drawer/personal_info.dart';
import '../../../../res/constants.dart';
import 'knowledges.dart';
import 'about.dart';
import 'my_skill.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Drawer(
      width: width > 700 ? width * .4 : null,
      backgroundColor: bgColor,
      child: SingleChildScrollView(
        child: Container(
          color: bgColor,
          child: const Padding(
            padding: EdgeInsets.all(defaultPadding / 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                About(),
                PersonalInfo(),
                Divider(),
                MySKills(),
                Knowledges(),
                Divider(),
                ContactIcon(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
