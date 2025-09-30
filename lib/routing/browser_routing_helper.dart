import 'dart:html' as html;

import 'package:flutter/foundation.dart' show kIsWeb;

class BrowserRoutingHelper {
  // Push a new state to browser history without navigation
  static void pushState(String url, {String? title, dynamic data}) {
    if (kIsWeb) {
      html.window.history.pushState(data, title ?? '', url);
    }
  }

  // Replace current history state
  static void replaceState(String url, {String? title, dynamic data}) {
    if (kIsWeb) {
      html.window.history.replaceState(data, title ?? '', url);
    }
  }

  // Go back in browser history
  static void back() {
    if (kIsWeb) {
      html.window.history.back();
    }
  }

  // Go forward in browser history
  static void forward() {
    if (kIsWeb) {
      html.window.history.forward();
    }
  }

  // Go to specific position in history (negative = back, positive = forward)
  static void go(int delta) {
    if (kIsWeb) {
      html.window.history.go(delta);
    }
  }

  // Get current history length
  static int get historyLength {
    if (kIsWeb) {
      return html.window.history.length ?? 0;
    }
    return 0;
  }

  // Listen to browser back/forward button
  static void onPopState(void Function(html.PopStateEvent) callback) {
    if (kIsWeb) {
      html.window.onPopState.listen(callback);
    }
  }

  // Get current URL
  static String get currentUrl {
    if (kIsWeb) {
      return html.window.location.href;
    }
    return '';
  }

  // Get current pathname
  static String get currentPath {
    if (kIsWeb) {
      return html.window.location.pathname ?? '/';
    }
    return '/';
  }
}
