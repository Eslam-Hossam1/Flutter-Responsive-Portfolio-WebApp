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
                width: 5,
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
        SizedBox(
          height: defaultPadding / 2,
        ),
        Text(
          'Skills',
          style:
              TextStyle(color: Colors.white, fontSize: 14.sp.fontClamper(14)),
        ),
        SizedBox(
          height: defaultPadding / 2,
        ),
        AnimatedLinearProgressIndicator(
          percentage: 0.7,
          title: 'Flutter',
          image: 'assets/icons/flutter.png',
        ),
        AnimatedLinearProgressIndicator(
            percentage: 0.9, title: 'Dart', image: 'assets/icons/dart.png'),
        AnimatedLinearProgressIndicator(
            percentage: 0.6,
            title: 'Firebase',
            image: 'assets/icons/firebase.png'),
        AnimatedLinearProgressIndicator(
            percentage: 0.85, title: 'Hive', image: 'assets/icons/dart.png'),
        AnimatedLinearProgressIndicator(
            percentage: 0.8,
            title: 'Responsive Design',
            image: 'assets/icons/flutter.png'),
        AnimatedLinearProgressIndicator(
            percentage: 0.9,
            title: 'MVVM Architecture',
            image: 'assets/icons/flutter.png'),
        AnimatedLinearProgressIndicator(
            percentage: 0.5, title: 'Bloc', image: 'assets/icons/bloc.png'),
      ],
    );
  }
}
