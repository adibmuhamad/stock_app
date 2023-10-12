import 'package:dartz/dartz.dart';
import 'package:stock_app/data/models/mutual_fund_model.dart';
import 'package:stock_app/domain/entities/quote.dart';

abstract class MutualFundRepository {
  Future<Either<String, List<Quote>>> fetchTopMutualFund();
  Future<Either<String, Data>> fetchMutualFund(String symbol);
}