// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historical_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HistoricalModel _$$_HistoricalModelFromJson(Map<String, dynamic> json) =>
    _$_HistoricalModel(
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_HistoricalModelToJson(_$_HistoricalModel instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data,
    };

_$_Datum _$$_DatumFromJson(Map<String, dynamic> json) => _$_Datum(
      symbol: json['symbol'] as String?,
      open: (json['open'] as num?)?.toDouble(),
      close: (json['close'] as num?)?.toDouble(),
      high: (json['high'] as num?)?.toDouble(),
      low: (json['low'] as num?)?.toDouble(),
      volume: (json['volume'] as num?)?.toDouble(),
      change: (json['change'] as num?)?.toDouble(),
      change_percent: (json['change_percent'] as num?)?.toDouble(),
      timestamp: json['timestamp'] as int?,
    );

Map<String, dynamic> _$$_DatumToJson(_$_Datum instance) => <String, dynamic>{
      'symbol': instance.symbol,
      'open': instance.open,
      'close': instance.close,
      'high': instance.high,
      'low': instance.low,
      'volume': instance.volume,
      'change': instance.change,
      'change_percent': instance.change_percent,
      'timestamp': instance.timestamp,
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
