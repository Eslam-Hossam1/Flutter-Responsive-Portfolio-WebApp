import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../res/constants.dart';

class DrawerImage extends StatefulWidget {
  const DrawerImage({super.key});

  @override
  State<DrawerImage> createState() => _DrawerImageState();
}

class _DrawerImageState extends State<DrawerImage> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showProfileDialog(context),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: Container(
          height: (120.w).clamp(100, 170),
          width: (120.w).clamp(100, 170),
          padding: const EdgeInsets.all(defaultPadding / 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.r),
            gradient: LinearGradient(
              colors: [
                Colors.pink,
                Colors.blue.shade900,
              ],
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.pink,
                  blurRadius: _isHovered ? 20 : 10,
                  offset: Offset(0, 2)),
              BoxShadow(
                  color: Colors.blue,
                  blurRadius: _isHovered ? 20 : 10,
                  offset: Offset(0, -2)),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40.r),
            child: Hero(
              tag: 'profile-image-hero',
              child: Image.asset(
                'assets/images/profile.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void _showProfileDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Close',
    barrierColor: Colors.black.withOpacity(0.6),
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (_, __, ___) => const SizedBox.shrink(),
    transitionBuilder: (context, anim, secondaryAnim, child) {
      final curved = CurvedAnimation(parent: anim, curve: Curves.easeOutCubic);
      return Opacity(
        opacity: anim.value,
        child: Transform.scale(
          scale: 0.95 + 0.05 * curved.value,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Material(
                color: Colors.transparent,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24.r),
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(40.r),
                      gradient: LinearGradient(
                        colors: [
                          Colors.pink,
                          Colors.blue.shade900,
                        ],
                      ),
                    ),
                    constraints: BoxConstraints(
                      maxWidth: 800.w,
                      maxHeight: 800.h,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40.r - 12),
                      child: Stack(
                        children: [
                          Hero(
                            tag: 'profile-image-hero',
                            child: InteractiveViewer(
                              minScale: 0.8,
                              maxScale: 4.0,
                              child: Image.asset(
                                'assets/images/profile.jpeg',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: IconButton(
                              onPressed: () => Navigator.of(context).maybePop(),
                              icon:
                                  const Icon(Icons.close, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
