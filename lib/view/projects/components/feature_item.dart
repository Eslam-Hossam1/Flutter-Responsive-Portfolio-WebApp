import 'package:flutter/material.dart';
import 'package:flutter_portfolio/model/feature_model.dart';

class FeatureItem extends StatelessWidget {
  const FeatureItem({
    super.key,
    required this.featureModel,
    required this.index,
  });

  final FeatureModel featureModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${index + 1}. ${featureModel.feature}",
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
        const SizedBox(height: 12),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Text(
              "- ${featureModel.featurePoints[index]}",
              style: const TextStyle(fontSize: 16, color: Colors.white70),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 8);
          },
          itemCount: featureModel.featurePoints.length,
        ),
      ],
    );
  }
}
