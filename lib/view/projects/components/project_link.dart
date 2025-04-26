import 'package:flutter/material.dart';
import 'package:flutter_portfolio/model/projects_models_list.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectLinks extends StatelessWidget {
  final int index;
  const ProjectLinks({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FittedBox(
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    launchUrl(Uri.parse(projectList[index].link));
                  },
                  child: const Text('Check on Github',
                      style: TextStyle(color: Colors.white),
                      overflow: TextOverflow.ellipsis),
                ),
                IconButton(
                    onPressed: () {
                      launchUrl(Uri.parse(projectList[index].link));
                    },
                    icon: SvgPicture.asset('assets/icons/github.svg')),
              ],
            ),
          ),
          FittedBox(
            child: TextButton(
                onPressed: () {
                  launchUrl(Uri.parse(projectList[index].link));
                },
                child: const Text(
                  'Read More>>',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                      fontSize: 10),
                )),
          )
        ],
      ),
    );
  }
}
