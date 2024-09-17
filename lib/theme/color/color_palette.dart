import 'package:flutter/material.dart';

abstract class AppColorPalette {
  static const error = MaterialColor(
    _errorColorValue,
    {
      0: Color(0xff2e060b),
      100: Color(0xff4d0a12),
      200: Color(0xff740f1b),
      300: Color(0xff9a1324),
      400: Color(0xffc0182d),
      500: Color(_errorColorValue),
      600: Color(0xffeb4358),
      700: Color(0xffef6879),
      800: Color(0xfff38e9a),
      900: Color(0xfff7b4bc),
      990: Color(0xfffad2d7),
    },
  );

  static const neutral = MaterialColor(
    _neutralColorValue,
    {
      0: Color(0xff000000),
      100: Color(0xff1a1b1e),
      200: Color(0xff2f3033),
      300: Color(0xff46474a),
      400: Color(0xff5b5e66),
      500: Color(_neutralColorValue),
      600: Color(0xff606060),
      700: Color(0xffababaf),
      800: Color(0xffc7c6ca),
      900: Color(0xfff1f0f4),
      990: Color(0xfff9f9ff),
      1000: Color(0xffffffff),
    },
  );

  static const primary = MaterialColor(
    _primaryColorValue,
    {
      0: Color(0xff072041),
      100: Color(0xff0a3165),
      200: Color(0xff0e4289),
      300: Color(0xff1154ac),
      400: Color(0xff176ee2),
      500: Color(_primaryColorValue),
      600: Color(0xFF3583eb),
      700: Color(0xFF6aa4f0),
      800: Color(0xFFb2d0f7),
      900: Color(0xFFd5e5fb),
      990: Color(0xFFe7f0fd),
      1000: Color(0xFFf9fbfe),
    },
  );

  static const secondary = MaterialColor(
    _secondaryColorValue,
    {
      0: Color(0xff737373),
      100: Color(0xff737373),
      200: Color(0xff737373),
      300: Color(0xff737373),
      400: Color(0xff343434),
      500: Color(_secondaryColorValue),
      600: Color(0xff525252),
      700: Color(0xff737373),
      800: Color(0xffb2b2b2),
      900: Color(0xffbcbcbc),
      990: Color(0xffc5c5c5),
      1000: Color(0xffcfcfcf),
    },
  );

  static const tetiary = MaterialColor(
    _tetiaryColorValue,
    {
      0: Color(0xffe8ae00),
      100: Color(0xfffcbd00),
      200: Color(0xffffc311),
      300: Color(0xffffc824),
      400: Color(0xffffd24b),
      500: Color(_tetiaryColorValue),
      600: Color(0xffffdc73),
      700: Color(0xffffe186),
      800: Color(0xffffe69a),
      900: Color(0xffffebad),
      990: Color(0xfffff4d5),
      1000: Color(0xfffffefc),
    },
  );

  static const celeste = MaterialColor(
    _celeste,
    {
      50: Color(0xfff6fffe),
      100: Color(0xffe4fffb),
      200: Color(0xffd7fff9),
      300: Color(0xffc5fff6),
      400: Color(0xffbafff5),
      500: Color(_celeste),
      600: Color(0xff9ae8dc),
      700: Color(0xff78b5ac),
      800: Color(0xff5d8c85),
      900: Color(0xff476b66),
    },
  );

  static const alabaster = MaterialColor(
    _alabaster,
    {
      50: Color(0xfffdfcfc),
      100: Color(0xfff9f7f4),
      200: Color(0xfff6f3ef),
      300: Color(0xfff2eee8),
      400: Color(0xfff0eae3),
      500: Color(_alabaster),
      600: Color(0xffd7d0c8),
      700: Color(0xffa8a39c),
      800: Color(0xff827e79),
      900: Color(0xff63605c),
    },
  );

  static const onyx = MaterialColor(
    _onyx,
    {
      50: Color(0xffececec),
      100: Color(0xffc3c3c3),
      200: Color(0xffa6a6a6),
      300: Color(0xff7d7d7d),
      400: Color(0xff646464),
      500: Color(_onyx),
      600: Color(0xff383838),
      700: Color(0xff2b2b2b),
      800: Color(0xff222222),
      900: Color(0xff1a1a1a),
    },
  );

  static const midnight = MaterialColor(
    _midnight,
    {
      50: Color(0xffe8e8e8),
      100: Color(0xffb6b6b6),
      200: Color(0xff939393),
      300: Color(0xff626262),
      400: Color(0xff434343),
      500: Color(_midnight),
      600: Color(0xff141414),
      700: Color(0xff121212),
      800: Color(0xff0e0e0e),
      900: Color(0xff0b0b0b),
    },
  );

