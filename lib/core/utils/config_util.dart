import 'package:stock_app/data/database/database.dart';

class ConfigUtil {
  final Database database;

  ConfigUtil(this.database);

  Future<void> set(String param, String value) async {
    await database.select(database.config).get();

    var result = await (database.select(database.config)
          ..where((config) => config.param.equals(param)))
        .getSingleOrNull();

    if (result != null) {
      await (database.update(database.config)
            ..where((config) => config.param.equals(param)))
          .write(ConfigData(param: param, value: value));
    } else {
      await database
          .into(database.config)
          .insert(ConfigData(param: param, value: value));
    }
  }

  Future<String> get(String param) async {
    var result = await (database.select(database.config)
          ..where((config) => config.param.equals(param)))
        .getSingleOrNull();

    return result?.value ?? '';
  }
}
