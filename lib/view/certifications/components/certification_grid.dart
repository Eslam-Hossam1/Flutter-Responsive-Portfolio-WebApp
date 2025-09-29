import 'package:flutter/material.dart';
import 'package:flutter_portfolio/model/certifications_models_list.dart';

import 'certificates_details.dart';

class CertificateGrid extends StatelessWidget {
  final int crossAxisCount;
  final double ratio;
  const CertificateGrid({super.key, this.crossAxisCount = 3, this.ratio = 1.3});
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      sliver: SliverGrid.builder(
        itemCount: certificateList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount, childAspectRatio: ratio),
        itemBuilder: (context, index) {
          return CertificateStack(index: index);
        },
      ),
    );
  }
}
