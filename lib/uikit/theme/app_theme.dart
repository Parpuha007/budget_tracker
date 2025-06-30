import 'package:budget_tracker/generated/fonts.gen.dart';
import 'package:flutter/material.dart';

final appTheme = ThemeData(
  fontFamily: FontFamily.inter,
  textTheme: ThemeData.light().textTheme.copyWith(
        titleLarge: const TextStyle(fontWeight: FontWeight.w700, height: 0.95),
        bodyLarge: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        bodyMedium: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        bodySmall: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      ),
);
