import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_app/core/utils/config_util.dart';
import 'package:stock_app/injection_container.dart';

enum ThemeModeOption {
  light,
  dark,
}

class ThemeCubit extends Cubit<ThemeModeOption> {
  ThemeCubit() : super(ThemeModeOption.light) {
    _initializeThemeMode();
  }

   void _initializeThemeMode() async {
     var config = getIt<ConfigUtil>();
    var brightness = WidgetsBinding.instance.window.platformBrightness;
    var isDarkModeEnabled = brightness == Brightness.dark;
    if (isDarkModeEnabled) {
       await config.set('theme', '1');
      emit(ThemeModeOption.dark);
    } else {
      var theme = await config.get('theme');
      var mode = (theme == '1') ? ThemeModeOption.dark : ThemeModeOption.light;
       emit(mode);
    }
  }

  void toggleTheme() async {
    var config = getIt<ConfigUtil>();
    if (state == ThemeModeOption.light) {
      await config.set('theme', '1');
      emit(ThemeModeOption.dark);
    } else {
      await config.set('theme', '0');
      emit(ThemeModeOption.light);
    }
  }
}