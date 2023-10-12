// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecommendationModel _$$_RecommendationModelFromJson(
        Map<String, dynamic> json) =>
    _$_RecommendationModel(
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RecommendationModelToJson(
        _$_RecommendationModel instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data,
    };

_$_Datum _$$_DatumFromJson(Map<String, dynamic> json) => _$_Datum(
      symbol: json['symbol'] as String?,
      recommendation: json['recommendation'] as String?,
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      buying_price: (json['buying_price'] as num?)?.toDouble(),
      selling_price: (json['selling_price'] as num?)?.toDouble(),
      stop_loss: (json['stop_loss'] as num?)?.toDouble(),
      target_price: (json['target_price'] as num?)?.toDouble(),
      predicted_price: (json['predicted_price'] as num?)?.toDouble(),
      time: json['time'] as String?,
    );

Map<String, dynamic> _$$_DatumToJson(_$_Datum instance) => <String, dynamic>{
      'symbol': instance.symbol,
      'recommendation': instance.recommendation,
      'description': instance.description,
      'price': instance.price,
      'buying_price': instance.buying_price,
      'selling_price': instance.selling_price,
      'stop_loss': instance.stop_loss,
      'target_price': instance.target_price,
      'predicted_price': instance.predicted_price,
      'time': instance.time,
    };

_$_Meta _$$_MetaFromJson(Map<String, dynamic> json) => _$_Meta(
      code: json['code'] as int?,
      status: json['status'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$_MetaToJson(_$_Meta instance) => <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'message': instance.message,
    };
