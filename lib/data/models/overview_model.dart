import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'overview_model.freezed.dart';
part 'overview_model.g.dart';

OverviewModel overviewModelFromJson(String str) => OverviewModel.fromJson(json.decode(str));

String overviewModelToJson(OverviewModel data) => json.encode(data.toJson());

@freezed
class OverviewModel with _$OverviewModel {
    const factory OverviewModel({
        Meta? meta,
        Data? data,
    }) = _OverviewModel;

    factory OverviewModel.fromJson(Map<String, dynamic> json) => _$OverviewModelFromJson(json);
}

@freezed
class Data with _$Data {
    const factory Data({
        String? symbol,
        String? name,
        String? sector_name,
        String? sub_sector_name,
        String? industry_name,
        String? sub_industry_name,
        String? head_office,
        String? phone,
        String? representative_name,
        String? website_url,
        String? address,
        String? total_employees,
        String? exchange_administration,
        String? npwp,
        String? npkp,
        bool? is_active,
        String? listing_date,
        double? annual_dividend,
        String? general_information,
        String? fax,
        String? founding_date,
        String? company_email,
        List<CorporateAction>? corporate_actions,
        LastData? last_data,
    }) = _Data;

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class CorporateAction with _$CorporateAction {
    const factory CorporateAction({
        DateTime? date,
        String? type,
        String? stock_code,
        double? total_corporate_action,
        double? total_value,
    }) = _CorporateAction;

    factory CorporateAction.fromJson(Map<String, dynamic> json) => _$CorporateActionFromJson(json);
}

@freezed
class LastData with _$LastData {
    const factory LastData({
        double? close,
        double? open,
        double? high,
        double? low,
        double? change,
        double? per,
        double? pbr,
        double? one_day,
        double? one_week,
        double? one_month,
        double? three_month,
        double? six_month,
        double? one_year,
        double? three_year,
        double? five_year,
        double? ten_year,
        double? mtd,
        double? ytd,
        double? value,
        double? volume,
        double? frequency,
        double? market_cap,
        double? annual_high_price,
        double? annual_low_price,
        DateTime? time,
    }) = _LastData;

    factory LastData.fromJson(Map<String, dynamic> json) => _$LastDataFromJson(json);
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
