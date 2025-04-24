import 'package:flutter/material.dart';
import 'project_media_widgets.dart';

class ProjectMediaDesktopLayout extends StatelessWidget {
  final String name;
  final String description;
  final List<String> images;
  final List<String> videos;
  final bool isTablet;
  final double horizontalPadding;
  final double verticalPadding;

  const ProjectMediaDesktopLayout({
    required this.name,
    required this.description,
    required this.images,
    required this.videos,
    required this.isTablet,
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VideoGalleryWithGradientContainer(videos: videos),
                const SizedBox(height: 32),
                Text(
                  name,
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Text(
                  description,
                  style: const TextStyle(fontSize: 18, color: Colors.white70),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          const SizedBox(width: 32),
          Expanded(
            flex: 1,
            child: ImageGallery(
              images: images,
              crossAxisCount: isTablet ? 2 : 3,
            ),
          ),
        ],
      ),
    );
  }
}
