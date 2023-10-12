import 'package:stock_app/data/database/database.dart';

class AskLocalDataSource {
  final Database database;

  AskLocalDataSource(this.database);

  Future<List<ResponseData>> getAnswers() async {
    return await database.select(database.response).get();
  }

  Future<void> saveAnswers(List<ResponseData> responses) async {
    await database.transaction(() async {
      await database.delete(database.response).go();
      await database.batch((batch) {
        batch.insertAll(database.response, responses);
      });
    });
  }

  Future<void> deleteAnswers() async {
    await database.transaction(() async {
      await database.delete(database.response).go();
    });
  }
}
