import 'package:flutter/material.dart';

import 'media_viewer_desktop.dart';
import 'media_viewer_mobile.dart';

class ProjectMediaViewer extends StatelessWidget {
  final String name;
  final String description;
  final List<String> images;
  final List<String> videos;

  // Test URLs for demonstration
  static const List<String> testImages = [
    'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
    'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
    'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
    'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
    'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
  ];
  static const List<String> testVideos = [
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://samplelib.com/mp4/sample-5s.mp4'
  ];

  const ProjectMediaViewer({
    Key? key,
    required this.name,
    required this.description,
    List<String>? images,
    List<String>? videos,
  })  : images = images ?? testImages,
        videos = videos ?? testVideos,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          name,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final isBigDesktop = width >= 1300;
            final isDesktop = width >= 1000 && width < 1300;
            final isTablet = width >= 700 && width < 1000;
            final isBigMobile = width >= 600 && width < 700;
            final gridCrossAxisCount = isDesktop
                ? 3
                : (isTablet
                    ? 2
                    : isBigMobile
                        ? 7
                        : 5);
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: (isBigDesktop || isDesktop || isTablet)
                      ? ProjectMediaDesktopLayout(
                          name: name,
                          description: description,
                          images: testImages,
                          videos: testVideos,
                          isTablet: isTablet,
                          horizontalPadding: isBigDesktop ? width * .07 : 24,
                          verticalPadding: isBigDesktop ? 36 : 16,
                        )
                      : ProjectMediaMobileLayout(
                          name: name,
                          description: description,
                          images: testImages,
                          videos: testVideos,
                          gridCrossAxisCount: gridCrossAxisCount,
                          isMobile: width < 700,
                          horizontalPadding: isBigMobile ? 48 : 24,
                          verticalPadding: isBigMobile ? 36 : 16,
                        ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
