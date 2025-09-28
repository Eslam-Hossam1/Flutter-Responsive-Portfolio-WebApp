import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view%20model/getx_controllers/certification_controller.dart';
import 'package:flutter_portfolio/view/projects/components/title_text.dart';
import 'package:get/get.dart';
import '../../res/constants.dart';
import '../../view model/responsive.dart';
import 'components/certification_grid.dart';

class Certifications extends StatefulWidget {
  Certifications({super.key});

  @override
  State<Certifications> createState() => _CertificationsState();
}

class _CertificationsState extends State<Certifications>
    with AutomaticKeepAliveClientMixin {
  final controller = Get.put(CertificationController());

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomScrollView(
      slivers: [
        if (Responsive.isLargeMobile(context))
          const SliverToBoxAdapter(
            child: SizedBox(
              height: defaultPadding,
            ),
          ),
        const SliverToBoxAdapter(child: TitleText(title: 'Certifications')),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: defaultPadding,
          ),
        ),
        Responsive(
            desktop: CertificateGrid(
              crossAxisCount: 3,
              ratio: 1.4,
            ),
            extraLargeScreen: CertificateGrid(crossAxisCount: 4, ratio: 1.4),
            largeMobile: CertificateGrid(crossAxisCount: 1, ratio: 1.8),
            mobile: CertificateGrid(crossAxisCount: 1, ratio: 1.2),
            tablet: CertificateGrid(
              ratio: 1.3,
              crossAxisCount: 2,
            ))
      ],
    );
  }
}
