import 'package:injectable/injectable.dart';

import '../../entities/theme_color_entity.dart';
import '../../repositories/theme_repository.dart';

@injectable
class GetStoredOrDefaultThemeColor {
  final ThemeRepository _themeRepository;

  GetStoredOrDefaultThemeColor(this._themeRepository);

  Future<ThemeColorEntity> call() async {
    return _themeRepository.getDefaultThemeColor();
  }
}
