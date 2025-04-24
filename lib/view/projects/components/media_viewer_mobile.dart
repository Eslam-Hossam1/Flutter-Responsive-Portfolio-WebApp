import 'package:flutter/material.dart';
import 'project_media_widgets.dart';

class ProjectMediaMobileLayout extends StatelessWidget {
  final String description;
  final List<String> images;
  final List<String> videos;
  final int gridCrossAxisCount;
  final bool isMobile;
  final double horizontalPadding;
  final double verticalPadding;

  const ProjectMediaMobileLayout({
    required this.description,
    required this.images,
    required this.videos,
    required this.gridCrossAxisCount,
    required this.isMobile,
    required this.horizontalPadding,
    required this.verticalPadding,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: Column(
        children: [
          Text(
            description,
            style: const TextStyle(fontSize: 18, color: Colors.white70),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          SizedBox(
            height: 220,
            child: VideoGalleryWithGradientContainer(videos: videos),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: isMobile ? 350 : 220,
            child: ImageGallery(
              images: images,
              crossAxisCount: gridCrossAxisCount,
            ),
          ),
        ],
      ),
    );
  }
}
