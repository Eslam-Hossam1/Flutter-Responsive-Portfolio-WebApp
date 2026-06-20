import 'package:flutter/material.dart';
import 'package:flutter_portfolio/model/projects_models_list.dart';
import 'package:flutter_portfolio/view%20model/responsive.dart';
import 'package:flutter_portfolio/view/projects/components/project_info.dart';
import 'package:get/get.dart';

import '../../../view model/getx_controllers/projects_controller.dart';

class ProjectGrid extends StatelessWidget {
  final int crossAxisCount;
  final double? ratio;
  ProjectGrid({super.key, this.crossAxisCount = 3, this.ratio});
  final controller = Get.put(ProjectController());
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      sliver: SliverGrid.builder(
        itemCount: projectList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio:
                ratio ?? (Responsive.isDesktop(context) ? 1.2 : 1.0)),
        itemBuilder: (context, index) {
          return ProjectStack(index: index);
        },
      ),
    );
  }
}
