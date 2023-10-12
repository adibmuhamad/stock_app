import 'package:stock_app/data/database/database.dart';
import 'package:stock_app/data/datasources/ask_local_data_source.dart';
import 'package:stock_app/domain/repositories/ask_repository.dart';

class AskRepositoryImpl implements AskRepository {
  final AskLocalDataSource _localDataSource;

  AskRepositoryImpl(this._localDataSource);

  @override
  Future<List<ResponseData>> getAnswers() async {
    try {
      var result = await _localDataSource.getAnswers();

      return result;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<void> deleteAnswers() async {
    return await _localDataSource.deleteAnswers();
  }

  @override
  Future<void> saveAnswers(List<ResponseData> responses) async {
    try {
      var result = await _localDataSource.saveAnswers(responses);
      return result;
    } catch (e) {
      return;
    }
  }
}
