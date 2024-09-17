import 'package:flutter/material.dart';

class MidnightExtension extends ThemeExtension<MidnightExtension> {
  ///The midnight50 color for the design added by Maro
  final Color midnight50;
  final Color midnight100;
  final Color midnight200;
  final Color midnight300;
  final Color midnight400;
  final Color midnight500;
  final Color midnight600;
  final Color midnight700;
  final Color midnight800;
  final Color midnight900;

  MidnightExtension._({
    required this.midnight50,
    required this.midnight100,
    required this.midnight200,
    required this.midnight300,
    required this.midnight400,
    required this.midnight500,
    required this.midnight600,
    required this.midnight700,
    required this.midnight800,
    required this.midnight900,
  });

  @override
  ThemeExtension<MidnightExtension> copyWith({
    Color? midnight50,
    Color? midnight100,
    Color? midnight200,
    Color? midnight300,
    Color? midnight400,
    Color? midnight500,
    Color? midnight600,
    Color? midnight700,
    Color? midnight800,
    Color? midnight900,
  }) =>
      MidnightExtension._(
        midnight50: midnight50 ?? this.midnight50,
        midnight100: midnight100 ?? this.midnight100,
        midnight400: midnight400 ?? this.midnight400,
        midnight200: midnight200 ?? this.midnight200,
        midnight300: midnight300 ?? this.midnight300,
        midnight500: midnight500 ?? this.midnight500,
        midnight600: midnight600 ?? this.midnight600,
        midnight700: midnight700 ?? this.midnight700,
        midnight800: midnight800 ?? this.midnight800,
        midnight900: midnight900 ?? this.midnight900,
      );
  @override
  ThemeExtension<MidnightExtension> lerp(
      covariant ThemeExtension<MidnightExtension>? other, double t) {
    if (other is! MidnightExtension) {
      return this;
    }
    return MidnightExtension._(
      midnight50: Color.lerp(midnight50, other.midnight50, t)!,
      midnight100: Color.lerp(midnight100, other.midnight100, t)!,
      midnight200: Color.lerp(midnight200, other.midnight200, t)!,
      midnight400: Color.lerp(midnight400, other.midnight400, t)!,
      midnight500: Color.lerp(midnight500, other.midnight500, t)!,
      midnight300: Color.lerp(midnight300, other.midnight300, t)!,
      midnight600: Color.lerp(midnight600, other.midnight600, t)!,
      midnight700: Color.lerp(midnight700, other.midnight700, t)!,
      midnight800: Color.lerp(midnight800, other.midnight800, t)!,
      midnight900: Color.lerp(midnight900, other.midnight900, t)!,
    );
  }
}
