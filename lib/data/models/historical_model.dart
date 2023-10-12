import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'historical_model.freezed.dart';
part 'historical_model.g.dart';

HistoricalModel historicalModelFromJson(String str) => HistoricalModel.fromJson(json.decode(str));

String historicalModelToJson(HistoricalModel data) => json.encode(data.toJson());

@freezed
class HistoricalModel with _$HistoricalModel {
    const factory HistoricalModel({
        Meta? meta,
        List<Datum>? data,
    }) = _HistoricalModel;

    factory HistoricalModel.fromJson(Map<String, dynamic> json) => _$HistoricalModelFromJson(json);
}

@freezed
class Datum with _$Datum {
    const factory Datum({
        String? symbol,
        double? open,
        double? close,
        double? high,
        double? low,
        double? volume,
        double? change,
        double? change_percent,
        int? timestamp,
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

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
