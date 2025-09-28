import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/model/certifications_models_list.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../res/constants.dart';

class CertificateStack extends StatefulWidget {
  const CertificateStack({super.key, required this.index});
  final int index;

  @override
  State<CertificateStack> createState() => _CertificateStackState();
}

class _CertificateStackState extends State<CertificateStack> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        launchUrl(Uri.parse(certificateList[widget.index].credential));
      },
      borderRadius: BorderRadius.circular(30),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(
              vertical: defaultPadding, horizontal: defaultPadding),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: const LinearGradient(colors: [
                Colors.pinkAccent,
                Colors.blue,
              ]),
              boxShadow: [
                BoxShadow(
                  color: Colors.pink,
                  offset: const Offset(-2, 0),
                  blurRadius: isHovered ? 20 : 10,
                ),
                BoxShadow(
                  color: Colors.blue,
                  offset: const Offset(2, 0),
                  blurRadius: isHovered ? 20 : 10,
                ),
              ]),
          child: Container(
              padding: const EdgeInsets.all(defaultPadding),
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: bgColor),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      certificateList[widget.index].name,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: defaultPadding,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          certificateList[widget.index].organization,
                          style: const TextStyle(color: Colors.amber),
                        ),
                        Text(
                          certificateList[widget.index].date,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: defaultPadding / 2,
                    ),
                    Text.rich(
                      maxLines: 1,
                      TextSpan(
                          text: 'Skills : ',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                              text: certificateList[widget.index].skills,
                              style: const TextStyle(
                                  color: Colors.grey,
                                  overflow: TextOverflow.ellipsis),
                            )
                          ]),
                    ),
                    const SizedBox(
                      height: defaultPadding,
                    ),
                    InkWell(
                      onTap: () {
                        launchUrl(Uri.parse(
                            certificateList[widget.index].credential));
                      },
                      child: Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(colors: [
                              Colors.pink,
                              Colors.blue.shade900,
                            ]),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.blue,
                                  offset: Offset(0, -1),
                                  blurRadius: 5),
                              BoxShadow(
                                  color: Colors.red,
                                  offset: Offset(0, 1),
                                  blurRadius: 5),
                            ]),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Credentials',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              CupertinoIcons.arrow_turn_up_right,
                              color: Colors.white,
                              size: 10,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
