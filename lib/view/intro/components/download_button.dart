import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../res/constants.dart';

class DownloadButton extends StatefulWidget {
  const DownloadButton({super.key});

  @override
  State<DownloadButton> createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchUrl(Uri.parse(
            'https://drive.google.com/file/d/1uKkGWhZxPWlzuk3jp4wxqre-NBMqZ5Pl/view'));
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(
              vertical: defaultPadding / 1.5, horizontal: defaultPadding * 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.blue,
                  offset: const Offset(0, -1),
                  blurRadius: _isHovered
                      ? defaultPadding / 1.75
                      : defaultPadding / 3.5),
              BoxShadow(
                  color: Colors.red,
                  offset: const Offset(0, 1),
                  blurRadius: _isHovered
                      ? defaultPadding / 1.75
                      : defaultPadding / 3.5),
            ],
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.pink,
                  Colors.blue.shade900,
                ]),
          ),
          child: Row(
            children: [
              Text(
                'Download CV',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Colors.white,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: defaultPadding / 3,
              ),
              const Icon(
                FontAwesomeIcons.download,
                color: Colors.white70,
                size: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
