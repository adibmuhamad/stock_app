// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_stocks_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SimpleStocksModel _$$_SimpleStocksModelFromJson(Map<String, dynamic> json) =>
    _$_SimpleStocksModel(
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SimpleStocksModelToJson(
        _$_SimpleStocksModel instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data,
    };

_$_Datum _$$_DatumFromJson(Map<String, dynamic> json) => _$_Datum(
      symbol: json['symbol'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$_DatumToJson(_$_Datum instance) => <String, dynamic>{
      'symbol': instance.symbol,
      'name': instance.name,
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
