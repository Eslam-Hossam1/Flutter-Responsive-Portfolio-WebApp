import 'package:flutter/material.dart';
import 'package:flutter_portfolio/res/constants.dart';

class CustomProjectGridImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  const CustomProjectGridImage({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.width,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius;
    final image = Image.network(
      imageUrl,
      height: height,
      width: width,
      fit: fit,
      frameBuilder: (context, child, frame, sync) {
        if (frame == null) {
          return SizedBox(
            height: height,
            width: width,
            child: Container(
              color: bgColor,
            ),
          );
        }

        return child;
      },
      loadingBuilder: (context, child, loadingProgress) {
        // If loadingProgress is null, the image has finished loading
        if (loadingProgress == null) {
          return child; // Return the loaded image
        }

        return SizedBox(
          height: height,
          width: width,
          child: Container(
            color: bgColor,
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) => SizedBox(
        height: height,
        width: width,
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
