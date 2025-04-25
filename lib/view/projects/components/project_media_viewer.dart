import 'package:flutter/material.dart';
import 'package:flutter_portfolio/model/feature_model.dart';

import 'media_viewer_desktop.dart';
import 'media_viewer_mobile.dart';

class ProjectMediaViewer extends StatelessWidget {
  final String name;
  final String description;
  final List<String> images;
  final List<String> videos;
  final List<FeatureModel> featureModels;

  const ProjectMediaViewer({
    Key? key,
    required this.name,
    required this.description,
    required this.images,
    required this.videos,
    required this.featureModels,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: MediaQuery.sizeOf(context).width < 1000
            ? IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              )
            : null,
        automaticallyImplyLeading: MediaQuery.sizeOf(context).width < 1000,
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
            final isTablet = width >= 600 && width < 1000;
            final isBigMobile = width >= 500 && width < 600;
            final gridCrossAxisCount = isDesktop
                ? 3
                : (isTablet
                    ? 2
                    : isBigMobile
                        ? 6
                        : 4);
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: (isBigDesktop || isDesktop || isTablet)
                      ? ProjectMediaDesktopLayout(
                          name: name,
                          description: description,
                          images: images,
                          videos: videos,
                          isTablet: isTablet,
                          horizontalPadding: isBigDesktop ? width * .07 : 24,
                          verticalPadding: isBigDesktop ? 36 : 16,
                        )
                      : ProjectMediaMobileLayout(
                          name: name,
                          description: description,
                          images: images,
                          featureModels: featureModels,
                          videos: videos,
                          gridCrossAxisCount: gridCrossAxisCount,
                          isMobile: width < 700,
                          horizontalPadding: isBigMobile ? width * .05 : 24,
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
