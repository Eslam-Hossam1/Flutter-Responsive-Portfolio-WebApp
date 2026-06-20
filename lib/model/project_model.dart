import 'package:flutter_portfolio/model/feature_model.dart';

class Project {
  final String name;
  final String description;
  final List<String> images;
  final List<String> videos;
  final List<FeatureModel> featureModelsList;
  final String link;
  final String thumbnail;
  const Project({
    required this.name,
    required this.description,
    required this.images,
    required this.videos,
    required this.link,
    required this.featureModelsList,
    required this.thumbnail,
  });
}