  static const federalBlue = MaterialColor(
    _federalBlue,
    {
      50: Color(0xffe8e7ef),
      100: Color(0xffb8b5cc),
      200: Color(0xff9691b3),
      300: Color(0xff665e90),
      400: Color(0xff483f7b),
      500: Color(_federalBlue),
      600: Color(0xff180e52),
      700: Color(0xff120b40),
      800: Color(0xff0e0832),
      900: Color(0xff0b0626),
    },
  );

  static const violet = MaterialColor(
    _violet,
    {
      50: Color(0xfffbf4fd),
      100: Color(0xfff1dcf8),
      200: Color(0xffebcbf4),
      300: Color(0xffe2b3f0),
      400: Color(0xffdca4ed),
      500: Color(_violet),
      600: Color(0xffc080d3),
      700: Color(0xff9664a5),
      800: Color(0xff744e80),
      900: Color(0xff593b61),
    },
  );

  static const teaRose = MaterialColor(
    _teaRose,
    {
      50: Color(0xfffefafa),
      100: Color(0xfffceff0),
      200: Color(0xfffbe8e8),
      300: Color(0xfff9ddde),
      400: Color(0xfff8d6d8),
      500: Color(_teaRose),
      600: Color(0xffe0babb),
      700: Color(0xffaf9192),
      800: Color(0xff877071),
      900: Color(0xff675657),
    },
  );

  static const robbingEgg = MaterialColor(
    _robbinEgg,
    {
      50: Color(0xffe6fbfd),
      100: Color(0xffb0f3f7),
      200: Color(0xff8aedf4),
      300: Color(0xff54e4ee),
      400: Color(0xff33dfeb),
      500: Color(_robbinEgg),
      600: Color(0xff00c4d1),
      700: Color(0xff0099a3),
      800: Color(0xff00767f),
      900: Color(0xff005a61),
    },
  );

  static const chryslerBlue = MaterialColor(
    _chryslerBlue,
    {
      50: Color(0xffeee6f7),
      100: Color(0xffcab0e7),
      200: Color(0xffb18adc),
      300: Color(0xff8d54cc),
      400: Color(0xff7733c2),
      500: Color(_chryslerBlue),
      600: Color(0xff4d00a3),
      700: Color(0xff3c007f),
      800: Color(0xff2f0062),
      900: Color(0xff24004b),
    },
  );

  static const fireRed = MaterialColor(
    _fireRed,
    {
      50: Color(0xfffae9ea),
      100: Color(0xfff0babf),
      200: Color(0xffe9999f),
      300: Color(0xffe06a74),
      400: Color(0xffd94d59),
      500: Color(_fireRed),
      600: Color(0xffbd1e2b),
      700: Color(0xff941721),
      800: Color(0xff72121a),
      900: Color(0xff570e14),
    },
  );

  static const brunswickGreen = MaterialColor(
    _brunswickGreen,
    {
      50: Color(0xffe6eceb),
      100: Color(0xffb0c3c1),
      200: Color(0xff8aa5a3),
      300: Color(0xff547c78),
      400: Color(0xff33635e),
      500: Color(_brunswickGreen),
      600: Color(0xff003731),
      700: Color(0xff002b26),
      800: Color(0xff00211e),
      900: Color(0xff001917),
    },
  );

  static const success = MaterialColor(
    _success,
    {
      50: Color(0xffeaf9e7),
      100: Color(0xffbdecb3),
      200: Color(0xff9de28f),
      300: Color(0xff70d55c),
      400: Color(0xff54cd3c),
      500: Color(_success),
      600: Color(0xff25b00a),
      700: Color(0xff1d8908),
      800: Color(0xff176a06),
      900: Color(0xff115105),
    },
  );

  static const _errorColorValue = 0xFFF44336;
  static const _neutralColorValue = 0xff77777a;

  static const _primaryColorValue = 0xFF2378E9;
  static const _secondaryColorValue = 0xff3C3C3C;
  static const _tetiaryColorValue = 0xffffd75f;

  static const _celeste = 0xffa9fff2;
  static const _midnight = 0xff141414;
  static const _alabaster = 0xffece5dc;
  static const _onyx = 0xff3d3d3d;
  static const _federalBlue = 0xff1a0f5a;
  static const _violet = 0xffd38de8;
  static const _teaRose = 0xfff6ccce;
  static const _robbinEgg = 0xff00d7e6;
  static const _chryslerBlue = 0xff5500b3;
  static const _fireRed = 0xffd0212f;
  static const _brunswickGreen = 0xff003c36;
  static const _success = 0xff29c10b;
}

extension ColorsX on MaterialColor {
  Color get k50 => this[0] ?? this[50]!;

  Color get k100 => this[100]!;

  Color get k200 => this[200]!;

  Color get k300 => this[300]!;

  Color get k400 => this[400]!;

  Color get k500 => this[500]!;

  Color get k600 => this[600]!;

  Color get k700 => this[700]!;

  Color get k800 => this[800]!;

  Color get k900 => this[900]!;

  Color get k99 => this[990]!;

  Color get k1000 => this[1000]!;
}
