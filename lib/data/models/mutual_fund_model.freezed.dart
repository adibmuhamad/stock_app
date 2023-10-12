// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mutual_fund_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MutualFundModel _$MutualFundModelFromJson(Map<String, dynamic> json) {
  return _MutualFundModel.fromJson(json);
}

/// @nodoc
mixin _$MutualFundModel {
  Meta? get meta => throw _privateConstructorUsedError;
  Data? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MutualFundModelCopyWith<MutualFundModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MutualFundModelCopyWith<$Res> {
  factory $MutualFundModelCopyWith(
          MutualFundModel value, $Res Function(MutualFundModel) then) =
      _$MutualFundModelCopyWithImpl<$Res, MutualFundModel>;
  @useResult
  $Res call({Meta? meta, Data? data});

  $MetaCopyWith<$Res>? get meta;
  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$MutualFundModelCopyWithImpl<$Res, $Val extends MutualFundModel>
    implements $MutualFundModelCopyWith<$Res> {
  _$MutualFundModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MetaCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $MetaCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MutualFundModelCopyWith<$Res>
    implements $MutualFundModelCopyWith<$Res> {
  factory _$$_MutualFundModelCopyWith(
          _$_MutualFundModel value, $Res Function(_$_MutualFundModel) then) =
      __$$_MutualFundModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Meta? meta, Data? data});

  @override
  $MetaCopyWith<$Res>? get meta;
  @override
  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_MutualFundModelCopyWithImpl<$Res>
    extends _$MutualFundModelCopyWithImpl<$Res, _$_MutualFundModel>
    implements _$$_MutualFundModelCopyWith<$Res> {
  __$$_MutualFundModelCopyWithImpl(
      _$_MutualFundModel _value, $Res Function(_$_MutualFundModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_MutualFundModel(
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MutualFundModel implements _MutualFundModel {
  const _$_MutualFundModel({this.meta, this.data});

  factory _$_MutualFundModel.fromJson(Map<String, dynamic> json) =>
      _$$_MutualFundModelFromJson(json);

  @override
  final Meta? meta;
  @override
  final Data? data;

  @override
  String toString() {
    return 'MutualFundModel(meta: $meta, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MutualFundModel &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, meta, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MutualFundModelCopyWith<_$_MutualFundModel> get copyWith =>
      __$$_MutualFundModelCopyWithImpl<_$_MutualFundModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MutualFundModelToJson(
      this,
    );
  }
}

abstract class _MutualFundModel implements MutualFundModel {
  const factory _MutualFundModel({final Meta? meta, final Data? data}) =
      _$_MutualFundModel;

  factory _MutualFundModel.fromJson(Map<String, dynamic> json) =
      _$_MutualFundModel.fromJson;

  @override
  Meta? get meta;
  @override
  Data? get data;
  @override
  @JsonKey(ignore: true)
  _$$_MutualFundModelCopyWith<_$_MutualFundModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  String? get name => throw _privateConstructorUsedError;
  String? get investment_manager_name => throw _privateConstructorUsedError;
  String? get investment_manager_fee => throw _privateConstructorUsedError;
  String? get custodian_bank_name => throw _privateConstructorUsedError;
  bool? get sharia => throw _privateConstructorUsedError;
  bool? get index => throw _privateConstructorUsedError;
  bool? get dividend => throw _privateConstructorUsedError;
  List<NetAssetValue>? get net_asset_values =>
      throw _privateConstructorUsedError;
  Detail? get detail => throw _privateConstructorUsedError;
  String? get last_update => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call(
      {String? name,
      String? investment_manager_name,
      String? investment_manager_fee,
      String? custodian_bank_name,
      bool? sharia,
      bool? index,
      bool? dividend,
      List<NetAssetValue>? net_asset_values,
      Detail? detail,
      String? last_update});

  $DetailCopyWith<$Res>? get detail;
}

/// @nodoc
class _$DataCopyWithImpl<$Res, $Val extends Data>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? investment_manager_name = freezed,
    Object? investment_manager_fee = freezed,
    Object? custodian_bank_name = freezed,
    Object? sharia = freezed,
    Object? index = freezed,
    Object? dividend = freezed,
    Object? net_asset_values = freezed,
    Object? detail = freezed,
    Object? last_update = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      investment_manager_name: freezed == investment_manager_name
          ? _value.investment_manager_name
          : investment_manager_name // ignore: cast_nullable_to_non_nullable
              as String?,
      investment_manager_fee: freezed == investment_manager_fee
          ? _value.investment_manager_fee
          : investment_manager_fee // ignore: cast_nullable_to_non_nullable
              as String?,
      custodian_bank_name: freezed == custodian_bank_name
          ? _value.custodian_bank_name
          : custodian_bank_name // ignore: cast_nullable_to_non_nullable
              as String?,
      sharia: freezed == sharia
          ? _value.sharia
          : sharia // ignore: cast_nullable_to_non_nullable
              as bool?,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as bool?,
      dividend: freezed == dividend
          ? _value.dividend
          : dividend // ignore: cast_nullable_to_non_nullable
              as bool?,
      net_asset_values: freezed == net_asset_values
          ? _value.net_asset_values
          : net_asset_values // ignore: cast_nullable_to_non_nullable
              as List<NetAssetValue>?,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as Detail?,
      last_update: freezed == last_update
          ? _value.last_update
          : last_update // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DetailCopyWith<$Res>? get detail {
    if (_value.detail == null) {
      return null;
    }

    return $DetailCopyWith<$Res>(_value.detail!, (value) {
      return _then(_value.copyWith(detail: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DataCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$_DataCopyWith(_$_Data value, $Res Function(_$_Data) then) =
      __$$_DataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? investment_manager_name,
      String? investment_manager_fee,
      String? custodian_bank_name,
      bool? sharia,
      bool? index,
      bool? dividend,
      List<NetAssetValue>? net_asset_values,
      Detail? detail,
      String? last_update});

  @override
  $DetailCopyWith<$Res>? get detail;
}

/// @nodoc
class __$$_DataCopyWithImpl<$Res> extends _$DataCopyWithImpl<$Res, _$_Data>
    implements _$$_DataCopyWith<$Res> {
  __$$_DataCopyWithImpl(_$_Data _value, $Res Function(_$_Data) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? investment_manager_name = freezed,
    Object? investment_manager_fee = freezed,
    Object? custodian_bank_name = freezed,
    Object? sharia = freezed,
    Object? index = freezed,
    Object? dividend = freezed,
    Object? net_asset_values = freezed,
    Object? detail = freezed,
    Object? last_update = freezed,
  }) {
    return _then(_$_Data(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      investment_manager_name: freezed == investment_manager_name
          ? _value.investment_manager_name
          : investment_manager_name // ignore: cast_nullable_to_non_nullable
              as String?,
      investment_manager_fee: freezed == investment_manager_fee
          ? _value.investment_manager_fee
          : investment_manager_fee // ignore: cast_nullable_to_non_nullable
              as String?,
      custodian_bank_name: freezed == custodian_bank_name
          ? _value.custodian_bank_name
          : custodian_bank_name // ignore: cast_nullable_to_non_nullable
              as String?,
      sharia: freezed == sharia
          ? _value.sharia
          : sharia // ignore: cast_nullable_to_non_nullable
              as bool?,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as bool?,
      dividend: freezed == dividend
          ? _value.dividend
          : dividend // ignore: cast_nullable_to_non_nullable
              as bool?,
      net_asset_values: freezed == net_asset_values
          ? _value._net_asset_values
          : net_asset_values // ignore: cast_nullable_to_non_nullable
              as List<NetAssetValue>?,
      detail: freezed == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as Detail?,
      last_update: freezed == last_update
          ? _value.last_update
          : last_update // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Data implements _Data {
  const _$_Data(
      {this.name,
      this.investment_manager_name,
      this.investment_manager_fee,
      this.custodian_bank_name,
      this.sharia,
      this.index,
      this.dividend,
      final List<NetAssetValue>? net_asset_values,
      this.detail,
      this.last_update})
      : _net_asset_values = net_asset_values;

  factory _$_Data.fromJson(Map<String, dynamic> json) => _$$_DataFromJson(json);

  @override
  final String? name;
  @override
  final String? investment_manager_name;
  @override
  final String? investment_manager_fee;
  @override
  final String? custodian_bank_name;
  @override
  final bool? sharia;
  @override
  final bool? index;
  @override
  final bool? dividend;
  final List<NetAssetValue>? _net_asset_values;
  @override
  List<NetAssetValue>? get net_asset_values {
    final value = _net_asset_values;
    if (value == null) return null;
    if (_net_asset_values is EqualUnmodifiableListView)
      return _net_asset_values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Detail? detail;
  @override
  final String? last_update;

  @override
  String toString() {
    return 'Data(name: $name, investment_manager_name: $investment_manager_name, investment_manager_fee: $investment_manager_fee, custodian_bank_name: $custodian_bank_name, sharia: $sharia, index: $index, dividend: $dividend, net_asset_values: $net_asset_values, detail: $detail, last_update: $last_update)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Data &&
            (identical(other.name, name) || other.name == name) &&
            (identical(
                    other.investment_manager_name, investment_manager_name) ||
                other.investment_manager_name == investment_manager_name) &&
            (identical(other.investment_manager_fee, investment_manager_fee) ||
                other.investment_manager_fee == investment_manager_fee) &&
            (identical(other.custodian_bank_name, custodian_bank_name) ||
                other.custodian_bank_name == custodian_bank_name) &&
            (identical(other.sharia, sharia) || other.sharia == sharia) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.dividend, dividend) ||
                other.dividend == dividend) &&
            const DeepCollectionEquality()
                .equals(other._net_asset_values, _net_asset_values) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.last_update, last_update) ||
                other.last_update == last_update));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      investment_manager_name,
      investment_manager_fee,
      custodian_bank_name,
      sharia,
      index,
      dividend,
      const DeepCollectionEquality().hash(_net_asset_values),
      detail,
      last_update);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DataCopyWith<_$_Data> get copyWith =>
      __$$_DataCopyWithImpl<_$_Data>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DataToJson(
      this,
    );
  }
}

abstract class _Data implements Data {
  const factory _Data(
      {final String? name,
      final String? investment_manager_name,
      final String? investment_manager_fee,
      final String? custodian_bank_name,
      final bool? sharia,
      final bool? index,
      final bool? dividend,
      final List<NetAssetValue>? net_asset_values,
      final Detail? detail,
      final String? last_update}) = _$_Data;

  factory _Data.fromJson(Map<String, dynamic> json) = _$_Data.fromJson;

  @override
  String? get name;
  @override
  String? get investment_manager_name;
  @override
  String? get investment_manager_fee;
  @override
  String? get custodian_bank_name;
  @override
  bool? get sharia;
  @override
  bool? get index;
  @override
  bool? get dividend;
  @override
  List<NetAssetValue>? get net_asset_values;
  @override
  Detail? get detail;
  @override
  String? get last_update;
  @override
  @JsonKey(ignore: true)
  _$$_DataCopyWith<_$_Data> get copyWith => throw _privateConstructorUsedError;
}

Detail _$DetailFromJson(Map<String, dynamic> json) {
  return _Detail.fromJson(json);
}

/// @nodoc
mixin _$Detail {
  DateTime? get ipoDate => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get minimum_subscription => throw _privateConstructorUsedError;
  String? get minimum_next_subscription => throw _privateConstructorUsedError;
  int? get min_sub_num => throw _privateConstructorUsedError;
  int? get min_next_sub_num => throw _privateConstructorUsedError;
  String? get minimum_redemption => throw _privateConstructorUsedError;
  int? get min_red_num => throw _privateConstructorUsedError;
  String? get switching_fee => throw _privateConstructorUsedError;
  String? get min_balance => throw _privateConstructorUsedError;
  int? get min_balance_num => throw _privateConstructorUsedError;
  int? get switch_fee_num => throw _privateConstructorUsedError;
  String? get redemption_fee => throw _privateConstructorUsedError;
  String? get investment_manager_fee => throw _privateConstructorUsedError;
  String? get custodian_bank_fee => throw _privateConstructorUsedError;
  String? get sales_company_fee => throw _privateConstructorUsedError;
  int? get investment_bond => throw _privateConstructorUsedError;
  int? get investment_equity => throw _privateConstructorUsedError;
  int? get investment_money_market => throw _privateConstructorUsedError;
  int? get investment_property => throw _privateConstructorUsedError;
  int? get minimum_nav_value => throw _privateConstructorUsedError;
  int? get maximum_nav_value => throw _privateConstructorUsedError;
  bool? get is_active => throw _privateConstructorUsedError;
  DateTime? get date_modified => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailCopyWith<Detail> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailCopyWith<$Res> {
  factory $DetailCopyWith(Detail value, $Res Function(Detail) then) =
      _$DetailCopyWithImpl<$Res, Detail>;
  @useResult
  $Res call(
      {DateTime? ipoDate,
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
      DateTime? date_modified});
}

/// @nodoc
class _$DetailCopyWithImpl<$Res, $Val extends Detail>
    implements $DetailCopyWith<$Res> {
  _$DetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ipoDate = freezed,
    Object? description = freezed,
    Object? minimum_subscription = freezed,
    Object? minimum_next_subscription = freezed,
    Object? min_sub_num = freezed,
    Object? min_next_sub_num = freezed,
    Object? minimum_redemption = freezed,
    Object? min_red_num = freezed,
    Object? switching_fee = freezed,
    Object? min_balance = freezed,
    Object? min_balance_num = freezed,
    Object? switch_fee_num = freezed,
    Object? redemption_fee = freezed,
    Object? investment_manager_fee = freezed,
    Object? custodian_bank_fee = freezed,
    Object? sales_company_fee = freezed,
    Object? investment_bond = freezed,
    Object? investment_equity = freezed,
    Object? investment_money_market = freezed,
    Object? investment_property = freezed,
    Object? minimum_nav_value = freezed,
    Object? maximum_nav_value = freezed,
    Object? is_active = freezed,
    Object? date_modified = freezed,
  }) {
    return _then(_value.copyWith(
      ipoDate: freezed == ipoDate
          ? _value.ipoDate
          : ipoDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      minimum_subscription: freezed == minimum_subscription
          ? _value.minimum_subscription
          : minimum_subscription // ignore: cast_nullable_to_non_nullable
              as String?,
      minimum_next_subscription: freezed == minimum_next_subscription
          ? _value.minimum_next_subscription
          : minimum_next_subscription // ignore: cast_nullable_to_non_nullable
              as String?,
      min_sub_num: freezed == min_sub_num
          ? _value.min_sub_num
          : min_sub_num // ignore: cast_nullable_to_non_nullable
              as int?,
      min_next_sub_num: freezed == min_next_sub_num
          ? _value.min_next_sub_num
          : min_next_sub_num // ignore: cast_nullable_to_non_nullable
              as int?,
      minimum_redemption: freezed == minimum_redemption
          ? _value.minimum_redemption
          : minimum_redemption // ignore: cast_nullable_to_non_nullable
              as String?,
      min_red_num: freezed == min_red_num
          ? _value.min_red_num
          : min_red_num // ignore: cast_nullable_to_non_nullable
              as int?,
      switching_fee: freezed == switching_fee
          ? _value.switching_fee
          : switching_fee // ignore: cast_nullable_to_non_nullable
              as String?,
      min_balance: freezed == min_balance
          ? _value.min_balance
          : min_balance // ignore: cast_nullable_to_non_nullable
              as String?,
      min_balance_num: freezed == min_balance_num
          ? _value.min_balance_num
          : min_balance_num // ignore: cast_nullable_to_non_nullable
              as int?,
      switch_fee_num: freezed == switch_fee_num
          ? _value.switch_fee_num
          : switch_fee_num // ignore: cast_nullable_to_non_nullable
              as int?,
      redemption_fee: freezed == redemption_fee
          ? _value.redemption_fee
          : redemption_fee // ignore: cast_nullable_to_non_nullable
              as String?,
      investment_manager_fee: freezed == investment_manager_fee
          ? _value.investment_manager_fee
          : investment_manager_fee // ignore: cast_nullable_to_non_nullable
              as String?,
      custodian_bank_fee: freezed == custodian_bank_fee
          ? _value.custodian_bank_fee
          : custodian_bank_fee // ignore: cast_nullable_to_non_nullable
              as String?,
      sales_company_fee: freezed == sales_company_fee
          ? _value.sales_company_fee
          : sales_company_fee // ignore: cast_nullable_to_non_nullable
              as String?,
      investment_bond: freezed == investment_bond
          ? _value.investment_bond
          : investment_bond // ignore: cast_nullable_to_non_nullable
              as int?,
      investment_equity: freezed == investment_equity
          ? _value.investment_equity
          : investment_equity // ignore: cast_nullable_to_non_nullable
              as int?,
      investment_money_market: freezed == investment_money_market
          ? _value.investment_money_market
          : investment_money_market // ignore: cast_nullable_to_non_nullable
              as int?,
      investment_property: freezed == investment_property
          ? _value.investment_property
          : investment_property // ignore: cast_nullable_to_non_nullable
              as int?,
      minimum_nav_value: freezed == minimum_nav_value
          ? _value.minimum_nav_value
          : minimum_nav_value // ignore: cast_nullable_to_non_nullable
              as int?,
      maximum_nav_value: freezed == maximum_nav_value
          ? _value.maximum_nav_value
          : maximum_nav_value // ignore: cast_nullable_to_non_nullable
              as int?,
      is_active: freezed == is_active
          ? _value.is_active
          : is_active // ignore: cast_nullable_to_non_nullable
              as bool?,
      date_modified: freezed == date_modified
          ? _value.date_modified
          : date_modified // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DetailCopyWith<$Res> implements $DetailCopyWith<$Res> {
  factory _$$_DetailCopyWith(_$_Detail value, $Res Function(_$_Detail) then) =
      __$$_DetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? ipoDate,
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
      DateTime? date_modified});
}

/// @nodoc
class __$$_DetailCopyWithImpl<$Res>
    extends _$DetailCopyWithImpl<$Res, _$_Detail>
    implements _$$_DetailCopyWith<$Res> {
  __$$_DetailCopyWithImpl(_$_Detail _value, $Res Function(_$_Detail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ipoDate = freezed,
    Object? description = freezed,
    Object? minimum_subscription = freezed,
    Object? minimum_next_subscription = freezed,
    Object? min_sub_num = freezed,
    Object? min_next_sub_num = freezed,
    Object? minimum_redemption = freezed,
    Object? min_red_num = freezed,
    Object? switching_fee = freezed,
    Object? min_balance = freezed,
    Object? min_balance_num = freezed,
    Object? switch_fee_num = freezed,
    Object? redemption_fee = freezed,
    Object? investment_manager_fee = freezed,
    Object? custodian_bank_fee = freezed,
    Object? sales_company_fee = freezed,
    Object? investment_bond = freezed,
    Object? investment_equity = freezed,
    Object? investment_money_market = freezed,
    Object? investment_property = freezed,
    Object? minimum_nav_value = freezed,
    Object? maximum_nav_value = freezed,
    Object? is_active = freezed,
    Object? date_modified = freezed,
  }) {
    return _then(_$_Detail(
      ipoDate: freezed == ipoDate
          ? _value.ipoDate
          : ipoDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      minimum_subscription: freezed == minimum_subscription
          ? _value.minimum_subscription
          : minimum_subscription // ignore: cast_nullable_to_non_nullable
              as String?,
      minimum_next_subscription: freezed == minimum_next_subscription
          ? _value.minimum_next_subscription
          : minimum_next_subscription // ignore: cast_nullable_to_non_nullable
              as String?,
      min_sub_num: freezed == min_sub_num
          ? _value.min_sub_num
          : min_sub_num // ignore: cast_nullable_to_non_nullable
              as int?,
      min_next_sub_num: freezed == min_next_sub_num
          ? _value.min_next_sub_num
          : min_next_sub_num // ignore: cast_nullable_to_non_nullable
              as int?,
      minimum_redemption: freezed == minimum_redemption
          ? _value.minimum_redemption
          : minimum_redemption // ignore: cast_nullable_to_non_nullable
              as String?,
      min_red_num: freezed == min_red_num
          ? _value.min_red_num
          : min_red_num // ignore: cast_nullable_to_non_nullable
              as int?,
      switching_fee: freezed == switching_fee
          ? _value.switching_fee
          : switching_fee // ignore: cast_nullable_to_non_nullable
              as String?,
      min_balance: freezed == min_balance
          ? _value.min_balance
          : min_balance // ignore: cast_nullable_to_non_nullable
              as String?,
      min_balance_num: freezed == min_balance_num
          ? _value.min_balance_num
          : min_balance_num // ignore: cast_nullable_to_non_nullable
              as int?,
      switch_fee_num: freezed == switch_fee_num
          ? _value.switch_fee_num
          : switch_fee_num // ignore: cast_nullable_to_non_nullable
              as int?,
      redemption_fee: freezed == redemption_fee
          ? _value.redemption_fee
          : redemption_fee // ignore: cast_nullable_to_non_nullable
              as String?,
      investment_manager_fee: freezed == investment_manager_fee
          ? _value.investment_manager_fee
          : investment_manager_fee // ignore: cast_nullable_to_non_nullable
              as String?,
      custodian_bank_fee: freezed == custodian_bank_fee
          ? _value.custodian_bank_fee
          : custodian_bank_fee // ignore: cast_nullable_to_non_nullable
              as String?,
      sales_company_fee: freezed == sales_company_fee
          ? _value.sales_company_fee
          : sales_company_fee // ignore: cast_nullable_to_non_nullable
              as String?,
      investment_bond: freezed == investment_bond
          ? _value.investment_bond
          : investment_bond // ignore: cast_nullable_to_non_nullable
              as int?,
      investment_equity: freezed == investment_equity
          ? _value.investment_equity
          : investment_equity // ignore: cast_nullable_to_non_nullable
              as int?,
      investment_money_market: freezed == investment_money_market
          ? _value.investment_money_market
          : investment_money_market // ignore: cast_nullable_to_non_nullable
              as int?,
      investment_property: freezed == investment_property
          ? _value.investment_property
          : investment_property // ignore: cast_nullable_to_non_nullable
              as int?,
      minimum_nav_value: freezed == minimum_nav_value
          ? _value.minimum_nav_value
          : minimum_nav_value // ignore: cast_nullable_to_non_nullable
              as int?,
      maximum_nav_value: freezed == maximum_nav_value
          ? _value.maximum_nav_value
          : maximum_nav_value // ignore: cast_nullable_to_non_nullable
              as int?,
      is_active: freezed == is_active
          ? _value.is_active
          : is_active // ignore: cast_nullable_to_non_nullable
              as bool?,
      date_modified: freezed == date_modified
          ? _value.date_modified
          : date_modified // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Detail implements _Detail {
  const _$_Detail(
      {this.ipoDate,
      this.description,
      this.minimum_subscription,
      this.minimum_next_subscription,
      this.min_sub_num,
      this.min_next_sub_num,
      this.minimum_redemption,
      this.min_red_num,
      this.switching_fee,
      this.min_balance,
      this.min_balance_num,
      this.switch_fee_num,
      this.redemption_fee,
      this.investment_manager_fee,
      this.custodian_bank_fee,
      this.sales_company_fee,
      this.investment_bond,
      this.investment_equity,
      this.investment_money_market,
      this.investment_property,
      this.minimum_nav_value,
      this.maximum_nav_value,
      this.is_active,
      this.date_modified});

  factory _$_Detail.fromJson(Map<String, dynamic> json) =>
      _$$_DetailFromJson(json);

  @override
  final DateTime? ipoDate;
  @override
  final String? description;
  @override
  final String? minimum_subscription;
  @override
  final String? minimum_next_subscription;
  @override
  final int? min_sub_num;
  @override
  final int? min_next_sub_num;
  @override
  final String? minimum_redemption;
  @override
  final int? min_red_num;
  @override
  final String? switching_fee;
  @override
  final String? min_balance;
  @override
  final int? min_balance_num;
  @override
  final int? switch_fee_num;
  @override
  final String? redemption_fee;
  @override
  final String? investment_manager_fee;
  @override
  final String? custodian_bank_fee;
  @override
  final String? sales_company_fee;
  @override
  final int? investment_bond;
  @override
  final int? investment_equity;
  @override
  final int? investment_money_market;
  @override
  final int? investment_property;
  @override
  final int? minimum_nav_value;
  @override
  final int? maximum_nav_value;
  @override
  final bool? is_active;
  @override
  final DateTime? date_modified;

  @override
  String toString() {
    return 'Detail(ipoDate: $ipoDate, description: $description, minimum_subscription: $minimum_subscription, minimum_next_subscription: $minimum_next_subscription, min_sub_num: $min_sub_num, min_next_sub_num: $min_next_sub_num, minimum_redemption: $minimum_redemption, min_red_num: $min_red_num, switching_fee: $switching_fee, min_balance: $min_balance, min_balance_num: $min_balance_num, switch_fee_num: $switch_fee_num, redemption_fee: $redemption_fee, investment_manager_fee: $investment_manager_fee, custodian_bank_fee: $custodian_bank_fee, sales_company_fee: $sales_company_fee, investment_bond: $investment_bond, investment_equity: $investment_equity, investment_money_market: $investment_money_market, investment_property: $investment_property, minimum_nav_value: $minimum_nav_value, maximum_nav_value: $maximum_nav_value, is_active: $is_active, date_modified: $date_modified)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Detail &&
            (identical(other.ipoDate, ipoDate) || other.ipoDate == ipoDate) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.minimum_subscription, minimum_subscription) ||
                other.minimum_subscription == minimum_subscription) &&
            (identical(other.minimum_next_subscription,
                    minimum_next_subscription) ||
                other.minimum_next_subscription == minimum_next_subscription) &&
            (identical(other.min_sub_num, min_sub_num) ||
                other.min_sub_num == min_sub_num) &&
            (identical(other.min_next_sub_num, min_next_sub_num) ||
                other.min_next_sub_num == min_next_sub_num) &&
            (identical(other.minimum_redemption, minimum_redemption) ||
                other.minimum_redemption == minimum_redemption) &&
            (identical(other.min_red_num, min_red_num) ||
                other.min_red_num == min_red_num) &&
            (identical(other.switching_fee, switching_fee) ||
                other.switching_fee == switching_fee) &&
            (identical(other.min_balance, min_balance) ||
                other.min_balance == min_balance) &&
            (identical(other.min_balance_num, min_balance_num) ||
                other.min_balance_num == min_balance_num) &&
            (identical(other.switch_fee_num, switch_fee_num) ||
                other.switch_fee_num == switch_fee_num) &&
            (identical(other.redemption_fee, redemption_fee) ||
                other.redemption_fee == redemption_fee) &&
            (identical(other.investment_manager_fee, investment_manager_fee) ||
                other.investment_manager_fee == investment_manager_fee) &&
            (identical(other.custodian_bank_fee, custodian_bank_fee) ||
                other.custodian_bank_fee == custodian_bank_fee) &&
            (identical(other.sales_company_fee, sales_company_fee) ||
                other.sales_company_fee == sales_company_fee) &&
            (identical(other.investment_bond, investment_bond) ||
                other.investment_bond == investment_bond) &&
            (identical(other.investment_equity, investment_equity) ||
                other.investment_equity == investment_equity) &&
            (identical(
                    other.investment_money_market, investment_money_market) ||
                other.investment_money_market == investment_money_market) &&
            (identical(other.investment_property, investment_property) ||
                other.investment_property == investment_property) &&
            (identical(other.minimum_nav_value, minimum_nav_value) ||
                other.minimum_nav_value == minimum_nav_value) &&
            (identical(other.maximum_nav_value, maximum_nav_value) ||
                other.maximum_nav_value == maximum_nav_value) &&
            (identical(other.is_active, is_active) ||
                other.is_active == is_active) &&
            (identical(other.date_modified, date_modified) ||
                other.date_modified == date_modified));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        ipoDate,
        description,
        minimum_subscription,
        minimum_next_subscription,
        min_sub_num,
        min_next_sub_num,
        minimum_redemption,
        min_red_num,
        switching_fee,
        min_balance,
        min_balance_num,
        switch_fee_num,
        redemption_fee,
        investment_manager_fee,
        custodian_bank_fee,
        sales_company_fee,
        investment_bond,
        investment_equity,
        investment_money_market,
        investment_property,
        minimum_nav_value,
        maximum_nav_value,
        is_active,
        date_modified
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DetailCopyWith<_$_Detail> get copyWith =>
      __$$_DetailCopyWithImpl<_$_Detail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DetailToJson(
      this,
    );
  }
}

abstract class _Detail implements Detail {
  const factory _Detail(
      {final DateTime? ipoDate,
      final String? description,
      final String? minimum_subscription,
      final String? minimum_next_subscription,
      final int? min_sub_num,
      final int? min_next_sub_num,
      final String? minimum_redemption,
      final int? min_red_num,
      final String? switching_fee,
      final String? min_balance,
      final int? min_balance_num,
      final int? switch_fee_num,
      final String? redemption_fee,
      final String? investment_manager_fee,
      final String? custodian_bank_fee,
      final String? sales_company_fee,
      final int? investment_bond,
      final int? investment_equity,
      final int? investment_money_market,
      final int? investment_property,
      final int? minimum_nav_value,
      final int? maximum_nav_value,
      final bool? is_active,
      final DateTime? date_modified}) = _$_Detail;

  factory _Detail.fromJson(Map<String, dynamic> json) = _$_Detail.fromJson;

  @override
  DateTime? get ipoDate;
  @override
  String? get description;
  @override
  String? get minimum_subscription;
  @override
  String? get minimum_next_subscription;
  @override
  int? get min_sub_num;
  @override
  int? get min_next_sub_num;
  @override
  String? get minimum_redemption;
  @override
  int? get min_red_num;
  @override
  String? get switching_fee;
  @override
  String? get min_balance;
  @override
  int? get min_balance_num;
  @override
  int? get switch_fee_num;
  @override
  String? get redemption_fee;
  @override
  String? get investment_manager_fee;
  @override
  String? get custodian_bank_fee;
  @override
  String? get sales_company_fee;
  @override
  int? get investment_bond;
  @override
  int? get investment_equity;
  @override
  int? get investment_money_market;
  @override
  int? get investment_property;
  @override
  int? get minimum_nav_value;
  @override
  int? get maximum_nav_value;
  @override
  bool? get is_active;
  @override
  DateTime? get date_modified;
  @override
  @JsonKey(ignore: true)
  _$$_DetailCopyWith<_$_Detail> get copyWith =>
      throw _privateConstructorUsedError;
}

NetAssetValue _$NetAssetValueFromJson(Map<String, dynamic> json) {
  return _NetAssetValue.fromJson(json);
}

/// @nodoc
mixin _$NetAssetValue {
  DateTime? get date => throw _privateConstructorUsedError;
  double? get value => throw _privateConstructorUsedError;
  double? get daily_return => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NetAssetValueCopyWith<NetAssetValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetAssetValueCopyWith<$Res> {
  factory $NetAssetValueCopyWith(
          NetAssetValue value, $Res Function(NetAssetValue) then) =
      _$NetAssetValueCopyWithImpl<$Res, NetAssetValue>;
  @useResult
  $Res call({DateTime? date, double? value, double? daily_return});
}

/// @nodoc
class _$NetAssetValueCopyWithImpl<$Res, $Val extends NetAssetValue>
    implements $NetAssetValueCopyWith<$Res> {
  _$NetAssetValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? value = freezed,
    Object? daily_return = freezed,
  }) {
    return _then(_value.copyWith(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double?,
      daily_return: freezed == daily_return
          ? _value.daily_return
          : daily_return // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NetAssetValueCopyWith<$Res>
    implements $NetAssetValueCopyWith<$Res> {
  factory _$$_NetAssetValueCopyWith(
          _$_NetAssetValue value, $Res Function(_$_NetAssetValue) then) =
      __$$_NetAssetValueCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime? date, double? value, double? daily_return});
}

/// @nodoc
class __$$_NetAssetValueCopyWithImpl<$Res>
    extends _$NetAssetValueCopyWithImpl<$Res, _$_NetAssetValue>
    implements _$$_NetAssetValueCopyWith<$Res> {
  __$$_NetAssetValueCopyWithImpl(
      _$_NetAssetValue _value, $Res Function(_$_NetAssetValue) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? value = freezed,
    Object? daily_return = freezed,
  }) {
    return _then(_$_NetAssetValue(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double?,
      daily_return: freezed == daily_return
          ? _value.daily_return
          : daily_return // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NetAssetValue implements _NetAssetValue {
  const _$_NetAssetValue({this.date, this.value, this.daily_return});

  factory _$_NetAssetValue.fromJson(Map<String, dynamic> json) =>
      _$$_NetAssetValueFromJson(json);

  @override
  final DateTime? date;
  @override
  final double? value;
  @override
  final double? daily_return;

  @override
  String toString() {
    return 'NetAssetValue(date: $date, value: $value, daily_return: $daily_return)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NetAssetValue &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.daily_return, daily_return) ||
                other.daily_return == daily_return));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, value, daily_return);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NetAssetValueCopyWith<_$_NetAssetValue> get copyWith =>
      __$$_NetAssetValueCopyWithImpl<_$_NetAssetValue>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NetAssetValueToJson(
      this,
    );
  }
}

abstract class _NetAssetValue implements NetAssetValue {
  const factory _NetAssetValue(
      {final DateTime? date,
      final double? value,
      final double? daily_return}) = _$_NetAssetValue;

  factory _NetAssetValue.fromJson(Map<String, dynamic> json) =
      _$_NetAssetValue.fromJson;

  @override
  DateTime? get date;
  @override
  double? get value;
  @override
  double? get daily_return;
  @override
  @JsonKey(ignore: true)
  _$$_NetAssetValueCopyWith<_$_NetAssetValue> get copyWith =>
      throw _privateConstructorUsedError;
}

Meta _$MetaFromJson(Map<String, dynamic> json) {
  return _Meta.fromJson(json);
}

/// @nodoc
mixin _$Meta {
  int? get code => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MetaCopyWith<Meta> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaCopyWith<$Res> {
  factory $MetaCopyWith(Meta value, $Res Function(Meta) then) =
      _$MetaCopyWithImpl<$Res, Meta>;
  @useResult
  $Res call({int? code, String? status, String? message});
}

/// @nodoc
class _$MetaCopyWithImpl<$Res, $Val extends Meta>
    implements $MetaCopyWith<$Res> {
  _$MetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? status = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MetaCopyWith<$Res> implements $MetaCopyWith<$Res> {
  factory _$$_MetaCopyWith(_$_Meta value, $Res Function(_$_Meta) then) =
      __$$_MetaCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? code, String? status, String? message});
}

/// @nodoc
class __$$_MetaCopyWithImpl<$Res> extends _$MetaCopyWithImpl<$Res, _$_Meta>
    implements _$$_MetaCopyWith<$Res> {
  __$$_MetaCopyWithImpl(_$_Meta _value, $Res Function(_$_Meta) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? status = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_Meta(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Meta implements _Meta {
  const _$_Meta({this.code, this.status, this.message});

  factory _$_Meta.fromJson(Map<String, dynamic> json) => _$$_MetaFromJson(json);

  @override
  final int? code;
  @override
  final String? status;
  @override
  final String? message;

  @override
  String toString() {
    return 'Meta(code: $code, status: $status, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Meta &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, status, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MetaCopyWith<_$_Meta> get copyWith =>
      __$$_MetaCopyWithImpl<_$_Meta>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MetaToJson(
      this,
    );
  }
}

abstract class _Meta implements Meta {
  const factory _Meta(
      {final int? code, final String? status, final String? message}) = _$_Meta;

  factory _Meta.fromJson(Map<String, dynamic> json) = _$_Meta.fromJson;

  @override
  int? get code;
  @override
  String? get status;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_MetaCopyWith<_$_Meta> get copyWith => throw _privateConstructorUsedError;
}
