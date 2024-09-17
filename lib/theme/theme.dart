import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:playground/theme/color/color.dart';
import 'package:playground/theme/typography/typography.dart';
import 'package:playground/theme/typography/typography_extension.dart';

class AppTheme extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode thememode) {
    log(thememode.toString());
    _themeMode = thememode;
    notifyListeners();
  }

  void darkMode() {
    _themeMode = ThemeMode.dark;
    notifyListeners();
  }

  void lightMode() {
    _themeMode = ThemeMode.light;
    notifyListeners();
  }

  bool get isDark => _themeMode == ThemeMode.dark;
  bool get isLight => _themeMode == ThemeMode.light;

  static final lightTheme = ThemeData.light()
      .copyWith(extensions: [_lightThemeColors, _lightThemeText]);

  static final darkTheme =
      ThemeData.dark().copyWith(extensions: [_darkThemeColors, _darkThemeText]);

  static final _lightThemeColors = AppColorExtension(
    primary: AppColorPalette.midnight,
    secondary: AppColorPalette.alabaster,
    tetiary: AppColorPalette.celeste,
    background: AppColorPalette.midnight.k50,
    error: AppColorPalette.fireRed,
    neutral: AppColorPalette.neutral,
    celeste: AppColorPalette.celeste,
    midnight: AppColorPalette.midnight,
    alabaster: AppColorPalette.alabaster,
    onyx: AppColorPalette.onyx,
    federalBlue: AppColorPalette.federalBlue,
    violet: AppColorPalette.violet,
    teaRose: AppColorPalette.teaRose,
    robbingEgg: AppColorPalette.robbingEgg,
    chryslerBlue: AppColorPalette.chryslerBlue,
    fireRed: AppColorPalette.fireRed,
    brunswickGreen: AppColorPalette.brunswickGreen,
    success: AppColorPalette.success,
  );

  static final _lightThemeText = AppTextTheme(
      body1: AppTypography.body1.copyWith(color: AppColorPalette.midnight),
      body2: AppTypography.body2.copyWith(color: AppColorPalette.midnight),
      body3: AppTypography.body3.copyWith(color: AppColorPalette.midnight),
      h1: AppTypography.h1.copyWith(color: AppColorPalette.midnight),
      h2: AppTypography.h2.copyWith(color: AppColorPalette.midnight),
      h3: AppTypography.h3.copyWith(color: AppColorPalette.midnight),
      h4: AppTypography.h4.copyWith(color: AppColorPalette.midnight));

  //TODO:: Use an extension method to assign text colors.

  static final _darkThemeText = AppTextTheme(
      body1: AppTypography.body1.copyWith(color: AppColorPalette.alabaster),
      body2: AppTypography.body2.copyWith(color: AppColorPalette.alabaster),
      body3: AppTypography.body3.copyWith(color: AppColorPalette.alabaster),
      h1: AppTypography.h1.copyWith(color: AppColorPalette.alabaster),
      h2: AppTypography.h2.copyWith(color: AppColorPalette.alabaster),
      h3: AppTypography.h3.copyWith(color: AppColorPalette.alabaster),
      h4: AppTypography.h4.copyWith(color: AppColorPalette.alabaster));

  static final _darkThemeColors = AppColorExtension(
      primary: AppColorPalette.midnight.k100,
      secondary: AppColorPalette.alabaster,
      tetiary: AppColorPalette.tetiary,
      background: AppColorPalette.midnight,
      error: AppColorPalette.error,
      neutral: AppColorPalette.neutral,
      celeste: AppColorPalette.celeste.k50,
      midnight: AppColorPalette.midnight.k50,
      alabaster: AppColorPalette.alabaster.k50,
      onyx: AppColorPalette.onyx.k50,
      federalBlue: AppColorPalette.federalBlue.k50,
      violet: AppColorPalette.violet.k50,
      teaRose: AppColorPalette.teaRose.k50,
      robbingEgg: AppColorPalette.robbingEgg.k50,
      chryslerBlue: AppColorPalette.chryslerBlue.k50,
      fireRed: AppColorPalette.fireRed.k50,
      brunswickGreen: AppColorPalette.brunswickGreen.k50,
      success: AppColorPalette.success.k50);
}

extension AppThemeX on ThemeData {
  AppColorExtension get colors =>
      extension<AppColorExtension>() ?? AppTheme._lightThemeColors;
  AppTextTheme get text =>
      extension<AppTextTheme>() ?? AppTheme._lightThemeText;
}

extension ThemeGetter on BuildContext {
  ThemeData get theme => Theme.of(this);
}

final themeNotifier = AppTheme();

// final themeNotifier = NotifierProvider<AppTheme, ThemeMode>(
//   () => AppTheme(),
// );

extension FontWeightX on TextStyle {
  TextStyle get light => copyWith(fontWeight: FontWeight.w300);
  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);
  TextStyle get extraBold => copyWith(fontWeight: FontWeight.w800);
  TextStyle get dark => copyWith(fontWeight: FontWeight.w900);
}
