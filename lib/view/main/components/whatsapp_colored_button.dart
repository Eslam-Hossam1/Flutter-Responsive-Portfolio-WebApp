import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../res/constants.dart';

class WhatsappColoredButton extends StatefulWidget {
  const WhatsappColoredButton({super.key});

  @override
  State<WhatsappColoredButton> createState() => _WhatsappColoredButtonState();
}

class _WhatsappColoredButtonState extends State<WhatsappColoredButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
      child: InkWell(
        onTap: () {
          launchUrl(Uri.parse('https://wa.me/201028735105'));
        },
        borderRadius: BorderRadius.circular(defaultPadding + 10),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 40,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(defaultPadding),
                  gradient: LinearGradient(colors: [
                    Colors.pink,
                    Colors.blue.shade900,
                  ]),
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
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    FontAwesomeIcons.whatsapp,
                    color: Colors.greenAccent,
                    size: 15,
                  ),
                  const SizedBox(width: defaultPadding / 4),
                  Text(
                    'Whatsapp',
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Colors.white,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
