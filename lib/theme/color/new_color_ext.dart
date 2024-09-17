import 'package:flutter/material.dart';
import 'package:playground/theme/color/midnight_extension.dart';

class NewColorExt extends ThemeExtension<NewColorExt> {
  final MidnightExtension midnight;

  NewColorExt._({required this.midnight});

  @override
  ThemeExtension<NewColorExt> copyWith({
    MidnightExtension? midnight,
  }) =>
      NewColorExt._(midnight: midnight ?? this.midnight);

  @override
  ThemeExtension<NewColorExt> lerp(
      covariant ThemeExtension<NewColorExt>? other, double t) {
    if (other is! NewColorExt) {
      return this;
    }
    return NewColorExt._(midnight: midnight);
  }
}
