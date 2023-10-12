import 'package:flutter_dotenv/flutter_dotenv.dart';

enum EnvEnum { dev, prod }

const EnvEnum activeEnv = EnvEnum.dev;

String getConfigEnvFile({EnvEnum activeEnv = activeEnv}) {
  switch (activeEnv) {
    case EnvEnum.prod:
      return 'lib/env/.env';
    case EnvEnum.dev:
    default:
      return 'lib/env/.env.dev';
  }
}

class Env {
  static Future<void> load() async {
    String fileName = getConfigEnvFile(activeEnv: activeEnv);
    await dotenv.load(fileName: fileName);
  }

  bool get isDev => activeEnv == EnvEnum.dev;

  static String get appName => dotenv.env['APP_NAME'] ?? '';
  static String get apiUrl => dotenv.env['BASE_API_URL'] ?? '';
  static String get bardKey => dotenv.env['BARD_KEY'] ?? '';
}
