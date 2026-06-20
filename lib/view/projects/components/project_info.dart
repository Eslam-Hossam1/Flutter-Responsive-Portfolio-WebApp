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
    final thumbnailPath = project.thumbnail;

    return GestureDetector(
      onTap: () => context.push('/project-details/${widget.index}'),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: defaultPadding, horizontal: defaultPadding),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              // neon glow border
              gradient: const LinearGradient(
                colors: [Colors.pinkAccent, Colors.blueAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.pinkAccent.withOpacity(isHovered ? 0.6 : 0.3),
                  offset: const Offset(-3, 0),
                  blurRadius: isHovered ? 24 : 12,
                ),
                BoxShadow(
                  color: Colors.blueAccent.withOpacity(isHovered ? 0.6 : 0.3),
                  offset: const Offset(3, 0),
                  blurRadius: isHovered ? 24 : 12,
                ),
              ],
            ),
            padding: const EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // ── Thumbnail (top ~70 %) ──────────────────────────────
                  Expanded(
                    flex: 7,
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(17)),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          // image with scale-on-hover
                          AnimatedScale(
                            scale: isHovered ? 1.07 : 1.0,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeOut,
                            child: thumbnailPath.isNotEmpty
                                ? Image.asset(
                                    thumbnailPath,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) =>
                                        Container(
                                      color: bgColor,
                                      child: const Icon(Icons.broken_image,
                                          color: Colors.white38),
                                    ),
                                  )
                                : Container(color: bgColor),
                          ),
                          // subtle hover dim
                          AnimatedOpacity(
                            opacity: isHovered ? 0.28 : 0.0,
                            duration: const Duration(milliseconds: 300),
                            child: ColoredBox(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // ── Title panel (bottom ~30 %) ─────────────────────────
                  Expanded(
                    flex: 3,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        color: isHovered
                            ? const Color(0xFF0E0E18)
                            : const Color(0xFF12121E),
                        borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(17)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.55),
                            offset: const Offset(0, -6),
                            blurRadius: 14,
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Project name – always fully visible
                          ShaderMask(
                            blendMode: BlendMode.srcIn,
                            shaderCallback: (bounds) => isHovered
                                ? const LinearGradient(
                                    colors: [
                                      Colors.pinkAccent,
                                      Colors.blueAccent
                                    ],
                                  ).createShader(bounds)
                                : const LinearGradient(
                                    colors: [Colors.white, Colors.white70],
                                  ).createShader(bounds),
                            child: Text(
                              project.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                                letterSpacing: 0.3,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),

                          const SizedBox(height: 6),

                          // "View Project →" – slides in on hover
                          AnimatedSlide(
                            offset: isHovered
                                ? Offset.zero
                                : const Offset(-0.15, 0),
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                            child: AnimatedOpacity(
                              opacity: isHovered ? 1.0 : 0.0,
                              duration: const Duration(milliseconds: 250),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'View Project',
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      letterSpacing: 0.4,
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Icon(
                                    Icons.arrow_forward_rounded,
                                    color: Colors.blueAccent,
                                    size: 13,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
