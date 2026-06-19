import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/model/projects_models_list.dart';
import 'package:go_router/go_router.dart';

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
    final project = projectList[widget.index];
    final thumbnailUrl = project.images.isNotEmpty ? project.images.first : '';

    return GestureDetector(
      onTap: () {
        context.push('/project-details/${widget.index}');
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(
              vertical: defaultPadding, horizontal: defaultPadding),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(colors: [
              Colors.pinkAccent,
              Colors.blue,
            ]),
            boxShadow: [
              BoxShadow(
                color: Colors.pink,
                offset: const Offset(-2, 0),
                blurRadius: isHovered ? 22 : 10,
              ),
              BoxShadow(
                color: Colors.blue,
                offset: const Offset(2, 0),
                blurRadius: isHovered ? 22 : 10,
              ),
            ],
          ),
          padding: const EdgeInsets.all(2.5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Stack(
              fit: StackFit.expand,
              children: [
                // ── Thumbnail ──────────────────────────────────────────
                if (thumbnailUrl.isNotEmpty)
                  CachedNetworkImage(
                    imageUrl: thumbnailUrl,
                    fit: BoxFit.cover,
                    placeholder: (_, __) => Container(color: bgColor),
                    errorWidget: (_, __, ___) => Container(
                      color: bgColor,
                      child: const Icon(Icons.broken_image,
                          color: Colors.white38),
                    ),
                  )
                else
                  Container(color: bgColor),

                // ── Persistent dark vignette at the bottom ─────────────
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.55),
                        ],
                        stops: const [0.55, 1.0],
                      ),
                    ),
                  ),
                ),

                // ── Hover overlay (darkens the whole card) ─────────────
                AnimatedOpacity(
                  opacity: isHovered ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    color: Colors.black.withOpacity(0.35),
                  ),
                ),

                // ── Project name at bottom ─────────────────────────────
                Positioned(
                  left: 10,
                  right: 10,
                  bottom: 10,
                  child: AnimatedSlide(
                    offset: isHovered ? Offset.zero : const Offset(0, 0.12),
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: isHovered
                            ? Colors.black.withOpacity(0.70)
                            : Colors.black.withOpacity(0.55),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        project.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          letterSpacing: 0.3,
                          shadows: [
                            Shadow(
                              color: Colors.black,
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
