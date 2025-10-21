import 'package:flutter/material.dart';
import 'package:flutter_portfolio/res/constants.dart';

class ImageWithBackgroundPlaceholder extends StatelessWidget {
  final String imagePath;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  const ImageWithBackgroundPlaceholder({
    super.key,
    required this.imagePath,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius;
    final image = Image.asset(
      imagePath,
      fit: fit,
      frameBuilder: (context, child, frame, sync) {
        if (frame == null) {
          return Container(
            color: bgColor,
          );
        }

        return child;
      },
      errorBuilder: (context, error, stackTrace) => SizedBox(
        child: Container(
          color: bgColor,
          child: const Center(
            child: Icon(
              Icons.broken_image,
              color: Colors.white38,
            ),
          ),
        ),
      ),
    );

    if (radius != null) {
      return ClipRRect(borderRadius: radius, child: image);
    }
    return image;
  }
}
