import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view/intro/components/social_icon.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaIconColumn extends StatelessWidget {
  const SocialMediaIconColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocialMediaIcon(
            icon: 'assets/icons/linkedin.svg',
            onTap: () => launchUrl(Uri.parse(
                'https://www.linkedin.com/in/eslam-hossam-591708316/'))),
        SocialMediaIcon(
          icon: 'assets/icons/github.svg',
          onTap: () =>
              launchUrl(Uri.parse('https://github.com/Eslam-Hossam1/')),
        ),
        SocialMediaIcon(
          icon: 'assets/icons/whatsapp-svgrepo-com.svg',
          onTap: () {
            launchUrl(Uri.parse('https://wa.me/201028735105'));
          },
        ),
      ],
    );
  }
}
