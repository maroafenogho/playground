import 'package:flutter/material.dart';

class AppTextTheme extends ThemeExtension<AppTextTheme> {
  final TextStyle body1;
  final TextStyle body2;
  final TextStyle body3;
  final TextStyle h1;
  final TextStyle h2;
  final TextStyle h3;
  final TextStyle h4;

  AppTextTheme(
      {required this.body1,
      required this.body2,
      required this.body3,
      required this.h1,
      required this.h2,
      required this.h3,
      required this.h4});

  @override
  ThemeExtension<AppTextTheme> copyWith({
    TextStyle? body1,
    TextStyle? body2,
    TextStyle? body3,
    TextStyle? h1,
    TextStyle? h2,
    TextStyle? h3,
    TextStyle? h4,
  }) =>
      AppTextTheme(
          body1: body1 ?? this.body1,
          body2: body2 ?? this.body2,
          body3: body3 ?? this.body3,
          h1: h1 ?? this.h1,
          h2: h2 ?? this.h2,
          h3: h3 ?? this.h3,
          h4: h4 ?? this.h4);

  @override
  ThemeExtension<AppTextTheme> lerp(
      covariant ThemeExtension<AppTextTheme>? other, double t) {
    if (other is! AppTextTheme) {
      return this;
    }
    return AppTextTheme(
        body1: TextStyle.lerp(body1, other.body1, t)!,
        body2: TextStyle.lerp(body2, other.body2, t)!,
        body3: TextStyle.lerp(body3, other.body3, t)!,
        h1: TextStyle.lerp(h1, other.h1, t)!,
        h2: TextStyle.lerp(h2, other.h2, t)!,
        h3: TextStyle.lerp(h3, other.h3, t)!,
        h4: TextStyle.lerp(h4, other.h4, t)!);
  }
}
