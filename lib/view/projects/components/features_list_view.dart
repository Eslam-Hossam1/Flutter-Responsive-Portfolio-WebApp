import 'package:flutter/material.dart';
import 'package:flutter_portfolio/model/feature_model.dart';
import 'package:flutter_portfolio/view/projects/components/feature_item.dart';

class FeaturesListView extends StatelessWidget {
  const FeaturesListView({
    super.key,
    required this.featureModels,
  });

  final List<FeatureModel> featureModels;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return FeatureItem(featureModel: featureModels[index], index: index);
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 16);
      },
      itemCount: featureModels.length,
    );
  }
}
