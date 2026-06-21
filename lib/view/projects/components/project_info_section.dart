import 'package:flutter/material.dart';
import 'package:flutter_portfolio/model/feature_model.dart';
import 'package:flutter_portfolio/view/projects/components/features_list_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        const SizedBox(height: 12),
        GithubRepoButton(link: link),
        const SizedBox(height: 28),
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

class GithubRepoButton extends StatefulWidget {
  final String link;
  const GithubRepoButton({super.key, required this.link});

  @override
  State<GithubRepoButton> createState() => _GithubRepoButtonState();
}

class _GithubRepoButtonState extends State<GithubRepoButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: InkWell(
        onTap: () => launchUrl(Uri.parse(widget.link)),
        borderRadius: BorderRadius.circular(10),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isHovered
                ? Colors.white.withOpacity(0.08)
                : Colors.white.withOpacity(0.04),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isHovered ? Colors.white30 : Colors.white12,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'assets/icons/github.svg',
                colorFilter: ColorFilter.mode(
                  isHovered ? Colors.white : Colors.white60,
                  BlendMode.srcIn,
                ),
                width: 16,
              ),
              const SizedBox(width: 8),
              Text(
                'GitHub Repo',
                style: TextStyle(
                  color: isHovered ? Colors.white : Colors.white60,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
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
