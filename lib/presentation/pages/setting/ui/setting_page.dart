import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../common/theme/theme.index.dart';
import '/injector/injection.dart';
import '../../../../common/constants/constants.index.dart';
import '../../../../common/utils/utils.index.dart';
import '../../../../domain/entities/enums/theme_dark_option.dart';
import '../../../shared_blocs/shared_bloc_index.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  void _applyDarkMode(BuildContext context, DarkModeOption darkOption) {
    locator<ThemeCubit>().onChangeTheme(darkOption: darkOption);
  }

  void onNavigate(BuildContext context, String route) {
    context.router.pushNamed(route);
  }

  Future<void> _showDarkModeSetting(BuildContext context) async {
    DarkModeOption darkOption = locator<ThemeCubit>().state.darkModeOption;
    showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: ThemedText(
                AppLocalizations.of(context)!.settings__theme_dark_mode,
                type: ThemedTextType.titleMedium,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              content: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    RadioListTile<DarkModeOption>(
                      title: ThemedText(
                        AppLocalizations.of(context)!
                            .settings__theme_dark_mode_dynamic,
                      ),
                      activeColor: Theme.of(context).primaryColor,
                      value: DarkModeOption.dynamic,
                      groupValue: darkOption,
                      onChanged: (value) =>
                          setState(() => darkOption = DarkModeOption.dynamic),
                    ),
                    RadioListTile<DarkModeOption>(
                      title: ThemedText(
                        AppLocalizations.of(context)!
                            .settings__theme_dark_mode_on,
                      ),
                      activeColor: Theme.of(context).primaryColor,
                      value: DarkModeOption.on,
                      groupValue: darkOption,
                      onChanged: (_) =>
                          setState(() => darkOption = DarkModeOption.on),
                    ),
                    RadioListTile<DarkModeOption>(
                      title: ThemedText(
                        AppLocalizations.of(context)!
                            .settings__theme_dark_mode_off,
                      ),
                      activeColor: Theme.of(context).primaryColor,
                      value: DarkModeOption.off,
                      groupValue: darkOption,
                      onChanged: (_) =>
                          setState(() => darkOption = DarkModeOption.off),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                AppButton(
                  AppLocalizations.of(context)!.global__close,
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  type: ButtonType.text,
                ),
                AppButton(
                  AppLocalizations.of(context)!.global__apply,
                  onPressed: () {
                    Navigator.pop(context, true);
                    _applyDarkMode(context, darkOption);
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CommonPage(
      appBar: CommonAppBar(
        title: AppLocalizations.of(context)!.settings__title,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppSpacer.sizedBoxH8,
            AppListTitle(
              leading: AppIcon(AppIcons.language),
              title: AppLocalizations.of(context)!.settings__language_title,
              onPressed: () {
                onNavigate(context, RouteConstants.languageSetting);
              },
              trailing: BlocBuilder<LanguageCubit, Locale?>(
                builder: (context, locale) {
                  return Row(
                    children: <Widget>[
                      ThemedText(
                        UtilLanguage.getGlobalLanguageName(
                          locale!.languageCode,
                          context,
                        ),
                        type: ThemedTextType.caption,
                      ),
                      AppIcon(
                        AppIcons.arrowRight,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ],
                  );
                },
              ),
            ),
            _buildThemingWidgets(context),
          ],
        ),
      ),
    );
  }

  Widget _buildThemingWidgets(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Column(
          children: [
            AppListTitle(
              leading: AppIcon(AppIcons.color),
              title: AppLocalizations.of(context)!.settings__theme_color,
              onPressed: () => onNavigate(context, RouteConstants.themeSetting),
              trailing: Container(
                margin: AppSpacer.edgeInsetsRight8,
                width: 16.0,
                height: 16.0,
                color: Theme.of(context).primaryColor,
              ),
            ),
            AppListTitle(
              leading: AppIcon(AppIcons.darkMode),
              title: AppLocalizations.of(context)!.settings__theme_dark_mode,
              onPressed: () => _showDarkModeSetting(context),
              trailing: Row(
                children: <Widget>[
                  ThemedText(
                    state.darkModeOption.toTranslationString(context),
                    type: ThemedTextType.caption,
                  ),
                  AppIcon(
                    AppIcons.arrowRight,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ],
              ),
            ),
            AppListTitle(
              leading: AppIcon(AppIcons.font),
              title: AppLocalizations.of(context)!.settings__theme_font,
              onPressed: () => onNavigate(context, RouteConstants.fontSetting),
              trailing: Row(
                children: <Widget>[
                  ThemedText(
                    state.font ?? '',
                    type: ThemedTextType.caption,
                  ),
                  AppIcon(
                    AppIcons.arrowRight,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ],
              ),
              border: false,
            ),
          ],
        );
      },
    );
  }
}
