import 'package:stock_app/data/database/database.dart';

class StockLocalDataSource {
  final Database database;

  StockLocalDataSource(this.database);

  Future<List<SimpleStockData>> getStocks() async {
    return await database.select(database.simpleStock).get();
  }

  Future<void> saveStocks(List<SimpleStockData> stocks) async {
    await database.transaction(() async {
      await database.delete(database.simpleStock).go();
      await database.batch((batch) {
        batch.insertAll(database.simpleStock, stocks);
      });
    });
  }
}
