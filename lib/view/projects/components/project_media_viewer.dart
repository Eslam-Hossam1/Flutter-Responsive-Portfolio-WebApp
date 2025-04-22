import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:photo_view/photo_view.dart';
import 'animated_gradient_image_container.dart';
import 'hoverable_image_container.dart';

class ProjectMediaViewer extends StatelessWidget {
  final String name;
  final String description;
  final List<String> images;
  final List<String> videos;

  // Test URLs for demonstration
  static const List<String> testImages = [
    'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
    'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
    'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
    'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
    'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
  ];
  static const List<String> testVideos = [
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://samplelib.com/mp4/sample-5s.mp4'
  ];

  const ProjectMediaViewer(
      {Key? key,
      required this.name,
      required this.description,
      List<String>? images,
      List<String>? videos})
      : images = images ?? testImages,
        videos = videos ?? testVideos,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          name,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final isDesktop = width >= 900;
            final isTablet = width >= 600 && width < 900;
            final isMobile = width < 600;
            final gridCrossAxisCount = isDesktop ? 3 : (isTablet ? 3 : 3);
            return CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 16),
                    child: (isDesktop || isTablet)
                        ? SizedBox(
                            height: 400,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 3,
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
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.black,
                                      ),
                                      child: VideoGallery(
                                        videos: ProjectMediaViewer.testVideos,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 32),
                                Expanded(
                                  flex: 1,
                                  child: ImageGallery(
                                    images: ProjectMediaViewer.testImages,
                                    crossAxisCount: isTablet ? 2 : 3,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Column(
                            children: [
                              Text(
                                description,
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.white70),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 32),
                              SizedBox(
                                height: 220,
                                child: VideoGallery(
                                    videos: ProjectMediaViewer.testVideos),
                              ),
                              const SizedBox(height: 24),
                              SizedBox(
                                height: isMobile ? 350 : 220,
                                child: ImageGallery(
                                  images: ProjectMediaViewer.testImages,
                                  crossAxisCount: gridCrossAxisCount,
                                ),
                              ),
                            ],
                          ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class ImageGallery extends StatelessWidget {
  final List<String> images;
  final int crossAxisCount;
  const ImageGallery({required this.images, this.crossAxisCount = 3});

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
  const ImageGalleryDialog({required this.images, required this.initialIndex});
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
      insetPadding: const EdgeInsets.all(16),
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
                backgroundDecoration: const BoxDecoration(color: Colors.black),
              );
            },
          ),
          Positioned(
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed:
                  _currentIndex > 0 ? () => _goTo(_currentIndex - 1) : null,
            ),
          ),
          Positioned(
            right: 16,
            child: IconButton(
              icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
              onPressed: _currentIndex < widget.images.length - 1
                  ? () => _goTo(_currentIndex + 1)
                  : null,
            ),
          ),
          Positioned(
            top: 16,
            right: 16,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
    );
  }
}

class VideoGallery extends StatelessWidget {
  final List<String> videos;
  const VideoGallery({required this.videos});
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: videos.length,
      itemBuilder: (context, index) {
        return _VideoPlayerWidget(videoPath: videos[index]);
      },
    );
  }
}

class _VideoPlayerWidget extends StatefulWidget {
  final String videoPath;
  const _VideoPlayerWidget({required this.videoPath});
  @override
  State<_VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<_VideoPlayerWidget> {
  late VideoPlayerController _controller;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoPath)
      ..initialize().then((_) {
        setState(() {
          _chewieController = ChewieController(
            videoPlayerController: _controller,
            autoPlay: false,
            looping: false,
            showControls: true,
            allowFullScreen: true,
            allowMuting: true,
          );
        });
      });
  }

  @override
  void dispose() {
    _chewieController?.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _chewieController != null && _controller.value.isInitialized
          ? Chewie(controller: _chewieController!)
          : const CircularProgressIndicator(),
    );
  }
}
