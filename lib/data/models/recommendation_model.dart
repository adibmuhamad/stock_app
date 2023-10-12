import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'recommendation_model.freezed.dart';
part 'recommendation_model.g.dart';

RecommendationModel recommendationModelFromJson(String str) => RecommendationModel.fromJson(json.decode(str));

String recommendationModelToJson(RecommendationModel data) => json.encode(data.toJson());

@freezed
class RecommendationModel with _$RecommendationModel {
    const factory RecommendationModel({
        Meta? meta,
        List<Datum>? data,
    }) = _RecommendationModel;

    factory RecommendationModel.fromJson(Map<String, dynamic> json) => _$RecommendationModelFromJson(json);
}

@freezed
class Datum with _$Datum {
    const factory Datum({
        String? symbol,
        String? recommendation,
        String? description,
        double? price,
        double? buying_price,
        double? selling_price,
        double? stop_loss,
        double? target_price,
        double? predicted_price,
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
