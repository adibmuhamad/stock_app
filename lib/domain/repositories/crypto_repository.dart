import 'package:dartz/dartz.dart';
import 'package:stock_app/domain/entities/quote.dart';

abstract class CryptoRepository {
  Future<Either<String, List<Quote>>> fetchTopCrypto();
}