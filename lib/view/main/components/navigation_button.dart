import 'package:flutter/material.dart';

class NavigationTextButton extends StatefulWidget {
  final VoidCallback onTap;
  final String text;
  final bool isActive;

  const NavigationTextButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.isActive,
  });

  @override
  State<NavigationTextButton> createState() => _NavigationTextButtonState();
}

class _NavigationTextButtonState extends State<NavigationTextButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    final isDesktop = width > 800;
    final isTiny = width <= 355;
    final baseStyle = isTiny
        ? Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(fontWeight: FontWeight.bold, fontSize: 10)
        : isDesktop
            ? Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(fontWeight: FontWeight.w800)
            : Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(fontWeight: FontWeight.bold);

    final active = widget.isActive;
    final hovered = _isHovered;

    // Colors for effects
    const gradientColors = [Colors.pinkAccent, Colors.blueAccent];

    Widget textWidget = Text(
      widget.text,
      style: baseStyle.copyWith(
        color: active ? Colors.white : Colors.white70,
        letterSpacing: active ? 0.6 : 0.2,
      ),
    );

    // Apply a subtle gradient to active text
    if (active) {
      textWidget = ShaderMask(
        shaderCallback: (bounds) => const LinearGradient(
          colors: gradientColors,
        ).createShader(bounds),
        blendMode: BlendMode.srcIn,
        child: textWidget,
      );
    }

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            // color: active
            //     ? Colors.pink.withOpacity(0.1)
            //     : hovered
            //         ? Colors.pink.withOpacity(0.04)
            //         : Colors.transparent,
            boxShadow: hovered || active
                ? [
                    BoxShadow(
                      color: Colors.pink.withOpacity(0.25),
                      offset: const Offset(-2, 0),
                      blurRadius: active ? 16 : 10,
                    ),
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.25),
                      offset: const Offset(2, 0),
                      blurRadius: active ? 16 : 10,
                    ),
                  ]
                : null,
            border: Border.all(
              color: active
                  ? Colors.white.withOpacity(0.25)
                  : Colors.white.withOpacity(0.08),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedScale(
                duration: const Duration(milliseconds: 160),
                scale: hovered ? 1.05 : 1.0,
                child: textWidget,
              ),
              const SizedBox(height: 6),
              // Underline indicator animates in on hover or when active
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 3,
                width: active
                    ? 28
                    : hovered
                        ? 20
                        : 0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  gradient: const LinearGradient(colors: gradientColors),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
