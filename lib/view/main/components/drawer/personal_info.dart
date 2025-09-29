import 'package:flutter/material.dart';

import '../../../../res/constants.dart';
import 'header_info.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: defaultPadding / 2,
        ),
        CopyInfoText(
            svgImage: 'assets/icons/phone-svgrepo-com.svg',
            title: 'Phone',
            text: '+20 1028735105',
            textToBeCopy: '+201028735105',
            ),
        CopyInfoText(
            svgImage: 'assets/icons/gmail-icon-logo-svgrepo-com.svg',
            title: 'Email',
            text: 'eslamhossam.tech@gmail.com',
            textToBeCopy: 'eslamhossam.tech@gmail.com',),
        ClickableInfo(
            svgImage: 'assets/icons/github-svgrepo-com_gray.svg',
            infoTitle: 'Github',
            linkText: 'Github.com/Eslam-Hossam1',
            linkUrl: 'https://github.com/Eslam-Hossam1'),
        ClickableInfo(
            svgImage: 'assets/icons/linkedin-svgrepo-com.svg',
            infoTitle: 'Linkedin',
            linkText: 'Linkedin.com/eslam-hossam',
            linkUrl: 'https://www.linkedin.com/in/eslam-hossam-591708316/'),
        SizedBox(
          height: defaultPadding / 2,
        ),
      ],
    );
  }
}
