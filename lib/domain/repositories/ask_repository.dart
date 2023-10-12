import 'package:stock_app/data/database/database.dart';

abstract class AskRepository {
  Future<List<ResponseData>> getAnswers();
  Future<void> saveAnswers(List<ResponseData> responses);
  Future<void> deleteAnswers();
}