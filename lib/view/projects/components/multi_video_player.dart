import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

// Global video state manager to preserve states across widget rebuilds
class VideoStateManager {
  static final VideoStateManager _instance = VideoStateManager._internal();
  factory VideoStateManager() => _instance;
  VideoStateManager._internal();

  final Map<String, Duration> _videoPositions = {};
  final Map<String, bool> _videoPlayingStates = {};

  void saveVideoState(String videoUrl, Duration position, bool isPlaying) {
    _videoPositions[videoUrl] = position;
    _videoPlayingStates[videoUrl] = isPlaying;
  }

  Duration? getVideoPosition(String videoUrl) {
    return _videoPositions[videoUrl];
  }

  bool? getVideoPlayingState(String videoUrl) {
    return _videoPlayingStates[videoUrl];
  }

  void clearVideoState(String videoUrl) {
    _videoPositions.remove(videoUrl);
    _videoPlayingStates.remove(videoUrl);
  }
}

class MultiVideoPlayer extends StatefulWidget {
  final List<String> videos;
  final bool autoPlay;
  final bool showControls;

  const MultiVideoPlayer({
    Key? key,
    required this.videos,
    this.autoPlay = false,
    this.showControls = true,
  }) : super(key: key);

  @override
  State<MultiVideoPlayer> createState() => _MultiVideoPlayerState();
}

class _MultiVideoPlayerState extends State<MultiVideoPlayer> {
  late PageController _pageController;
  late List<VideoPlayerController> _controllers;
  late List<ChewieController?> _chewieControllers;
  int _currentVideoIndex = 0;
  bool _isInitialized = false;

  final VideoStateManager _stateManager = VideoStateManager();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _initializeVideos();
  }

  Future<void> _initializeVideos() async {
    _controllers = [];
    _chewieControllers = List.filled(widget.videos.length, null);

    // Initialize all video controllers
    for (int i = 0; i < widget.videos.length; i++) {
      final controller =
          VideoPlayerController.networkUrl(Uri.parse(widget.videos[i]));
      _controllers.add(controller);

      try {
        await controller.initialize();

        final videoUrl = widget.videos[i];

        // Restore previous position if available
        final savedPosition = _stateManager.getVideoPosition(videoUrl);
        if (savedPosition != null) {
          controller.seekTo(savedPosition);
        }

        _chewieControllers[i] = ChewieController(
          videoPlayerController: controller,
          autoPlay: widget.autoPlay &&
              i == 0 &&
              savedPosition == null, // Only autoplay if no previous position
          looping: false,
          showControls: widget.showControls,
          allowFullScreen: true,
          allowMuting: true,
          showOptions: true,
        );

        // Add listener to track video position and playing state
        controller.addListener(() {
          _stateManager.saveVideoState(
              videoUrl, controller.value.position, controller.value.isPlaying);
        });

        // Restore playing state if it was playing before
        final savedPlayingState = _stateManager.getVideoPlayingState(videoUrl);
        if (savedPlayingState == true) {
          Future.delayed(const Duration(milliseconds: 100), () {
            if (mounted && controller.value.isInitialized) {
              controller.play();
            }
          });
        }
      } catch (e) {
        // Error initializing video - will show error state in UI
        _chewieControllers[i] = null;
      }
    }

    if (mounted) {
      setState(() {
        _isInitialized = true;
      });
    }
  }

  @override
  void dispose() {
    // Save current video states before disposing
    _saveVideoStates();

    _pageController.dispose();
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var chewieController in _chewieControllers) {
      chewieController?.dispose();
    }
    super.dispose();
  }

  void _saveVideoStates() {
    for (int i = 0; i < _controllers.length; i++) {
      if (_controllers[i].value.isInitialized) {
        final videoUrl = widget.videos[i];
        _stateManager.saveVideoState(videoUrl, _controllers[i].value.position,
            _controllers[i].value.isPlaying);
      }
    }
  }

  void _goToVideo(int index) {
    if (index >= 0 && index < widget.videos.length) {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _pauseAllVideos() {
    for (var chewieController in _chewieControllers) {
      chewieController?.pause();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black,
        ),
        clipBehavior: Clip.hardEdge,
        alignment: Alignment.center,
        child: const CircularProgressIndicator(color: Colors.white),
      );
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black,
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          // Video Player
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _pauseAllVideos();
                _currentVideoIndex = index;
              });
            },
            itemCount: widget.videos.length,
            itemBuilder: (context, index) {
              final chewieController = _chewieControllers[index];

              if (chewieController == null) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline,
                        color: Colors.white,
                        size: 48,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Failed to load video',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                );
              }

              return ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Chewie(controller: chewieController),
              );
            },
          ),

          // Navigation Controls
          if (widget.videos.length > 1) ...[
            // Previous Button
            if (_currentVideoIndex > 0)
              Positioned(
                left: 16,
                top: 0,
                bottom: 0,
                child: Center(
                  child: GestureDetector(
                    onTap: () => _goToVideo(_currentVideoIndex - 1),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Transform.translate(
                          offset: const Offset(6, 0),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            // Next Button
            if (_currentVideoIndex < widget.videos.length - 1)
              Positioned(
                right: 16,
                top: 0,
                bottom: 0,
                child: Center(
                  child: GestureDetector(
                    onTap: () => _goToVideo(_currentVideoIndex + 1),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Transform.translate(
                          offset: const Offset(-6, 0),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            // Video Counter
            Positioned(
              top: 16,
              right: 16,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  '${_currentVideoIndex + 1} / ${widget.videos.length}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
