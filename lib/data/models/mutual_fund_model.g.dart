// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mutual_fund_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MutualFundModel _$$_MutualFundModelFromJson(Map<String, dynamic> json) =>
    _$_MutualFundModel(
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MutualFundModelToJson(_$_MutualFundModel instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data,
    };

_$_Data _$$_DataFromJson(Map<String, dynamic> json) => _$_Data(
      name: json['name'] as String?,
      investment_manager_name: json['investment_manager_name'] as String?,
      investment_manager_fee: json['investment_manager_fee'] as String?,
      custodian_bank_name: json['custodian_bank_name'] as String?,
      sharia: json['sharia'] as bool?,
      index: json['index'] as bool?,
      dividend: json['dividend'] as bool?,
      net_asset_values: (json['net_asset_values'] as List<dynamic>?)
          ?.map((e) => NetAssetValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      detail: json['detail'] == null
          ? null
          : Detail.fromJson(json['detail'] as Map<String, dynamic>),
      last_update: json['last_update'] as String?,
    );

Map<String, dynamic> _$$_DataToJson(_$_Data instance) => <String, dynamic>{
      'name': instance.name,
      'investment_manager_name': instance.investment_manager_name,
      'investment_manager_fee': instance.investment_manager_fee,
      'custodian_bank_name': instance.custodian_bank_name,
      'sharia': instance.sharia,
      'index': instance.index,
      'dividend': instance.dividend,
      'net_asset_values': instance.net_asset_values,
      'detail': instance.detail,
      'last_update': instance.last_update,
    };

_$_Detail _$$_DetailFromJson(Map<String, dynamic> json) => _$_Detail(
      ipoDate: json['ipoDate'] == null
          ? null
          : DateTime.parse(json['ipoDate'] as String),
      description: json['description'] as String?,
      minimum_subscription: json['minimum_subscription'] as String?,
      minimum_next_subscription: json['minimum_next_subscription'] as String?,
      min_sub_num: json['min_sub_num'] as int?,
      min_next_sub_num: json['min_next_sub_num'] as int?,
      minimum_redemption: json['minimum_redemption'] as String?,
      min_red_num: json['min_red_num'] as int?,
      switching_fee: json['switching_fee'] as String?,
      min_balance: json['min_balance'] as String?,
      min_balance_num: json['min_balance_num'] as int?,
      switch_fee_num: json['switch_fee_num'] as int?,
      redemption_fee: json['redemption_fee'] as String?,
      investment_manager_fee: json['investment_manager_fee'] as String?,
      custodian_bank_fee: json['custodian_bank_fee'] as String?,
      sales_company_fee: json['sales_company_fee'] as String?,
      investment_bond: json['investment_bond'] as int?,
      investment_equity: json['investment_equity'] as int?,
      investment_money_market: json['investment_money_market'] as int?,
      investment_property: json['investment_property'] as int?,
      minimum_nav_value: json['minimum_nav_value'] as int?,
      maximum_nav_value: json['maximum_nav_value'] as int?,
      is_active: json['is_active'] as bool?,
      date_modified: json['date_modified'] == null
          ? null
          : DateTime.parse(json['date_modified'] as String),
    );

Map<String, dynamic> _$$_DetailToJson(_$_Detail instance) => <String, dynamic>{
      'ipoDate': instance.ipoDate?.toIso8601String(),
      'description': instance.description,
      'minimum_subscription': instance.minimum_subscription,
      'minimum_next_subscription': instance.minimum_next_subscription,
      'min_sub_num': instance.min_sub_num,
      'min_next_sub_num': instance.min_next_sub_num,
      'minimum_redemption': instance.minimum_redemption,
      'min_red_num': instance.min_red_num,
      'switching_fee': instance.switching_fee,
      'min_balance': instance.min_balance,
      'min_balance_num': instance.min_balance_num,
      'switch_fee_num': instance.switch_fee_num,
      'redemption_fee': instance.redemption_fee,
      'investment_manager_fee': instance.investment_manager_fee,
      'custodian_bank_fee': instance.custodian_bank_fee,
      'sales_company_fee': instance.sales_company_fee,
      'investment_bond': instance.investment_bond,
      'investment_equity': instance.investment_equity,
      'investment_money_market': instance.investment_money_market,
      'investment_property': instance.investment_property,
      'minimum_nav_value': instance.minimum_nav_value,
      'maximum_nav_value': instance.maximum_nav_value,
      'is_active': instance.is_active,
      'date_modified': instance.date_modified?.toIso8601String(),
    };

_$_NetAssetValue _$$_NetAssetValueFromJson(Map<String, dynamic> json) =>
    _$_NetAssetValue(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      value: (json['value'] as num?)?.toDouble(),
      daily_return: (json['daily_return'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_NetAssetValueToJson(_$_NetAssetValue instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'value': instance.value,
      'daily_return': instance.daily_return,
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
