import 'package:flutter/material.dart';
import 'package:flutter_portfolio/model/feature_model.dart';

import 'media_viewer_desktop.dart';
import 'media_viewer_mobile.dart';

class ProjectMediaViewer extends StatefulWidget {
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
  State<ProjectMediaViewer> createState() => _ProjectMediaViewerState();
}

class _ProjectMediaViewerState extends State<ProjectMediaViewer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isBigDesktop = width >= 1300;
    final isDesktop = width >= 1000 && width < 1300;
    final isTablet = width >= 600 && width < 1000;
    final isBigMobile = width >= 500 && width < 600;
    final isMobile = width < 700;
    final gridCrossAxisCount = isDesktop
        ? 3
        : (isTablet
            ? 2
            : isBigMobile
                ? 6
                : 4);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: isMobile
            ? IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              )
            : null,
        elevation: 0,
        title: Text(widget.name,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 24)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: (isBigDesktop || isDesktop || isTablet)
                      ? ProjectMediaDesktopLayout(
                          name: widget.name,
                          description: widget.description,
                          featureModels: widget.featureModels,
                          images: widget.images,
                          videos: widget.videos,
                          isTablet: isTablet,
                          horizontalPadding: isBigDesktop ? width * .07 : 24,
                          verticalPadding: isBigDesktop ? 36 : 16,
                        )
                      : ProjectMediaMobileLayout(
                          name: widget.name,
                          description: widget.description,
                          featureModels: widget.featureModels,
                          images: widget.images,
                          videos: widget.videos,
                          gridCrossAxisCount: gridCrossAxisCount,
                          isMobile: isMobile,
                          horizontalPadding: isBigMobile ? width * .05 : 24,
                          verticalPadding: isBigMobile ? 36 : 16,
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
