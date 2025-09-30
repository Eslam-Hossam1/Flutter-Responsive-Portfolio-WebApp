import 'package:flutter/material.dart';
import 'package:flutter_portfolio/model/projects_models_list.dart';
import 'package:flutter_portfolio/view/projects/components/project_deatail.dart';
import 'package:flutter_portfolio/view/projects/components/project_details_view.dart';

import '../../../res/constants.dart';

class ProjectStack extends StatefulWidget {
  final int index;
  const ProjectStack({super.key, required this.index});

  @override
  State<ProjectStack> createState() => _ProjectStackState();
}

class _ProjectStackState extends State<ProjectStack> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
            pageBuilder: (context, animation, secondaryAnimation) =>
                ProjectDetailsView(
              githubLink: projectList[widget.index].link,
              name: projectList[widget.index].name,
              description: projectList[widget.index].description,
              featureModels: projectList[widget.index].featureModelsList,
              images: projectList[widget.index].images,
              videos: projectList[widget.index].videos,
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(
                vertical: defaultPadding, horizontal: defaultPadding),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(colors: [
                  Colors.pinkAccent,
                  Colors.blue,
                ]),
                boxShadow: [
                  BoxShadow(
                    color: Colors.pink,
                    offset: const Offset(-2, 0),
                    blurRadius: isHovered ? 20 : 10,
                  ),
                  BoxShadow(
                    color: Colors.blue,
                    offset: const Offset(2, 0),
                    blurRadius: isHovered ? 20 : 10,
                  ),
                ]),
            child: Container(
              padding: const EdgeInsets.only(
                  left: defaultPadding,
                  right: defaultPadding,
                  top: defaultPadding),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: bgColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.pink.withOpacity(0.1),
                    offset: const Offset(-2, 0),
                    blurRadius: 10,
                  ),
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.1),
                    offset: const Offset(2, 0),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: ProjectDetail(index: widget.index),
            ),
          ),
        ),
      ),
    );
  }
}
