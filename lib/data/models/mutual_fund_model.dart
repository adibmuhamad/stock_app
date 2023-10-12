import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'mutual_fund_model.freezed.dart';
part 'mutual_fund_model.g.dart';

MutualFundModel mutualFundModelFromJson(String str) => MutualFundModel.fromJson(json.decode(str));

String mutualFundModelToJson(MutualFundModel data) => json.encode(data.toJson());

@freezed
class MutualFundModel with _$MutualFundModel {
    const factory MutualFundModel({
        Meta? meta,
        Data? data,
    }) = _MutualFundModel;

    factory MutualFundModel.fromJson(Map<String, dynamic> json) => _$MutualFundModelFromJson(json);
}

@freezed
class Data with _$Data {
    const factory Data({
        String? name,
        String? investment_manager_name,
        String? investment_manager_fee,
        String? custodian_bank_name,
        bool? sharia,
        bool? index,
        bool? dividend,
        List<NetAssetValue>? net_asset_values,
        Detail? detail,
        String? last_update,
    }) = _Data;

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class Detail with _$Detail {
    const factory Detail({
        DateTime? ipoDate,
        String? description,
        String? minimum_subscription,
        String? minimum_next_subscription,
        int? min_sub_num,
        int? min_next_sub_num,
        String? minimum_redemption,
        int? min_red_num,
        String? switching_fee,
        String? min_balance,
        int? min_balance_num,
        int? switch_fee_num,
        String? redemption_fee,
        String? investment_manager_fee,
        String? custodian_bank_fee,
        String? sales_company_fee,
        int? investment_bond,
        int? investment_equity,
        int? investment_money_market,
        int? investment_property,
        int? minimum_nav_value,
        int? maximum_nav_value,
        bool? is_active,
        DateTime? date_modified,
    }) = _Detail;

    factory Detail.fromJson(Map<String, dynamic> json) => _$DetailFromJson(json);
}

@freezed
class NetAssetValue with _$NetAssetValue {
    const factory NetAssetValue({
        DateTime? date,
        double? value,
        double? daily_return,
    }) = _NetAssetValue;

    factory NetAssetValue.fromJson(Map<String, dynamic> json) => _$NetAssetValueFromJson(json);
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
