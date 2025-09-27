import 'package:flutter/material.dart';

final PageController controller = PageController();

/// Tracks the currently selected page index for styling active navigation buttons.
final ValueNotifier<int> currentPageIndex = ValueNotifier<int>(0);