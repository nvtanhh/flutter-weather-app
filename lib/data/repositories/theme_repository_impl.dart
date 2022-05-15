import 'package:injectable/injectable.dart';

import '../../domain/entities/enums/theme_dark_option.dart';
import '../../domain/repositories/theme_repository.dart';
import '../datasources/local/theme_local_datasource.dart';
import '../models/theme_model.dart';

@Injectable(as: ThemeRepository)
class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeLocalDataSource _localDatasource;

  ThemeRepositoryImpl(this._localDatasource);

  @override
  Future<String> getDefaultFont() async {
    return _localDatasource.defaultFont;
  }

  @override
  Future<List<String>> getSupportedFonts() async {
    return _localDatasource.supportedFonts;
  }

  @override
  void storeFont(String font) {
    _localDatasource.storeFont(font);
  }

  @override
  Future<ThemeColorModel> getDefaultThemeColor() async {
    final data = _localDatasource.supportedThemes.first;
    return ThemeColorModel.fromJson(data);
  }

  @override
  Future<List<ThemeColorModel>> getSupportedThemeColors() async {
    return _localDatasource.supportedThemes
        .map((item) => ThemeColorModel.fromJson(item))
        .toList();
  }
}
