import 'package:flutter/material.dart';

import '../entities/enums/theme_dark_option.dart';
import '../entities/theme_color_entity.dart';

abstract class ThemeRepository {
  Future<String> getDefaultFont();
  Future<List<String>> getSupportedFonts();

  Future<ThemeColorEntity> getDefaultThemeColor();
  Future<List<ThemeColorEntity>> getSupportedThemeColors();
}
