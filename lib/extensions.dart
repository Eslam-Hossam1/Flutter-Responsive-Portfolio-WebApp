extension MyClamper on double {
  fontClamper(double baseFont) {
    return clamp(baseFont * 1, baseFont * 1.20);
  }
}
