import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'news_model.freezed.dart';
part 'news_model.g.dart';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

@freezed
class NewsModel with _$NewsModel {
    const factory NewsModel({
        Meta? meta,
        List<Datum>? data,
    }) = _NewsModel;

    factory NewsModel.fromJson(Map<String, dynamic> json) => _$NewsModelFromJson(json);
}

@freezed
class Datum with _$Datum {
    const factory Datum({
        String? date,
        String? category,
        String? title,
        String? description,
        String? link,
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
