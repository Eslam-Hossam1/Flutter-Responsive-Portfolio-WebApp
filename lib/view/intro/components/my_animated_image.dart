import 'package:flutter/material.dart';
import '../../../res/constants.dart';

class MyAnimatedImage extends StatefulWidget {
  const MyAnimatedImage({
    Key? key,
    this.height = 300,
    this.width = 250,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  MyAnimatedImageState createState() => MyAnimatedImageState();
}

class MyAnimatedImageState extends State<MyAnimatedImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);

    _animation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, 0.02), // small vertical float
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Container(
        height: widget.height!,
        width: widget.width!,
        padding: const EdgeInsets.all(defaultPadding / 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            colors: [
              Colors.pinkAccent,
              Colors.blue,
            ],
          ),
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
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/profile.png'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
