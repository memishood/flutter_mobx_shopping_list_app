import 'package:flutter/material.dart';

class TextStyles {
  const TextStyles();

  TextStyle get light => const TextStyle(
        fontFamily: 'Rubik',
        fontWeight: FontWeight.w300,
      );

  TextStyle get regular => const TextStyle(
        fontFamily: 'Rubik',
        fontWeight: FontWeight.w400,
      );

  TextStyle get medium => const TextStyle(
        fontFamily: 'Rubik',
        fontWeight: FontWeight.w500,
      );

  TextStyle get semiBold => const TextStyle(
        fontFamily: 'Rubik',
        fontWeight: FontWeight.w600,
      );

  TextStyle get bold => const TextStyle(
        fontFamily: 'Rubik',
        fontWeight: FontWeight.w700,
      );
}
