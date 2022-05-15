// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i6;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

import '../bloc_observer.dart' as _i3;
import '../data/datasources/local/language_local_datasource.dart' as _i16;
import '../data/datasources/local/theme_local_datasource.dart' as _i8;
import '../data/repositories/language_repository_impl.dart' as _i18;
import '../data/repositories/theme_repository_impl.dart' as _i10;
import '../domain/repositories/language_repository.dart' as _i17;
import '../domain/repositories/theme_repository.dart' as _i9;
import '../domain/usecases/langugae/get_default_locale.dart' as _i21;
import '../domain/usecases/langugae/get_stored_language_code.dart' as _i22;
import '../domain/usecases/langugae/get_supported_locales.dart' as _i23;
import '../domain/usecases/langugae/store_language_code.dart' as _i19;
import '../domain/usecases/theme/get_default_font.dart' as _i12;
import '../domain/usecases/theme/get_default_theme_color.dart' as _i13;
import '../domain/usecases/theme/get_supported_fonts.dart' as _i14;
import '../domain/usecases/theme/get_supported_theme_colors.dart' as _i15;
import '../presentation/routing/route.dart' as _i4;
import '../presentation/shared_blocs/language/language_cubit.dart' as _i24;
import '../presentation/shared_blocs/theme/theme_cubit.dart' as _i20;
import '../presentation/shared_blocs/user/user_cubit.dart' as _i11;
import '../services/services.index.dart' as _i5;
import 'register.module.dart' as _i25; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.AppBlocObserver>(registerModule.observer);
  gh.singleton<_i4.AppRouter>(registerModule.appRouter);
  await gh.factoryAsync<_i5.FirebaseService>(() => registerModule.fireService,
      preResolve: true);
  gh.lazySingleton<_i6.Logger>(() => registerModule.logger);
  await gh.factoryAsync<_i7.SharedPreferences>(
      () => registerModule.preferencesStorage,
      preResolve: true);
  gh.factory<_i8.ThemeLocalDataSource>(
      () => _i8.ThemeLocalDataSource(get<_i7.SharedPreferences>()));
  gh.factory<_i9.ThemeRepository>(
      () => _i10.ThemeRepositoryImpl(get<_i8.ThemeLocalDataSource>()));
  gh.lazySingleton<_i11.UserCubit>(() => _i11.UserCubit());
  gh.factory<_i12.GetStoredOrDefaultFont>(
      () => _i12.GetStoredOrDefaultFont(get<_i9.ThemeRepository>()));
  gh.factory<_i13.GetStoredOrDefaultThemeColor>(
      () => _i13.GetStoredOrDefaultThemeColor(get<_i9.ThemeRepository>()));
  gh.factory<_i14.GetSupportedFonts>(
      () => _i14.GetSupportedFonts(get<_i9.ThemeRepository>()));
  gh.factory<_i15.GetSupportedThemeColors>(
      () => _i15.GetSupportedThemeColors(get<_i9.ThemeRepository>()));
  gh.factory<_i16.LanguageLocalDataSource>(
      () => _i16.LanguageLocalDataSource(get<_i7.SharedPreferences>()));
  gh.factory<_i17.LanguageRepository>(
      () => _i18.LanguageRepositoryImpl(get<_i16.LanguageLocalDataSource>()));
  gh.factory<_i19.StoreLanguageCode>(
      () => _i19.StoreLanguageCode(get<_i17.LanguageRepository>()));
  gh.lazySingleton<_i20.ThemeCubit>(() => _i20.ThemeCubit(
      get<_i12.GetStoredOrDefaultFont>(),
      get<_i14.GetSupportedFonts>(),
      get<_i13.GetStoredOrDefaultThemeColor>(),
      get<_i15.GetSupportedThemeColors>()));
  gh.factory<_i21.GetDefaultLocale>(
      () => _i21.GetDefaultLocale(get<_i17.LanguageRepository>()));
  gh.factory<_i22.GetStoredLanguageCode>(
      () => _i22.GetStoredLanguageCode(get<_i17.LanguageRepository>()));
  gh.factory<_i23.GetSupportedLocales>(
      () => _i23.GetSupportedLocales(get<_i17.LanguageRepository>()));
  gh.lazySingleton<_i24.LanguageCubit>(() => _i24.LanguageCubit(
      get<_i21.GetDefaultLocale>(),
      get<_i23.GetSupportedLocales>(),
      get<_i22.GetStoredLanguageCode>(),
      get<_i19.StoreLanguageCode>()));
  return get;
}

class _$RegisterModule extends _i25.RegisterModule {}
