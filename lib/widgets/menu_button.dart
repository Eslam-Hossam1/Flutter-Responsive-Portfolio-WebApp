import 'package:flutter/material.dart';
import '../../../res/constants.dart';

class MenuButton extends StatefulWidget {
  final VoidCallback? onTap;
  const MenuButton({super.key, this.onTap});

  @override
  State<MenuButton> createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      borderRadius: BorderRadius.circular(20),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: defaultPadding * 2.0,
          width: defaultPadding * 2.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black,
              boxShadow: [
                BoxShadow(
                  color: Colors.pinkAccent.withOpacity(.5),
                  offset: const Offset(1, 1),
                  blurRadius:
                      _isHovered ? defaultPadding / 1.5 : defaultPadding / 3,
                ),
                BoxShadow(
                  color: Colors.blue.withOpacity(.5),
                  offset: const Offset(-1, -1),
                  blurRadius:
                      _isHovered ? defaultPadding / 2 : defaultPadding / 4,
                ),
              ]),
          child: Container(
            height: defaultPadding * 2.0,
            width: defaultPadding * 2.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
                boxShadow: [
                  BoxShadow(
                    color: Colors.pinkAccent.withOpacity(.5),
                    offset: const Offset(1, 1),
                    //   blurRadius: _isHovered ? defaultPadding : defaultPadding / 2,
                  ),
                  BoxShadow(
                    color: Colors.blue.withOpacity(.5),
                    offset: const Offset(-1, -1),
                    // blurRadius: _isHovered ? defaultPadding : defaultPadding / 2,
                  ),
                ]),
            child: Center(
                child: ShaderMask(
              shaderCallback: (bounds) {
                return LinearGradient(
                        colors: [Colors.pink, Colors.blue.shade900])
                    .createShader(bounds);
              },
              child: const Icon(
                Icons.menu,
                color: Colors.white,
                size: defaultPadding * 1.2,
              ),
            )),
          ),
        ),
      ),
    );
  }
}
