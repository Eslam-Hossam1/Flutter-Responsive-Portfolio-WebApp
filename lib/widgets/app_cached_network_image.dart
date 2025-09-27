import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/res/constants.dart';

class AppCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  const AppCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius;
    final image = CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      width: width,
      fit: fit,
      fadeInDuration: const Duration(milliseconds: 250),
      progressIndicatorBuilder: (context, url, progress) => Center(
        child: SizedBox(
          height: height,
          width: width,
          child: Container(
            color: const Color.fromARGB(255, 1, 11, 44),
          ),
        ),
      ),
      errorWidget: (context, url, error) => Center(
        child: SizedBox(
          height: height,
          width: width,
          child: Container(
            color: bgColor,
            child: const Center(
                child: Icon(
              Icons.broken_image,
              color: Colors.white38,
            )),
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
