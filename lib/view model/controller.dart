import 'package:flutter/material.dart';

/// One-page scroll controller (Option A)
final ScrollController scrollController = ScrollController();

/// Tracks the currently selected section index for styling active navigation buttons.
final ValueNotifier<int> currentPageIndex = ValueNotifier<int>(0);

/// Prevents spamming navigation while an animation is in progress.
final ValueNotifier<bool> isNavigating = ValueNotifier<bool>(false);

/// Anchor keys for sections in the one-page scroll.
final GlobalKey introSectionKey = GlobalKey(debugLabel: 'intro_section');
final GlobalKey projectsSectionKey = GlobalKey(debugLabel: 'projects_section');
final GlobalKey certificationsSectionKey = GlobalKey(debugLabel: 'certifications_section');

List<GlobalKey> get _sectionKeys => [introSectionKey, projectsSectionKey, certificationsSectionKey];

/// Smoothly scroll to a section by index.
Future<void> goToSection(int index, {Duration duration = const Duration(milliseconds: 550), Curve curve = Curves.easeInOutCubicEmphasized}) async {
  if (index < 0 || index >= _sectionKeys.length) return;
  if (isNavigating.value) return;
  final ctx = _sectionKeys[index].currentContext;
  if (ctx == null) return;
  isNavigating.value = true;
  try {
    await Scrollable.ensureVisible(
      ctx,
      duration: duration,
      curve: curve,
      alignment: 0.05, // bias a bit from the very top
    );
    currentPageIndex.value = index;
  } finally {
    isNavigating.value = false;
  }
}
/// currentPageIndex in sync while the user scrolls manually.
bool _sectionListenerAttached = false;
void setupSectionScrollListener() {
  if (_sectionListenerAttached) return;
  _sectionListenerAttached = true;
  scrollController.addListener(() {
    // Determine the section whose top is closest to (but not far above) the viewport top
    try {
      final positions = _sectionKeys.map((k) {
        final ctx = k.currentContext;
        if (ctx == null) return double.infinity;
        final box = ctx.findRenderObject() as RenderBox?;
        if (box == null || !box.attached) return double.infinity;
        final offset = box.localToGlobal(Offset.zero);
        return offset.dy.abs();
      }).toList();
      int minIndex = 0;
      double minVal = positions[0];
      for (int i = 1; i < positions.length; i++) {
        if (positions[i] < minVal) {
          minVal = positions[i];
          minIndex = i;
        }
      }
      if (currentPageIndex.value != minIndex) {
        currentPageIndex.value = minIndex;
      }
    } catch (_) {
      // Best-effort; ignore measure errors during layout changes
    }
  });
}