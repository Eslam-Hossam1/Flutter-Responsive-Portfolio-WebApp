import 'package:flutter/material.dart';

class HoverableImageContainer extends StatefulWidget {
  final String imageUrl;
  final VoidCallback onTap;
  final double height;
  final double width;
  const HoverableImageContainer({
    required this.imageUrl,
    required this.onTap,
    this.height = 120,
    this.width = 120,
    Key? key,
  }) : super(key: key);

  @override
  State<HoverableImageContainer> createState() => _HoverableImageContainerState();
}

class _HoverableImageContainerState extends State<HoverableImageContainer> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Stack(
          children: [
            Container(
              height: widget.height,
              width: widget.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
                boxShadow: [
                  BoxShadow(
                    color: Colors.pink.withOpacity(0.08),
                    offset: const Offset(-2, 0),
                    blurRadius: 10,
                  ),
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.08),
                    offset: const Offset(2, 0),
                    blurRadius: 10,
                  ),
                ],
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.network(
                widget.imageUrl,
                fit: BoxFit.cover,
                height: widget.height,
                width: widget.width,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
                errorBuilder: (context, error, stackTrace) =>
                    const Center(child: Icon(Icons.broken_image, color: Colors.white38)),
              ),
            ),
            if (_isHovered)
              Container(
                height: widget.height,
                width: widget.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black.withOpacity(0.45),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
