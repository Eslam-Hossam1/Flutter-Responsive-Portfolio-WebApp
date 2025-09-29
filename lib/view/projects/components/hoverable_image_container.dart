import 'package:flutter/material.dart';
import 'package:flutter_portfolio/widgets/custom_project_grid_image.dart';

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
  State<HoverableImageContainer> createState() =>
      _HoverableImageContainerState();
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
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                  colors: [Colors.pinkAccent, Colors.blue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                //    color: Colors.black,
                boxShadow: [
                  BoxShadow(
                    color: Colors.pink.withOpacity(0.5),
                    offset: const Offset(-2, 0),
                    blurRadius: 10,
                  ),
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.5),
                    offset: const Offset(2, 0),
                    blurRadius: 10,
                  ),
                ],
              ),
              // clipBehavior: Clip.hardEdge,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(9),
                child: CustomProjectGridImage(
                  imageUrl: widget.imageUrl,
                  fit: BoxFit.cover,
                  height: widget.height,
                  width: widget.width,
                ),
              ),
            ),
            if (_isHovered)
              Container(
                height: widget.height,
                width: widget.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black.withOpacity(0.45),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
