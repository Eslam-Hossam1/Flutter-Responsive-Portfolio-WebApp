import 'package:flutter/material.dart';

import '../../../res/constants.dart';

class MyAnimatedImage extends StatefulWidget {
  const MyAnimatedImage({Key? key, this.height = 300, this.width = 250})
      : super(key: key);
  final double? width;
  final double? height;
  @override
  MyAnimatedImageState createState() => MyAnimatedImageState();
}

class MyAnimatedImageState extends State<MyAnimatedImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true); // Repeat the animation loop
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final value = _controller.value;
        return Transform.translate(
          offset: Offset(0, 2 * value), // Move the container up and down
          child: Container(
            height: widget.height!,
            width: widget.width!,
            padding: const EdgeInsets.all(defaultPadding / 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: const LinearGradient(colors: [
                Colors.pinkAccent,
                Colors.blue,
              ]),
              boxShadow: const [
                BoxShadow(
                  color: Colors.pink,
                  offset: Offset(-2, 0),
                  blurRadius: 20,
                ),
                BoxShadow(
                  color: Colors.blue,
                  offset: Offset(2, 0),
                  blurRadius: 20,
                ),
              ],
            ),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(25)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  'assets/images/profile.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
