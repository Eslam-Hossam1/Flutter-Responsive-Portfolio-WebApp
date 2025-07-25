import 'package:flutter/material.dart';
import 'hoverable_image_container.dart';
import 'package:photo_view/photo_view.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoGalleryWithGradientContainer extends StatelessWidget {
  final List<String> videos;

  final ChewieController? chewieController;

  const VideoGalleryWithGradientContainer(
      {required this.videos, Key? key, required this.chewieController})
      : super(key: key);

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
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black,
          ),
          child: VideoGallery(
            videos: videos,
            chewieController: chewieController,
          ),
        ),
      ),
    );
  }
}

class ImageGallery extends StatelessWidget {
  final List<String> images;
  final int crossAxisCount;
  const ImageGallery({required this.images, this.crossAxisCount = 3, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return HoverableImageContainer(
          imageUrl: images[index],
          onTap: () {
            showDialog(
              context: context,
              builder: (_) => ImageGalleryDialog(
                images: images,
                initialIndex: index,
              ),
            );
          },
          height: 120,
          width: 120,
        );
      },
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
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

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _controller = PageController(initialPage: _currentIndex);
  }

  void _goTo(int newIndex) {
    if (newIndex >= 0 && newIndex < widget.images.length) {
      setState(() => _currentIndex = newIndex);
      _controller.jumpToPage(newIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.black,
      insetPadding: EdgeInsets.zero,
      child: SizedBox.expand(
        child: Stack(
          alignment: Alignment.center,
          children: [
            PageView.builder(
              controller: _controller,
              itemCount: widget.images.length,
              onPageChanged: (i) => setState(() => _currentIndex = i),
              itemBuilder: (context, index) {
                return PhotoView(
                  imageProvider: NetworkImage(widget.images[index]),
                  backgroundDecoration:
                      const BoxDecoration(color: Colors.black),
                );
              },
            ),
            if (_currentIndex > 0)
              Positioned(
                left: 16,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () => _goTo(_currentIndex - 1),
                ),
              ),
            if (_currentIndex < widget.images.length - 1)
              Positioned(
                right: 16,
                child: IconButton(
                  icon:
                      const Icon(Icons.arrow_forward_ios, color: Colors.white),
                  onPressed: () => _goTo(_currentIndex + 1),
                ),
              ),
            Positioned(
              top: 32,
              right: 16,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoGallery extends StatelessWidget {
  final List<String> videos;
  final ChewieController? chewieController;

  const VideoGallery(
      {required this.videos, Key? key, required this.chewieController})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: videos.length,
      itemBuilder: (context, index) {
        return _VideoPlayerWidget(
          videoPath: videos[index],
          chewieController: chewieController,
        );
      },
    );
  }
}

class _VideoPlayerWidget extends StatelessWidget {
  final String videoPath;
  final ChewieController? chewieController;

  const _VideoPlayerWidget(
      {required this.videoPath, Key? key, required this.chewieController})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      //&& _controller.value.isInitialized
      child: chewieController != null
          ? Chewie(controller: chewieController!)
          : const CircularProgressIndicator(),
    );
  }
}
