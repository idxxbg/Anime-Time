import 'package:flutter/material.dart';

@immutable
class TextStyles {
  // Small text
  static const smallText = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );

  // Medium Text
  static const mediumText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  // Large Text
  static const largeText = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static const titleText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  // đảm bảo chi duoc dùng private như 1 lớp tiện ích
  const TextStyles._();
}
