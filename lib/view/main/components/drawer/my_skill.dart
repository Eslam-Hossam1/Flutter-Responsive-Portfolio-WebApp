import 'package:flutter/material.dart';
import 'package:flutter_portfolio/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../res/constants.dart';

class AnimatedLinearProgressIndicator extends StatelessWidget {
  const AnimatedLinearProgressIndicator(
      {super.key, required this.percentage, required this.title, this.image});
  final double percentage;
  final String title;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 2),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                image!,
                height: 15,
                width: 15,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                title,
                style: TextStyle(
                    color: Colors.white, fontSize: 12.sp.fontClamper(12)),
              ),
            ],
          ),
          const SizedBox(
            height: defaultPadding / 2,
          ),
        ],
      ),
    );
  }
}

class MySKills extends StatelessWidget {
  const MySKills({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: defaultPadding / 2,
        ),
        Text(
          'Skills',
          style:
              TextStyle(color: Colors.white, fontSize: 14.sp.fontClamper(14)),
        ),
        const SizedBox(
          height: defaultPadding / 2,
        ),
        const AnimatedLinearProgressIndicator(
          percentage: 0.7,
          title: 'Flutter',
          image: 'assets/icons/flutter.png',
        ),
        const AnimatedLinearProgressIndicator(
            percentage: 0.9, title: 'Dart', image: 'assets/icons/dart.png'),
        const AnimatedLinearProgressIndicator(
            percentage: 0.6,
            title: 'Firebase',
            image: 'assets/icons/firebase.png'),
        const AnimatedLinearProgressIndicator(
            percentage: 0.8,
            title: 'Responsive & Adaptive Design',
            image: 'assets/icons/flutter.png'),
        const AnimatedLinearProgressIndicator(
            percentage: 0.9,
            title: 'Clean Architecture',
            image: 'assets/icons/flutter.png'),
        const AnimatedLinearProgressIndicator(
          percentage: 0.5,
          title: 'State Management',
          image: 'assets/icons/bloc.png',
        ),
        const AnimatedLinearProgressIndicator(
            percentage: 0.9,
            title: 'Github',
            image: 'assets/icons/icons8-github.png'),
        const AnimatedLinearProgressIndicator(
            percentage: 0.9,
            title: 'CI/CD',
            image: 'assets/icons/icons8-github.png'),
      ],
    );
  }
}
