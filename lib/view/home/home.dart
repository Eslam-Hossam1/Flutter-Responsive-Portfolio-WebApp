import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view/certifications/certifications.dart';
import 'package:flutter_portfolio/view/intro/introduction.dart';
import 'package:flutter_portfolio/view/main/main_view.dart';
import 'package:flutter_portfolio/view/projects/project_view.dart';
import 'package:flutter_portfolio/model/projects_models_list.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:flutter_portfolio/view model/getx_controllers/projects_controller.dart';
import 'package:flutter_portfolio/view model/getx_controllers/certification_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _warmUp = true;
  @override
  void initState() {
    super.initState();
    // Precache commonly used images after first frame so context is available
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Assets used in nav and drawer
      await precacheImage(const AssetImage('assets/images/triange_icon.png'), context);
      await precacheImage(const AssetImage('assets/images/profile.jpeg'), context);

      // Precache a few heavy network images from projects to avoid jank on first visit
      final urls = <String>[];
      if (projectList.isNotEmpty) {
        // Take first 3 images of first 2 projects if available
        for (var i = 0; i < projectList.length && i < 2; i++) {
          final images = projectList[i].images;
          for (var j = 0; j < images.length && j < 3; j++) {
            urls.add(images[j]);
          }
        }
      }
      for (final url in urls) {
        try {
          // Use CachedNetworkImageProvider to warm the same cache used by widgets
          await precacheImage(CachedNetworkImageProvider(url), context);
        } catch (_) {
          // Ignore failures silently; caching is best-effort
        }
      }

      // Eagerly register controllers so the first visit doesn't spend time constructing them
      if (!Get.isRegistered<ProjectController>()) {
        Get.put(ProjectController(), permanent: true);
      }
      if (!Get.isRegistered<CertificationController>()) {
        Get.put(CertificationController(), permanent: true);
      }

      // Remove warm-up overlays after first frame
      if (mounted) setState(() => _warmUp = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MainView(pages: [
          Introduction(),
          // Projects and Certifications are stateful (kept alive) in their own files
          ProjectsView(),
          Certifications(),
        ]),
        if (_warmUp)
          Offstage(
            offstage: true,
            child: TickerMode(
              enabled: false,
              child: Column(
                children: [
                  // Build heavy pages once offstage to warm layouts/shaders
                  const SizedBox.shrink(),
                  HeroMode(enabled: false, child: ProjectsView()),
                  HeroMode(enabled: false, child: Certifications()),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
