// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quotes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuotesModel _$$_QuotesModelFromJson(Map<String, dynamic> json) =>
    _$_QuotesModel(
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_QuotesModelToJson(_$_QuotesModel instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data,
    };

_$_Datum _$$_DatumFromJson(Map<String, dynamic> json) => _$_Datum(
      id: json['id'] as int?,
      symbol: json['symbol'] as String?,
      name: json['name'] as String?,
      open: (json['open'] as num?)?.toDouble(),
      close: (json['close'] as num?)?.toDouble(),
      prev_close: (json['prev_close'] as num?)?.toDouble(),
      high: (json['high'] as num?)?.toDouble(),
      low: (json['low'] as num?)?.toDouble(),
      volume: (json['volume'] as num?)?.toDouble(),
      change: (json['change'] as num?)?.toDouble(),
      change_percent: (json['change_percent'] as num?)?.toDouble(),
      time: json['time'] as String?,
    );

Map<String, dynamic> _$$_DatumToJson(_$_Datum instance) => <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'open': instance.open,
      'close': instance.close,
      'prev_close': instance.prev_close,
      'high': instance.high,
      'low': instance.low,
      'volume': instance.volume,
      'change': instance.change,
      'change_percent': instance.change_percent,
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
