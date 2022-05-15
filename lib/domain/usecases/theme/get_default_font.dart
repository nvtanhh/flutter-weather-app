import 'package:injectable/injectable.dart';

import '../../repositories/theme_repository.dart';

@injectable
class GetStoredOrDefaultFont {
  final ThemeRepository _themeRepository;

  GetStoredOrDefaultFont(this._themeRepository);

  Future<String> call() async {
    return _themeRepository.getDefaultFont();
  }
}
