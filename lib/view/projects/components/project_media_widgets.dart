import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_portfolio/routing/browser_routing_helper.dart';
import 'hoverable_image_container.dart';
import 'package:photo_view/photo_view.dart';
import 'multi_video_player.dart';
import 'package:go_router/go_router.dart';

class VideoGalleryWithGradientContainer extends StatelessWidget {
  final List<String> videos;

  const VideoGalleryWithGradientContainer({
    required this.videos,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(
            colors: [Colors.pinkAccent, Colors.blue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(4),
        child: ClipRRect(
          borderRadius:
              BorderRadius.circular(20), // Inner radius (24 - 4 padding)
          child: MultiVideoPlayer(
            videos: videos,
            autoPlay: false,
            showControls: true,
          ),
        ),
      ),
    );
  }
}

class ImageGallery extends StatefulWidget {
  final int projectId;
  final List<String> images;
  final int crossAxisCount;
  const ImageGallery({
    required this.images,
    required this.projectId,
    this.crossAxisCount = 3,
    Key? key,
  }) : super(key: key);

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  bool _showAllImages = false;
  static const int _initialImageCount = 12;

  @override
  Widget build(BuildContext context) {
    final displayImages = _showAllImages
        ? widget.images
        : widget.images.take(_initialImageCount).toList();
    final hasMoreImages = widget.images.length > _initialImageCount;

    return Column(
      children: [
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: widget.crossAxisCount,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          itemCount: displayImages.length,
          itemBuilder: (context, index) {
            return HoverableImageContainer(
              imageUrl: displayImages[index],
              onTap: () {
                final initialIndex =
                    widget.images.indexOf(displayImages[index]);
                context.push(
                    '/project-details/${widget.projectId}/viewer/$initialIndex');
              },
              height: 120,
              width: 120,
            );
          },
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        ),
        if (hasMoreImages && !_showAllImages) ...[
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _showAllImages = true;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Show More',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class ImageGalleryDialog extends StatefulWidget {
  final List<String> images;
  final int initialIndex;

  const ImageGalleryDialog({
    required this.images,
    required this.initialIndex,
    Key? key,
  }) : super(key: key);

  @override
  State<ImageGalleryDialog> createState() => _ImageGalleryDialogState();
}

class _ImageGalleryDialogState extends State<ImageGalleryDialog> {
  late PageController _controller;
  late int _currentIndex;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _controller = PageController(initialPage: _currentIndex);
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _goTo(int newIndex) {
    if (newIndex >= 0 && newIndex < widget.images.length) {
      setState(() => _currentIndex = newIndex);
      _controller.animateToPage(
        newIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _handleKeyPress(KeyEvent event) {
    if (event is KeyDownEvent) {
      switch (event.logicalKey) {
        case LogicalKeyboardKey.arrowLeft:
          if (_currentIndex > 0) _goTo(_currentIndex - 1);
          break;
        case LogicalKeyboardKey.arrowRight:
          if (_currentIndex < widget.images.length - 1) {
            _goTo(_currentIndex + 1);
          }
          break;
        case LogicalKeyboardKey.space:
          // Space can be used for navigation on web
          if (_currentIndex < widget.images.length - 1) {
            _goTo(_currentIndex + 1);
          }
          break;
        case LogicalKeyboardKey.home:
          _goTo(0);
          break;
        case LogicalKeyboardKey.end:
          _goTo(widget.images.length - 1);
          break;
      }
    }
  }

  // Get responsive spacing based on screen width
  double _getHorizontalSpacing(double width) {
    if (width < 360) return 4.0; // Very small phones
    if (width < 420) return 8.0; // Small phones
    if (width < 768) return 16.0; // Regular phones
    return 24.0; // Tablets and larger
  }

  double _getTopSpacing(double width) {
    if (width < 360) return 16.0; // Account for status bar
    if (width < 420) return 24.0;
    if (width < 768) return 32.0;
    return 40.0;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final horizontalSpacing = _getHorizontalSpacing(width);
    final topSpacing = _getTopSpacing(width);

    return KeyboardListener(
      focusNode: _focusNode,
      autofocus: true,
      onKeyEvent: _handleKeyPress,
      child: Dialog(
        backgroundColor: Colors.black,
        insetPadding: EdgeInsets.zero,
        child: SizedBox.expand(
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Main image viewer with safe padding
              Positioned.fill(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: topSpacing + 40, // Space for close button
                    bottom: 60, // Space for counter if needed
                    left: (horizontalSpacing * 2) + 44, // Space for nav buttons
                    right: (horizontalSpacing * 2) + 44,
                  ),
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: widget.images.length,
                    onPageChanged: (i) => setState(() => _currentIndex = i),
                    itemBuilder: (context, index) {
                      return PhotoView(
                        imageProvider: NetworkImage(widget.images[index]),
                        backgroundDecoration:
                            const BoxDecoration(color: Colors.black),
                        minScale: PhotoViewComputedScale.contained,
                        maxScale: PhotoViewComputedScale.covered * 2.0,
                        initialScale: PhotoViewComputedScale.contained,
                      );
                    },
                  ),
                ),
              ),

              // Navigation buttons - positioned outside image area
              if (_currentIndex > 0)
                Positioned(
                  left: horizontalSpacing,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(color: Colors.white24, width: 1),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: 20,
                        ),
                        onPressed: () => _goTo(_currentIndex - 1),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                ),

              if (_currentIndex < widget.images.length - 1)
                Positioned(
                  right: horizontalSpacing,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(color: Colors.white24, width: 1),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 20,
                        ),
                        onPressed: () => _goTo(_currentIndex + 1),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                ),

              // Close button
              Positioned(
                top: topSpacing,
                right: horizontalSpacing,
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(color: Colors.white24, width: 1),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 20,
                    ),
                    onPressed: () => BrowserRoutingHelper.back(),
                    padding: EdgeInsets.zero,
                  ),
                ),
              ),

              // Image counter
              if (widget.images.length > 1)
                Positioned(
                  bottom: 15,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white24, width: 1),
                    ),
                    child: Text(
                      '${_currentIndex + 1} / ${widget.images.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
