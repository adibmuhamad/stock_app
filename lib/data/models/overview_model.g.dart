// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overview_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OverviewModel _$$_OverviewModelFromJson(Map<String, dynamic> json) =>
    _$_OverviewModel(
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_OverviewModelToJson(_$_OverviewModel instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data,
    };

_$_Data _$$_DataFromJson(Map<String, dynamic> json) => _$_Data(
      symbol: json['symbol'] as String?,
      name: json['name'] as String?,
      sector_name: json['sector_name'] as String?,
      sub_sector_name: json['sub_sector_name'] as String?,
      industry_name: json['industry_name'] as String?,
      sub_industry_name: json['sub_industry_name'] as String?,
      head_office: json['head_office'] as String?,
      phone: json['phone'] as String?,
      representative_name: json['representative_name'] as String?,
      website_url: json['website_url'] as String?,
      address: json['address'] as String?,
      total_employees: json['total_employees'] as String?,
      exchange_administration: json['exchange_administration'] as String?,
      npwp: json['npwp'] as String?,
      npkp: json['npkp'] as String?,
      is_active: json['is_active'] as bool?,
      listing_date: json['listing_date'] as String?,
      annual_dividend: (json['annual_dividend'] as num?)?.toDouble(),
      general_information: json['general_information'] as String?,
      fax: json['fax'] as String?,
      founding_date: json['founding_date'] as String?,
      company_email: json['company_email'] as String?,
      corporate_actions: (json['corporate_actions'] as List<dynamic>?)
          ?.map((e) => CorporateAction.fromJson(e as Map<String, dynamic>))
          .toList(),
      last_data: json['last_data'] == null
          ? null
          : LastData.fromJson(json['last_data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DataToJson(_$_Data instance) => <String, dynamic>{
      'symbol': instance.symbol,
      'name': instance.name,
      'sector_name': instance.sector_name,
      'sub_sector_name': instance.sub_sector_name,
      'industry_name': instance.industry_name,
      'sub_industry_name': instance.sub_industry_name,
      'head_office': instance.head_office,
      'phone': instance.phone,
      'representative_name': instance.representative_name,
      'website_url': instance.website_url,
      'address': instance.address,
      'total_employees': instance.total_employees,
      'exchange_administration': instance.exchange_administration,
      'npwp': instance.npwp,
      'npkp': instance.npkp,
      'is_active': instance.is_active,
      'listing_date': instance.listing_date,
      'annual_dividend': instance.annual_dividend,
      'general_information': instance.general_information,
      'fax': instance.fax,
      'founding_date': instance.founding_date,
      'company_email': instance.company_email,
      'corporate_actions': instance.corporate_actions,
      'last_data': instance.last_data,
    };

_$_CorporateAction _$$_CorporateActionFromJson(Map<String, dynamic> json) =>
    _$_CorporateAction(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      type: json['type'] as String?,
      stock_code: json['stock_code'] as String?,
      total_corporate_action:
          (json['total_corporate_action'] as num?)?.toDouble(),
      total_value: (json['total_value'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_CorporateActionToJson(_$_CorporateAction instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'type': instance.type,
      'stock_code': instance.stock_code,
      'total_corporate_action': instance.total_corporate_action,
      'total_value': instance.total_value,
    };

_$_LastData _$$_LastDataFromJson(Map<String, dynamic> json) => _$_LastData(
      close: (json['close'] as num?)?.toDouble(),
      open: (json['open'] as num?)?.toDouble(),
      high: (json['high'] as num?)?.toDouble(),
      low: (json['low'] as num?)?.toDouble(),
      change: (json['change'] as num?)?.toDouble(),
      per: (json['per'] as num?)?.toDouble(),
      pbr: (json['pbr'] as num?)?.toDouble(),
      one_day: (json['one_day'] as num?)?.toDouble(),
      one_week: (json['one_week'] as num?)?.toDouble(),
      one_month: (json['one_month'] as num?)?.toDouble(),
      three_month: (json['three_month'] as num?)?.toDouble(),
      six_month: (json['six_month'] as num?)?.toDouble(),
      one_year: (json['one_year'] as num?)?.toDouble(),
      three_year: (json['three_year'] as num?)?.toDouble(),
      five_year: (json['five_year'] as num?)?.toDouble(),
      ten_year: (json['ten_year'] as num?)?.toDouble(),
      mtd: (json['mtd'] as num?)?.toDouble(),
      ytd: (json['ytd'] as num?)?.toDouble(),
      value: (json['value'] as num?)?.toDouble(),
      volume: (json['volume'] as num?)?.toDouble(),
      frequency: (json['frequency'] as num?)?.toDouble(),
      market_cap: (json['market_cap'] as num?)?.toDouble(),
      annual_high_price: (json['annual_high_price'] as num?)?.toDouble(),
      annual_low_price: (json['annual_low_price'] as num?)?.toDouble(),
      time:
          json['time'] == null ? null : DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$$_LastDataToJson(_$_LastData instance) =>
    <String, dynamic>{
      'close': instance.close,
      'open': instance.open,
      'high': instance.high,
      'low': instance.low,
      'change': instance.change,
      'per': instance.per,
      'pbr': instance.pbr,
      'one_day': instance.one_day,
      'one_week': instance.one_week,
      'one_month': instance.one_month,
      'three_month': instance.three_month,
      'six_month': instance.six_month,
      'one_year': instance.one_year,
      'three_year': instance.three_year,
      'five_year': instance.five_year,
      'ten_year': instance.ten_year,
      'mtd': instance.mtd,
      'ytd': instance.ytd,
      'value': instance.value,
      'volume': instance.volume,
      'frequency': instance.frequency,
      'market_cap': instance.market_cap,
      'annual_high_price': instance.annual_high_price,
      'annual_low_price': instance.annual_low_price,
      'time': instance.time?.toIso8601String(),
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
