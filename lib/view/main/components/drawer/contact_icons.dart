import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../res/constants.dart';

class ContactIcon extends StatelessWidget {
  const ContactIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          const EdgeInsets.only(top: defaultPadding, bottom: defaultPadding),
      child: Row(
        children: [
          const Spacer(
            flex: 2,
          ),
          IconButton(
              onPressed: () {
                launchUrl(Uri.parse(
                    'https://www.linkedin.com/in/eslam-hossam-591708316/'));
              },
              icon: SvgPicture.asset(
                'assets/icons/linkedin.svg',
                width: 30,
              )),
          const Spacer(),
          IconButton(
              onPressed: () {
                launchUrl(Uri.parse('https://github.com/Eslam-Hossam1/'));
              },
              icon: SvgPicture.asset(
                'assets/icons/github.svg',
                width: 30,
              )),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
