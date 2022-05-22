// Mocks generated by Mockito 5.2.0 from annotations
// in flutter_resources/test/helpers/test_helpers.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;
import 'dart:ui' as _i4;

import 'package:flutter_resources/core/params/language/store_language_code_params.dart'
    as _i24;
import 'package:flutter_resources/core/params/no_params.dart' as _i13;
import 'package:flutter_resources/core/params/theme/store_app_theme_data_params.dart'
    as _i17;
import 'package:flutter_resources/data/datasources/language/language_local_datasource.dart'
    as _i20;
import 'package:flutter_resources/data/datasources/theme/theme_local_datasource.dart'
    as _i10;
import 'package:flutter_resources/data/models/app_theme_data_model.dart' as _i3;
import 'package:flutter_resources/data/models/theme_model.dart' as _i11;
import 'package:flutter_resources/data/repositories/language_repository_impl.dart'
    as _i19;
import 'package:flutter_resources/data/repositories/theme_repository_impl.dart'
    as _i9;
import 'package:flutter_resources/domain/entities/app_theme_data.dart' as _i2;
import 'package:flutter_resources/domain/entities/color_theme.dart' as _i8;
import 'package:flutter_resources/domain/repositories/language_repository.dart'
    as _i18;
import 'package:flutter_resources/domain/repositories/theme_repository.dart'
    as _i7;
import 'package:flutter_resources/domain/usecases/langugae/get_stored_or_default_locale.dart'
    as _i21;
import 'package:flutter_resources/domain/usecases/langugae/get_supported_locales.dart'
    as _i22;
import 'package:flutter_resources/domain/usecases/langugae/store_locale.dart'
    as _i23;
import 'package:flutter_resources/domain/usecases/theme/get_stored_theme_data.dart'
    as _i15;
import 'package:flutter_resources/domain/usecases/theme/get_supported_color_themes.dart'
    as _i14;
import 'package:flutter_resources/domain/usecases/theme/get_supported_fonts.dart'
    as _i12;
import 'package:flutter_resources/domain/usecases/theme/store_app_theme.dart'
    as _i16;
import 'package:mockito/mockito.dart' as _i1;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeAppThemeData_0 extends _i1.Fake implements _i2.AppThemeData {}

class _FakeAppThemeDataModel_1 extends _i1.Fake
    implements _i3.AppThemeDataModel {}

class _FakeLocale_2 extends _i1.Fake implements _i4.Locale {}

/// A class which mocks [SharedPreferences].
///
/// See the documentation for Mockito's code generation for more information.
class MockSharedPreferences extends _i1.Mock implements _i5.SharedPreferences {
  MockSharedPreferences() {
    _i1.throwOnMissingStub(this);
  }

