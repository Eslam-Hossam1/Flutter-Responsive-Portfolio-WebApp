import 'package:flutter/material.dart';
import 'package:flutter_portfolio/res/constants.dart';
import 'package:flutter_portfolio/view%20model/controller.dart';
import 'package:flutter_portfolio/view%20model/responsive.dart';
import 'package:flutter_portfolio/view/main/components/navigation_button_list.dart';
import 'package:flutter_portfolio/view/intro/components/intro_body.dart';
import 'package:flutter_portfolio/view/intro/components/side_menu_button.dart';
import 'package:flutter_portfolio/view/intro/components/social_media_list.dart';
import 'package:flutter_portfolio/view/projects/components/title_text.dart';
import 'package:flutter_portfolio/view/projects/components/projects_grid.dart';
import 'package:flutter_portfolio/view/certifications/components/certification_grid.dart';

import 'components/drawer/drawer.dart';

class MainView extends StatefulWidget {
  const MainView({
    super.key,
  });
  // pages is ignored in one-page mode but kept for API compatibility

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  void initState() {
    super.initState();
    setupSectionScrollListener();
  }

  @override
  Widget build(BuildContext context) {
    final minSectionHeight = MediaQuery.of(context).size.height -
        (defaultPadding); // approx header spacing
    return Scaffold(
      drawer: const CustomDrawer(),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: defaultPadding / 2),
            const NavigationButtonList(),
            const SizedBox(height: defaultPadding / 2),
            Expanded(
              flex: 9,
              child: CustomScrollView(
                controller: scrollController,
                slivers: [
                  // Intro Section Anchor
                  SliverToBoxAdapter(
                    child: KeyedSubtree(
                      key: introSectionKey,
                      child: SizedBox(
                        height: minSectionHeight,
                        child: Row(
                          children: [
                            SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.05),
                            if (!Responsive.isLargeMobile(context))
                              const SocialMediaIconList(),
                            SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.05),
                            const Expanded(child: IntroBody()),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Projects Section Anchor + Content
                  if (Responsive.isLargeMobile(context))
                    const SliverToBoxAdapter(
                        child: SizedBox(height: defaultPadding)),
                  SliverToBoxAdapter(
                    child: KeyedSubtree(
                      key: projectsSectionKey,
                      child:
                          const TitleText(prefix: 'Latest ', title: 'Projects'),
                    ),
                  ),
                  const SliverToBoxAdapter(
                      child: SizedBox(height: defaultPadding)),
                  Responsive(
                    desktop: ProjectGrid(crossAxisCount: 3),
                    extraLargeScreen: ProjectGrid(crossAxisCount: 4),
                    largeMobile: ProjectGrid(crossAxisCount: 1, ratio: 1.8),
                    mobile: ProjectGrid(crossAxisCount: 1, ratio: 1.5),
                    tablet: ProjectGrid(ratio: 1.4, crossAxisCount: 2),
                  ),

                  // Certifications Section Anchor + Content
                  if (Responsive.isLargeMobile(context))
                    const SliverToBoxAdapter(
                        child: SizedBox(height: defaultPadding)),
                  SliverToBoxAdapter(
                    child: KeyedSubtree(
                      key: certificationsSectionKey,
                      child: const TitleText(title: 'Certifications'),
                    ),
                  ),
                  const SliverToBoxAdapter(
                      child: SizedBox(height: defaultPadding)),
                  Responsive(
                    desktop: CertificateGrid(crossAxisCount: 3, ratio: 1.4),
                    extraLargeScreen:
                        CertificateGrid(crossAxisCount: 4, ratio: 1.4),
                    largeMobile: CertificateGrid(crossAxisCount: 1, ratio: 1.8),
                    mobile: CertificateGrid(crossAxisCount: 1, ratio: 1.2),
                    tablet: CertificateGrid(ratio: 1.3, crossAxisCount: 2),
                  ),

                  // Bottom padding
                  const SliverToBoxAdapter(child: SizedBox(height: 120)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
