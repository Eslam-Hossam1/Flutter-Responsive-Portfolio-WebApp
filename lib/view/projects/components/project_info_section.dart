import 'package:flutter/material.dart';
import 'package:flutter_portfolio/model/feature_model.dart';
import 'package:flutter_portfolio/view/projects/components/features_list_view.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectInfoSection extends StatelessWidget {
  const ProjectInfoSection({
    super.key,
    required this.name,
    required this.description,
    required this.featureModels,
    required this.link,
  });

  final String name;
  final String description;
  final List<FeatureModel> featureModels;
  final String link;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProjectClickableName(name: name, link: link),
        const SizedBox(height: 16),
        Text(
          description,
          style: const TextStyle(fontSize: 18, color: Colors.white70),
        ),
        const SizedBox(height: 24),
        const Text(
          'Features',
          style: TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        FeaturesListView(featureModels: featureModels),
        const SizedBox(height: 16),
      ],
    );
  }
}

class ProjectClickableName extends StatelessWidget {
  const ProjectClickableName({
    super.key,
    required this.name,
    required this.link,
  });
  final String link;
  final String name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        launchUrl(Uri.parse(link));
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Text(
          name,
          style: const TextStyle(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