  @override
  Set<String> getKeys() => (super.noSuchMethod(Invocation.method(#getKeys, []),
      returnValue: <String>{}) as Set<String>);
  @override
  Object? get(String? key) =>
      (super.noSuchMethod(Invocation.method(#get, [key])) as Object?);
  @override
  bool? getBool(String? key) =>
      (super.noSuchMethod(Invocation.method(#getBool, [key])) as bool?);
  @override
  int? getInt(String? key) =>
      (super.noSuchMethod(Invocation.method(#getInt, [key])) as int?);
  @override
  double? getDouble(String? key) =>
      (super.noSuchMethod(Invocation.method(#getDouble, [key])) as double?);
  @override
  String? getString(String? key) =>
      (super.noSuchMethod(Invocation.method(#getString, [key])) as String?);
  @override
  bool containsKey(String? key) =>
      (super.noSuchMethod(Invocation.method(#containsKey, [key]),
          returnValue: false) as bool);
  @override
  List<String>? getStringList(String? key) =>
      (super.noSuchMethod(Invocation.method(#getStringList, [key]))
          as List<String>?);
  @override
  _i6.Future<bool> setBool(String? key, bool? value) =>
      (super.noSuchMethod(Invocation.method(#setBool, [key, value]),
          returnValue: Future<bool>.value(false)) as _i6.Future<bool>);
  @override
  _i6.Future<bool> setInt(String? key, int? value) =>
      (super.noSuchMethod(Invocation.method(#setInt, [key, value]),
          returnValue: Future<bool>.value(false)) as _i6.Future<bool>);
  @override
  _i6.Future<bool> setDouble(String? key, double? value) =>
      (super.noSuchMethod(Invocation.method(#setDouble, [key, value]),
          returnValue: Future<bool>.value(false)) as _i6.Future<bool>);
  @override
  _i6.Future<bool> setString(String? key, String? value) =>
      (super.noSuchMethod(Invocation.method(#setString, [key, value]),
          returnValue: Future<bool>.value(false)) as _i6.Future<bool>);
  @override
  _i6.Future<bool> setStringList(String? key, List<String>? value) =>
      (super.noSuchMethod(Invocation.method(#setStringList, [key, value]),
          returnValue: Future<bool>.value(false)) as _i6.Future<bool>);
  @override
  _i6.Future<bool> remove(String? key) =>
      (super.noSuchMethod(Invocation.method(#remove, [key]),
          returnValue: Future<bool>.value(false)) as _i6.Future<bool>);
  @override
  _i6.Future<bool> commit() =>
      (super.noSuchMethod(Invocation.method(#commit, []),
          returnValue: Future<bool>.value(false)) as _i6.Future<bool>);
  @override
  _i6.Future<bool> clear() => (super.noSuchMethod(Invocation.method(#clear, []),
      returnValue: Future<bool>.value(false)) as _i6.Future<bool>);
  @override
  _i6.Future<void> reload() =>
      (super.noSuchMethod(Invocation.method(#reload, []),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
}

/// A class which mocks [ThemeRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockThemeRepository extends _i1.Mock implements _i7.ThemeRepository {
  MockThemeRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<List<String>> getSupportedFonts() =>
      (super.noSuchMethod(Invocation.method(#getSupportedFonts, []),
              returnValue: Future<List<String>>.value(<String>[]))
          as _i6.Future<List<String>>);
  @override
  _i6.Future<List<_i8.ColorTheme>> getSupportedColorThemes() =>
      (super.noSuchMethod(Invocation.method(#getSupportedColorThemes, []),
              returnValue:
                  Future<List<_i8.ColorTheme>>.value(<_i8.ColorTheme>[]))
          as _i6.Future<List<_i8.ColorTheme>>);
  @override
  _i6.Future<_i2.AppThemeData> getStoredOrDefaultAppThemeData() => (super
          .noSuchMethod(Invocation.method(#getStoredOrDefaultAppThemeData, []),
              returnValue:
                  Future<_i2.AppThemeData>.value(_FakeAppThemeData_0()))
      as _i6.Future<_i2.AppThemeData>);
  @override
  _i6.Future<void> storeAppThemeData(_i2.AppThemeData? appThemeData) =>
      (super.noSuchMethod(Invocation.method(#storeAppThemeData, [appThemeData]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
}

/// A class which mocks [ThemeRepositoryImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockThemeRepositoryImpl extends _i1.Mock
    implements _i9.ThemeRepositoryImpl {
  MockThemeRepositoryImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<List<String>> getSupportedFonts() =>
      (super.noSuchMethod(Invocation.method(#getSupportedFonts, []),
              returnValue: Future<List<String>>.value(<String>[]))
          as _i6.Future<List<String>>);
  @override
  _i6.Future<List<_i8.ColorTheme>> getSupportedColorThemes() =>
      (super.noSuchMethod(Invocation.method(#getSupportedColorThemes, []),
              returnValue:
                  Future<List<_i8.ColorTheme>>.value(<_i8.ColorTheme>[]))
          as _i6.Future<List<_i8.ColorTheme>>);
  @override
  _i6.Future<_i2.AppThemeData> getStoredOrDefaultAppThemeData() => (super
          .noSuchMethod(Invocation.method(#getStoredOrDefaultAppThemeData, []),
              returnValue:
                  Future<_i2.AppThemeData>.value(_FakeAppThemeData_0()))
      as _i6.Future<_i2.AppThemeData>);
  @override
  _i6.Future<void> storeAppThemeData(_i2.AppThemeData? theme) =>
      (super.noSuchMethod(Invocation.method(#storeAppThemeData, [theme]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
}

/// A class which mocks [ThemeLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockThemeLocalDataSource extends _i1.Mock
    implements _i10.ThemeLocalDataSource {
  MockThemeLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i3.AppThemeDataModel> getStoredOrDefaultAppThemeData() => (super
          .noSuchMethod(Invocation.method(#getStoredOrDefaultAppThemeData, []),
              returnValue: Future<_i3.AppThemeDataModel>.value(
                  _FakeAppThemeDataModel_1()))
      as _i6.Future<_i3.AppThemeDataModel>);
  @override
  _i6.Future<void> storeAppThemeData(_i2.AppThemeData? theme) =>
      (super.noSuchMethod(Invocation.method(#storeAppThemeData, [theme]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
  @override
  _i6.Future<List<String>> getSupportedFonts() =>
      (super.noSuchMethod(Invocation.method(#getSupportedFonts, []),
              returnValue: Future<List<String>>.value(<String>[]))
          as _i6.Future<List<String>>);
  @override
  _i6.Future<List<_i11.ColorThemeModel>> getSupportedColorThemes() =>
      (super.noSuchMethod(Invocation.method(#getSupportedColorThemes, []),
              returnValue: Future<List<_i11.ColorThemeModel>>.value(
                  <_i11.ColorThemeModel>[]))
          as _i6.Future<List<_i11.ColorThemeModel>>);
}

/// A class which mocks [GetSupportedFonts].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetSupportedFonts extends _i1.Mock implements _i12.GetSupportedFonts {
  MockGetSupportedFonts() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<List<String>> call(_i13.NoParams? noParams) =>
      (super.noSuchMethod(Invocation.method(#call, [noParams]),
              returnValue: Future<List<String>>.value(<String>[]))
          as _i6.Future<List<String>>);
}

/// A class which mocks [GetSupportedColorThemes].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetSupportedColorThemes extends _i1.Mock
    implements _i14.GetSupportedColorThemes {
  MockGetSupportedColorThemes() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<List<_i8.ColorTheme>> call(_i13.NoParams? noParams) =>
      (super.noSuchMethod(Invocation.method(#call, [noParams]),
              returnValue:
                  Future<List<_i8.ColorTheme>>.value(<_i8.ColorTheme>[]))
          as _i6.Future<List<_i8.ColorTheme>>);
}

/// A class which mocks [GetStoredOrDefaultAppThemeData].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetStoredOrDefaultAppThemeData extends _i1.Mock
    implements _i15.GetStoredOrDefaultAppThemeData {
  MockGetStoredOrDefaultAppThemeData() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.AppThemeData> call(_i13.NoParams? noParams) =>
      (super.noSuchMethod(Invocation.method(#call, [noParams]),
              returnValue:
                  Future<_i2.AppThemeData>.value(_FakeAppThemeData_0()))
          as _i6.Future<_i2.AppThemeData>);
}

/// A class which mocks [StoreAppThemeData].
///
/// See the documentation for Mockito's code generation for more information.
class MockStoreAppThemeData extends _i1.Mock implements _i16.StoreAppThemeData {
  MockStoreAppThemeData() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<void> call(_i17.StoreAppThemeDataParams? params) =>
      (super.noSuchMethod(Invocation.method(#call, [params]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
}

/// A class which mocks [LanguageRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockLanguageRepository extends _i1.Mock
    implements _i18.LanguageRepository {
  MockLanguageRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i4.Locale> getStoredOrDefaultLocale() =>
      (super.noSuchMethod(Invocation.method(#getStoredOrDefaultLocale, []),
              returnValue: Future<_i4.Locale>.value(_FakeLocale_2()))
          as _i6.Future<_i4.Locale>);
  @override
  _i6.Future<List<_i4.Locale>> getSupportedLocales() =>
      (super.noSuchMethod(Invocation.method(#getSupportedLocales, []),
              returnValue: Future<List<_i4.Locale>>.value(<_i4.Locale>[]))
          as _i6.Future<List<_i4.Locale>>);
  @override
  _i6.Future<void> storeLocale(_i4.Locale? locale) =>
      (super.noSuchMethod(Invocation.method(#storeLocale, [locale]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
}

/// A class which mocks [LanguageRepositoryImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockLanguageRepositoryImpl extends _i1.Mock
    implements _i19.LanguageRepositoryImpl {
  MockLanguageRepositoryImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i4.Locale> getStoredOrDefaultLocale() =>
      (super.noSuchMethod(Invocation.method(#getStoredOrDefaultLocale, []),
              returnValue: Future<_i4.Locale>.value(_FakeLocale_2()))
          as _i6.Future<_i4.Locale>);
  @override
  _i6.Future<List<_i4.Locale>> getSupportedLocales() =>
      (super.noSuchMethod(Invocation.method(#getSupportedLocales, []),
              returnValue: Future<List<_i4.Locale>>.value(<_i4.Locale>[]))
          as _i6.Future<List<_i4.Locale>>);
  @override
  _i6.Future<void> storeLocale(_i4.Locale? locale) =>
      (super.noSuchMethod(Invocation.method(#storeLocale, [locale]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
}

/// A class which mocks [LanguageLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockLanguageLocalDataSource extends _i1.Mock
    implements _i20.LanguageLocalDataSource {
  MockLanguageLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<List<_i4.Locale>> getSupportedLocales() =>
      (super.noSuchMethod(Invocation.method(#getSupportedLocales, []),
              returnValue: Future<List<_i4.Locale>>.value(<_i4.Locale>[]))
          as _i6.Future<List<_i4.Locale>>);
  @override
  _i6.Future<String?> getStoredLanguageCode() =>
      (super.noSuchMethod(Invocation.method(#getStoredLanguageCode, []),
          returnValue: Future<String?>.value()) as _i6.Future<String?>);
  @override
  _i6.Future<void> storeLocale(_i4.Locale? locale) =>
      (super.noSuchMethod(Invocation.method(#storeLocale, [locale]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
}

/// A class which mocks [GetStoredOrDefaultLocale].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetStoredOrDefaultLocale extends _i1.Mock
    implements _i21.GetStoredOrDefaultLocale {
  MockGetStoredOrDefaultLocale() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i4.Locale> call(_i13.NoParams? params) =>
      (super.noSuchMethod(Invocation.method(#call, [params]),
              returnValue: Future<_i4.Locale>.value(_FakeLocale_2()))
          as _i6.Future<_i4.Locale>);
}

/// A class which mocks [GetSupportedLocales].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetSupportedLocales extends _i1.Mock
    implements _i22.GetSupportedLocales {
  MockGetSupportedLocales() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<List<_i4.Locale>> call(_i13.NoParams? params) =>
      (super.noSuchMethod(Invocation.method(#call, [params]),
              returnValue: Future<List<_i4.Locale>>.value(<_i4.Locale>[]))
          as _i6.Future<List<_i4.Locale>>);
}

/// A class which mocks [StoreLocale].
///
/// See the documentation for Mockito's code generation for more information.
class MockStoreLocale extends _i1.Mock implements _i23.StoreLocale {
  MockStoreLocale() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<void> call(_i24.StoreLocaleParams? params) =>
      (super.noSuchMethod(Invocation.method(#call, [params]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i6.Future<void>);
}
