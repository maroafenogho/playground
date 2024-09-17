import 'package:flutter/material.dart';

class AppColorExtension extends ThemeExtension<AppColorExtension> {
  ///The primary color for the design added by Maro
  final Color primary;
  final Color secondary;
  final Color tetiary;
  final Color neutral;
  final Color error;
  final Color background;
  final Color celeste;
  final Color midnight;
  final Color alabaster;
  final Color onyx;
  final Color federalBlue;
  final Color violet;
  final Color teaRose;
  final Color robbingEgg;
  final Color chryslerBlue;
  final Color fireRed;
  final Color brunswickGreen;
  final Color success;

  AppColorExtension(
      {required this.primary,
      required this.secondary,
      required this.tetiary,
      required this.neutral,
      required this.error,
      required this.background,
      required this.celeste,
      required this.midnight,
      required this.alabaster,
      required this.onyx,
      required this.federalBlue,
      required this.violet,
      required this.teaRose,
      required this.robbingEgg,
      required this.chryslerBlue,
      required this.fireRed,
      required this.brunswickGreen,
      required this.success});

  @override
  ThemeExtension<AppColorExtension> copyWith({
    Color? primary,
    Color? secondary,
    Color? tetiary,
    Color? neutral,
    Color? error,
    Color? background,
    Color? celeste,
    Color? midnight,
    Color? alabaster,
    Color? onyx,
    Color? federalBlue,
    Color? violet,
    Color? teaRose,
    Color? robbingEgg,
    Color? chryslerBlue,
    Color? fireRed,
    Color? brunswickGreen,
    Color? success,
  }) =>
      AppColorExtension(
        primary: primary ?? this.primary,
        secondary: secondary ?? this.secondary,
        error: error ?? this.error,
        tetiary: tetiary ?? this.tetiary,
        neutral: neutral ?? this.neutral,
        background: background ?? this.background,
        celeste: celeste ?? this.celeste,
        midnight: midnight ?? this.midnight,
        alabaster: alabaster ?? this.alabaster,
        onyx: onyx ?? this.onyx,
        federalBlue: federalBlue ?? this.federalBlue,
        violet: violet ?? this.violet,
        teaRose: teaRose ?? this.teaRose,
        robbingEgg: robbingEgg ?? this.robbingEgg,
        chryslerBlue: chryslerBlue ?? this.chryslerBlue,
        fireRed: fireRed ?? this.fireRed,
        brunswickGreen: brunswickGreen ?? this.brunswickGreen,
        success: success ?? this.success,
      );
  @override
  ThemeExtension<AppColorExtension> lerp(
      covariant ThemeExtension<AppColorExtension>? other, double t) {
    if (other is! AppColorExtension) {
      return this;
    }
    return AppColorExtension(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      tetiary: Color.lerp(tetiary, other.tetiary, t)!,
      error: Color.lerp(error, other.error, t)!,
      background: Color.lerp(background, other.background, t)!,
      neutral: Color.lerp(neutral, other.neutral, t)!,
      celeste: Color.lerp(celeste, other.celeste, t)!,
      midnight: Color.lerp(midnight, other.midnight, t)!,
      alabaster: Color.lerp(alabaster, other.alabaster, t)!,
      onyx: Color.lerp(onyx, other.onyx, t)!,
      federalBlue: Color.lerp(federalBlue, other.federalBlue, t)!,
      violet: Color.lerp(violet, other.violet, t)!,
      teaRose: Color.lerp(teaRose, other.teaRose, t)!,
      robbingEgg: Color.lerp(robbingEgg, other.robbingEgg, t)!,
      chryslerBlue: Color.lerp(chryslerBlue, other.chryslerBlue, t)!,
      fireRed: Color.lerp(fireRed, other.fireRed, t)!,
      brunswickGreen: Color.lerp(brunswickGreen, other.brunswickGreen, t)!,
      success: Color.lerp(success, other.success, t)!,
    );
  }
}
