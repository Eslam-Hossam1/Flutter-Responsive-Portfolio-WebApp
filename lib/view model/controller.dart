import 'package:flutter/material.dart';

final PageController controller = PageController();

/// Tracks the currently selected page index for styling active navigation buttons.
final ValueNotifier<int> currentPageIndex = ValueNotifier<int>(0);

/// Prevents spamming navigation while an animation is in progress.
final ValueNotifier<bool> isNavigating = ValueNotifier<bool>(false);

/// Smoothly navigate to a page with a guarded animation to avoid jank.
Future<void> goToPage(int index, {Duration? duration, Curve curve = Curves.easeInOutCubicEmphasized}) async {
  if (isNavigating.value) return; // skip if already animating
  if (!controller.hasClients) return;
  if (currentPageIndex.value == index) return;
  isNavigating.value = true;
  currentPageIndex.value = index;
  try {
    await controller.animateToPage(
      index,
      duration: duration ?? const Duration(milliseconds: 550),
      curve: curve,
    );
  } finally {
    isNavigating.value = false;
  }
}