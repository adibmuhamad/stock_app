import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'simple_stocks_model.freezed.dart';
part 'simple_stocks_model.g.dart';

SimpleStocksModel simpleStocksModelFromJson(String str) => SimpleStocksModel.fromJson(json.decode(str));

String simpleStocksModelToJson(SimpleStocksModel data) => json.encode(data.toJson());

@freezed
class SimpleStocksModel with _$SimpleStocksModel {
    const factory SimpleStocksModel({
        Meta? meta,
        List<Datum>? data,
    }) = _SimpleStocksModel;

    factory SimpleStocksModel.fromJson(Map<String, dynamic> json) => _$SimpleStocksModelFromJson(json);
}

@freezed
class Datum with _$Datum {
    const factory Datum({
        String? symbol,
        String? name,
    }) = _Datum;

    factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
}

@freezed
class Meta with _$Meta {
    const factory Meta({
        int? code,
        String? status,
        String? message,
    }) = _Meta;

    factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}
