import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'quote_model.freezed.dart';
part 'quote_model.g.dart';

QuoteModel quoteModelFromJson(String str) =>
    QuoteModel.fromJson(json.decode(str));

String quoteModelToJson(QuoteModel data) => json.encode(data.toJson());

@freezed
class QuoteModel with _$QuoteModel {
  const factory QuoteModel({
    Meta? meta,
    Data? data,
  }) = _QuoteModel;

  factory QuoteModel.fromJson(Map<String, dynamic> json) =>
      _$QuoteModelFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    int? id,
    String? symbol,
    String? name,
    double? open,
    double? close,
    double? prev_close,
    double? high,
    double? low,
    double? volume,
    double? change,
    double? change_percent,
    String? time,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
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
