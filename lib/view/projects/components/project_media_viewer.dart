import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:photo_view/photo_view.dart';

class ProjectMediaViewer extends StatelessWidget {
  final List<String> images;
  final List<String> videos;

  const ProjectMediaViewer(
      {Key? key, required this.images, required this.videos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.8),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 600;
            return Material(
              color: Colors.transparent,
              child: Container(
                width: isMobile ? constraints.maxWidth * 0.95 : 700,
                height: isMobile ? constraints.maxHeight * 0.8 : 500,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: DefaultTabController(
                  length:
                      (images.isNotEmpty ? 1 : 0) + (videos.isNotEmpty ? 1 : 0),
                  child: Column(
                    children: [
                      if (images.isNotEmpty && videos.isNotEmpty)
                        TabBar(
                          indicatorColor:
                              Theme.of(context).colorScheme.secondary,
                          labelColor: Theme.of(context).colorScheme.secondary,
                          unselectedLabelColor:
                              Theme.of(context).textTheme.bodyMedium!.color,
                          tabs: [
                            if (images.isNotEmpty)
                              const Tab(
                                  icon: Icon(Icons.image), text: 'Images'),
                            if (videos.isNotEmpty)
                              const Tab(
                                  icon: Icon(Icons.videocam), text: 'Videos'),
                          ],
                        ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            if (images.isNotEmpty) ImageGallery(images: images),
                            if (videos.isNotEmpty) VideoGallery(videos: videos),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ImageGallery extends StatelessWidget {
  final List<String> images;
  const ImageGallery({required this.images});
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: images.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: PhotoView(
            imageProvider: AssetImage(images[index]),
            backgroundDecoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
          ),
        );
      },
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
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
          : const CircularProgressIndicator(),
    );
  }
}
