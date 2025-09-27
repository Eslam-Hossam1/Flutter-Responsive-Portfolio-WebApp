import 'package:flutter/material.dart';
import 'package:flutter_portfolio/widgets/app_cached_network_image.dart';

class AnimatedGradientImageContainer extends StatefulWidget {
  final String imageUrl;
  final VoidCallback onTap;
  final double height;
  final double width;
  const AnimatedGradientImageContainer({
    required this.imageUrl,
    required this.onTap,
    this.height = 120,
    this.width = 120,
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedGradientImageContainer> createState() => _AnimatedGradientImageContainerState();
}

class _AnimatedGradientImageContainerState extends State<AnimatedGradientImageContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
      lowerBound: 0.0,
      upperBound: 1.0,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onEnter(PointerEvent details) {
    setState(() => _isHovered = true);
    _controller.forward();
  }

  void _onExit(PointerEvent details) {
    setState(() => _isHovered = false);
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final double t = _controller.value;
            return Container(
              height: widget.height,
              width: widget.width,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: LinearGradient(
                  colors: [
                    Color.lerp(Colors.pinkAccent, Colors.blue, t)!,
                    Color.lerp(Colors.blue, Colors.pinkAccent, t)!,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.lerp(Colors.pink.withOpacity(0.2), Colors.blue.withOpacity(0.2), t)!,
                    offset: const Offset(-2, 0),
                    blurRadius: 14 + 6 * t,
                  ),
                  BoxShadow(
                    color: Color.lerp(Colors.blue.withOpacity(0.2), Colors.pink.withOpacity(0.2), t)!,
                    offset: const Offset(2, 0),
                    blurRadius: 14 + 6 * t,
                  ),
                ],
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                clipBehavior: Clip.hardEdge,
                child: AppCachedNetworkImage(
                  imageUrl: widget.imageUrl,
                  fit: BoxFit.cover,
                  height: widget.height,
                  width: widget.width,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
