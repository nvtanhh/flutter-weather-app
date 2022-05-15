import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/theme_model.dart';
import '../../../domain/entities/enums/theme_dark_option.dart';
import '../../../domain/entities/theme_color_entity.dart';
import '../../../domain/usecases/theme/get_default_font.dart';
import '../../../domain/usecases/theme/get_default_theme_color.dart';
import '../../../domain/usecases/theme/get_supported_fonts.dart';
import '../../../domain/usecases/theme/get_supported_theme_colors.dart';

part 'theme_state.dart';

@lazySingleton
class ThemeCubit extends HydratedCubit<ThemeState> {
  // usecases
  final GetStoredOrDefaultFont _getDefaultFont;
  final GetSupportedFonts _getSupportedFonts;
  final GetStoredOrDefaultThemeColor _getDefaultTheme;
  final GetSupportedThemeColors _getSupportedThemes;

  ThemeCubit(
    this._getDefaultFont,
    this._getSupportedFonts,
    this._getDefaultTheme,
    this._getSupportedThemes,
  ) : super(const ThemeState()) {
    if (state.theme == null) _init();
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    try {
      final theme =
          ThemeColorModel.fromJson(json['theme'] as Map<String, dynamic>);
      final font = json['font'] as String;
      final darkMode = DarkModeOption.values
          .firstWhere((item) => item.name == json['darkModeOption'] as String);
      return _getThemeState(theme, font, darkMode).copyWith(
        supportedThemes: json['supportedThemes'] == null
            ? null
            : (json['supportedThemes'] as List)
                .map((e) => ThemeColorModel.fromJson(e as Map<String, dynamic>))
                .toList(),
        supportedFonts: json['supportedFonts'] == null
            ? null
            : json['supportedFonts'] as List<String>,
      );
    } catch (e) {
      _init();
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return {
      'theme': state.theme == null
          ? null
          : (state.theme! as ThemeColorModel).toJson(),
      'font': state.font,
      "darkModeOption": state.darkModeOption.name,
      "supportedThemes": state.supportedThemes
          ?.map((e) => (e as ThemeColorModel).toJson())
          .toList(),
      "supportedFonts": state.supportedFonts,
    };
  }

  Future<void> _init() async {
    await Future.delayed(const Duration(seconds: 2));
    final supportedFonts = await _getSupportedFonts.call();
    final supportedThemes = await _getSupportedThemes.call();
    final defaultFont = await _getDefaultFont.call();
    final defaultTheme = await _getDefaultTheme.call();
    const defaultDarkModeOption = DarkModeOption.dynamic;
    final newState =
        _getThemeState(defaultTheme, defaultFont, defaultDarkModeOption);
    emit(
      newState.copyWith(
        supportedFonts: supportedFonts,
        supportedThemes: supportedThemes,
      ),
    );
  }

  Future<void> onChangeTheme({
    ThemeColorEntity? theme,
    String? font,
    DarkModeOption? darkOption,
  }) async {
    final newState = _getThemeState(
      theme ?? state.theme!,
      font ??= state.font!,
      darkOption ??= state.darkModeOption,
    );

    emit(newState);
  }

  ThemeState _getThemeState(
      ThemeColorEntity theme, String font, DarkModeOption darkOption) {
    final lightTheme = _getThemeData(
      theme: theme,
      brightness: Brightness.light,
      font: font,
    );
    final darkTheme = _getThemeData(
      theme: theme,
      brightness: Brightness.dark,
      font: font,
    );

    return state.copyWith(
      theme: theme,
      lightTheme: _getThemeByDarkOption(
        darkOption,
        lightTheme: lightTheme,
        darkTheme: darkTheme,
      ),
      darkTheme: _getThemeByDarkOption(
        darkOption,
        lightTheme: lightTheme,
        darkTheme: darkTheme,
        isDarkTheme: true,
      ),
      font: font,
      darkModeOption: darkOption,
    );
  }

  ThemeData _getThemeByDarkOption(
    DarkModeOption darkOption, {
    required ThemeData lightTheme,
    required ThemeData darkTheme,
    bool isDarkTheme = false,
  }) {
    switch (darkOption) {
      case DarkModeOption.dynamic:
        return isDarkTheme ? darkTheme : lightTheme;
      case DarkModeOption.on:
        return darkTheme;
      case DarkModeOption.off:
        return lightTheme;
    }
  }

  ThemeData _getThemeData({
    required ThemeColorEntity theme,
    required Brightness brightness,
    required String font,
  }) {
    ColorScheme? colorScheme;
    switch (brightness) {
      case Brightness.light:
        colorScheme = ColorScheme.light(
          primary: theme.primary,
          secondary: theme.secondary,
          background: const Color(0xfffcfcfc),
          error: Colors.red,
        );
        break;
      case Brightness.dark:
        colorScheme = ColorScheme.dark(
          primary: theme.primary,
          secondary: theme.secondary,
          background: const Color(0xff010101),
          error: Colors.red,
        );
        break;
      default:
    }

    final isDark = colorScheme!.brightness == Brightness.dark;
    final appBarColor = isDark ? colorScheme.surface : colorScheme.background;
    final indicatorColor = isDark ? colorScheme.onSurface : colorScheme.primary;

    return ThemeData(
      brightness: colorScheme.brightness,
      primaryColor: colorScheme.primary,
      appBarTheme: AppBarTheme(
        backgroundColor: appBarColor,
        foregroundColor: isDark ? Colors.white : Colors.black,
      ),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      bottomAppBarColor: colorScheme.surface,
      cardColor: colorScheme.surface,
      dividerColor: colorScheme.onSurface.withOpacity(0.12),
      backgroundColor: colorScheme.background,
      dialogBackgroundColor: colorScheme.background,
      errorColor: colorScheme.error,
      indicatorColor: indicatorColor,
      applyElevationOverlayColor: isDark,
      colorScheme: colorScheme,

      ///Custom
      fontFamily: font,
      dialogTheme: DialogTheme(
        backgroundColor: colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorScheme.surface,
        shape: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colorScheme.surface,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: colorScheme.primary,
        showUnselectedLabels: true,
      ),
      dividerTheme: const DividerThemeData(
        thickness: 0.8,
        space: 0,
      ),
    );
  }
}
