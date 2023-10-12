import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'quotes_model.freezed.dart';
part 'quotes_model.g.dart';

QuotesModel quotesModelFromJson(String str) => QuotesModel.fromJson(json.decode(str));

String quotesModelToJson(QuotesModel data) => json.encode(data.toJson());

@freezed
class QuotesModel with _$QuotesModel {
    const factory QuotesModel({
        Meta? meta,
        List<Datum>? data,
    }) = _QuotesModel;

    factory QuotesModel.fromJson(Map<String, dynamic> json) => _$QuotesModelFromJson(json);
}

@freezed
class Datum with _$Datum {
    const factory Datum({
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
