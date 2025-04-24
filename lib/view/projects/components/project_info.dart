import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view/projects/components/project_deatail.dart';
import 'package:flutter_portfolio/view/projects/components/project_media_viewer.dart';
import 'package:get/get.dart';
import '../../../model/project_model.dart';
import '../../../res/constants.dart';
import '../../../view model/getx_controllers/projects_controller.dart';
import 'project_media_widgets.dart';

class ProjectStack extends StatefulWidget {
  final int index;
  const ProjectStack({super.key, required this.index});

  @override
  State<ProjectStack> createState() => _ProjectStackState();
}

class _ProjectStackState extends State<ProjectStack> {
  final controller = Get.put(ProjectController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        controller.onHover(widget.index, value);
      },
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProjectMediaViewer(
              name: projectList[widget.index].name,
              description: projectList[widget.index].description,
              images: projectList[widget.index].images,
              videos: projectList[widget.index].videos,
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(30),
      child: AnimatedContainer(
        padding: const EdgeInsets.only(
            left: defaultPadding, right: defaultPadding, top: defaultPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: bgColor,
          boxShadow: [
            BoxShadow(
              color: Colors.pink.withOpacity(0.1),
              offset: const Offset(-2, 0),
              blurRadius: 10,
            ),
            BoxShadow(
              color: Colors.blue.withOpacity(0.1),
              offset: const Offset(2, 0),
              blurRadius: 10,
            ),
          ],
        ),
        duration: const Duration(milliseconds: 500),
        child: ProjectDetail(index: widget.index),
      ),
    );
  }
}

class ProjectMediaGallery extends StatelessWidget {
  final List<String> images;
  final List<String> videos;
  const ProjectMediaGallery(
      {super.key, required this.images, required this.videos});

  @override
  Widget build(BuildContext context) {
    final showTabs = images.isNotEmpty && videos.isNotEmpty;
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.cardColor.withOpacity(0.97),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withOpacity(0.1),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      constraints: const BoxConstraints(maxHeight: 380, minHeight: 200),
      child: DefaultTabController(
        length: (images.isNotEmpty ? 1 : 0) + (videos.isNotEmpty ? 1 : 0),
        child: Column(
          children: [
            if (showTabs)
              TabBar(
                indicatorColor: theme.colorScheme.secondary,
                labelColor: theme.colorScheme.secondary,
                unselectedLabelColor: theme.textTheme.bodyMedium!.color,
                tabs: [
                  if (images.isNotEmpty)
                    const Tab(icon: Icon(Icons.image), text: 'Images'),
                  if (videos.isNotEmpty)
                    const Tab(icon: Icon(Icons.videocam), text: 'Videos'),
                ],
              ),
            Flexible(
              fit: FlexFit.loose,
              child: TabBarView(
                children: [
                  if (images.isNotEmpty) ImageGallery(images: images),
                  if (videos.isNotEmpty) VideoGallery(videos: videos),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
