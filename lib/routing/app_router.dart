import 'package:flutter/material.dart';
import 'package:flutter_portfolio/routing/routs.dart';
import 'package:flutter_portfolio/view/main/main_view.dart';
import 'package:flutter_portfolio/view/projects/components/project_details_view.dart';
import 'package:flutter_portfolio/view/projects/components/project_media_widgets.dart';
import 'package:flutter_portfolio/view/splash/splash_view.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_portfolio/model/projects_models_list.dart';

class AppRouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    initialLocation: RoutePaths.splash,
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: RoutePaths.splash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: RoutePaths.main,
        builder: (context, state) => const MainView(),
      ),
      GoRoute(
        path: RoutePaths.projectDetails,
        builder: (context, state) {
          final idStr = state.pathParameters['id']!;
          final id = int.parse(idStr);
          final p = projectList[id];
          return ProjectDetailsView(
            projectId: id,
            name: p.name,
            description: p.description,
            images: p.images,
            videos: p.videos,
            featureModels: p.featureModelsList,
            githubLink: p.link,
          );
        },
        routes: [
          GoRoute(
            path: 'viewer/:imageIndex',
            builder: (context, state) {
              final idStr = state.pathParameters['id']!;
              final id = int.parse(idStr);
              final indexStr = state.pathParameters['imageIndex']!;
              final imageIndex = int.parse(indexStr);
              final images = projectList[id].images;
              return ImageGalleryDialog(
                images: images,
                initialIndex: imageIndex,
              );
            },
          ),
        ],
      ),
    ],
  );
}
