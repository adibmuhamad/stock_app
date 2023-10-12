import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stock_app/app.dart';
import 'package:stock_app/env/env.dart';
import 'package:stock_app/injection_container.dart' as di;

void main() async {
  runZonedGuarded<Future<void>>(() async {
    // Load the appropriate .env file
    await Env.load();

    di.setupInjection();

    runApp(const App());
  }, (error, stackTrace) {
    runApp(ErrorApp(error, stackTrace));
  });
}
