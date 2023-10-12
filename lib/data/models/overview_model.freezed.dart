// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'overview_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OverviewModel _$OverviewModelFromJson(Map<String, dynamic> json) {
  return _OverviewModel.fromJson(json);
}

/// @nodoc
mixin _$OverviewModel {
  Meta? get meta => throw _privateConstructorUsedError;
  Data? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OverviewModelCopyWith<OverviewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OverviewModelCopyWith<$Res> {
  factory $OverviewModelCopyWith(
          OverviewModel value, $Res Function(OverviewModel) then) =
      _$OverviewModelCopyWithImpl<$Res, OverviewModel>;
  @useResult
  $Res call({Meta? meta, Data? data});

  $MetaCopyWith<$Res>? get meta;
  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class _$OverviewModelCopyWithImpl<$Res, $Val extends OverviewModel>
    implements $OverviewModelCopyWith<$Res> {
  _$OverviewModelCopyWithImpl(this._value, this._then);

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
abstract class _$$_OverviewModelCopyWith<$Res>
    implements $OverviewModelCopyWith<$Res> {
  factory _$$_OverviewModelCopyWith(
          _$_OverviewModel value, $Res Function(_$_OverviewModel) then) =
      __$$_OverviewModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Meta? meta, Data? data});

  @override
  $MetaCopyWith<$Res>? get meta;
  @override
  $DataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$_OverviewModelCopyWithImpl<$Res>
    extends _$OverviewModelCopyWithImpl<$Res, _$_OverviewModel>
    implements _$$_OverviewModelCopyWith<$Res> {
  __$$_OverviewModelCopyWithImpl(
      _$_OverviewModel _value, $Res Function(_$_OverviewModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_OverviewModel(
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
class _$_OverviewModel implements _OverviewModel {
  const _$_OverviewModel({this.meta, this.data});

  factory _$_OverviewModel.fromJson(Map<String, dynamic> json) =>
      _$$_OverviewModelFromJson(json);

  @override
  final Meta? meta;
  @override
  final Data? data;

  @override
  String toString() {
    return 'OverviewModel(meta: $meta, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OverviewModel &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, meta, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OverviewModelCopyWith<_$_OverviewModel> get copyWith =>
      __$$_OverviewModelCopyWithImpl<_$_OverviewModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OverviewModelToJson(
      this,
    );
  }
}

abstract class _OverviewModel implements OverviewModel {
  const factory _OverviewModel({final Meta? meta, final Data? data}) =
      _$_OverviewModel;

  factory _OverviewModel.fromJson(Map<String, dynamic> json) =
      _$_OverviewModel.fromJson;

  @override
  Meta? get meta;
  @override
  Data? get data;
  @override
  @JsonKey(ignore: true)
  _$$_OverviewModelCopyWith<_$_OverviewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  String? get symbol => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get sector_name => throw _privateConstructorUsedError;
  String? get sub_sector_name => throw _privateConstructorUsedError;
  String? get industry_name => throw _privateConstructorUsedError;
  String? get sub_industry_name => throw _privateConstructorUsedError;
  String? get head_office => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get representative_name => throw _privateConstructorUsedError;
  String? get website_url => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get total_employees => throw _privateConstructorUsedError;
  String? get exchange_administration => throw _privateConstructorUsedError;
  String? get npwp => throw _privateConstructorUsedError;
  String? get npkp => throw _privateConstructorUsedError;
  bool? get is_active => throw _privateConstructorUsedError;
  String? get listing_date => throw _privateConstructorUsedError;
  double? get annual_dividend => throw _privateConstructorUsedError;
  String? get general_information => throw _privateConstructorUsedError;
  String? get fax => throw _privateConstructorUsedError;
  String? get founding_date => throw _privateConstructorUsedError;
  String? get company_email => throw _privateConstructorUsedError;
  List<CorporateAction>? get corporate_actions =>
      throw _privateConstructorUsedError;
  LastData? get last_data => throw _privateConstructorUsedError;

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
      {String? symbol,
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
      LastData? last_data});

  $LastDataCopyWith<$Res>? get last_data;
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
    Object? symbol = freezed,
    Object? name = freezed,
    Object? sector_name = freezed,
    Object? sub_sector_name = freezed,
    Object? industry_name = freezed,
    Object? sub_industry_name = freezed,
    Object? head_office = freezed,
    Object? phone = freezed,
    Object? representative_name = freezed,
    Object? website_url = freezed,
    Object? address = freezed,
    Object? total_employees = freezed,
    Object? exchange_administration = freezed,
    Object? npwp = freezed,
    Object? npkp = freezed,
    Object? is_active = freezed,
    Object? listing_date = freezed,
    Object? annual_dividend = freezed,
    Object? general_information = freezed,
    Object? fax = freezed,
    Object? founding_date = freezed,
    Object? company_email = freezed,
    Object? corporate_actions = freezed,
    Object? last_data = freezed,
  }) {
    return _then(_value.copyWith(
      symbol: freezed == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      sector_name: freezed == sector_name
          ? _value.sector_name
          : sector_name // ignore: cast_nullable_to_non_nullable
              as String?,
      sub_sector_name: freezed == sub_sector_name
          ? _value.sub_sector_name
          : sub_sector_name // ignore: cast_nullable_to_non_nullable
              as String?,
      industry_name: freezed == industry_name
          ? _value.industry_name
          : industry_name // ignore: cast_nullable_to_non_nullable
              as String?,
      sub_industry_name: freezed == sub_industry_name
          ? _value.sub_industry_name
          : sub_industry_name // ignore: cast_nullable_to_non_nullable
              as String?,
      head_office: freezed == head_office
          ? _value.head_office
          : head_office // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      representative_name: freezed == representative_name
          ? _value.representative_name
          : representative_name // ignore: cast_nullable_to_non_nullable
              as String?,
      website_url: freezed == website_url
          ? _value.website_url
          : website_url // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      total_employees: freezed == total_employees
          ? _value.total_employees
          : total_employees // ignore: cast_nullable_to_non_nullable
              as String?,
      exchange_administration: freezed == exchange_administration
          ? _value.exchange_administration
          : exchange_administration // ignore: cast_nullable_to_non_nullable
              as String?,
      npwp: freezed == npwp
          ? _value.npwp
          : npwp // ignore: cast_nullable_to_non_nullable
              as String?,
      npkp: freezed == npkp
          ? _value.npkp
          : npkp // ignore: cast_nullable_to_non_nullable
              as String?,
      is_active: freezed == is_active
          ? _value.is_active
          : is_active // ignore: cast_nullable_to_non_nullable
              as bool?,
      listing_date: freezed == listing_date
          ? _value.listing_date
          : listing_date // ignore: cast_nullable_to_non_nullable
              as String?,
      annual_dividend: freezed == annual_dividend
          ? _value.annual_dividend
          : annual_dividend // ignore: cast_nullable_to_non_nullable
              as double?,
      general_information: freezed == general_information
          ? _value.general_information
          : general_information // ignore: cast_nullable_to_non_nullable
              as String?,
      fax: freezed == fax
          ? _value.fax
          : fax // ignore: cast_nullable_to_non_nullable
              as String?,
      founding_date: freezed == founding_date
          ? _value.founding_date
          : founding_date // ignore: cast_nullable_to_non_nullable
              as String?,
      company_email: freezed == company_email
          ? _value.company_email
          : company_email // ignore: cast_nullable_to_non_nullable
              as String?,
      corporate_actions: freezed == corporate_actions
          ? _value.corporate_actions
          : corporate_actions // ignore: cast_nullable_to_non_nullable
              as List<CorporateAction>?,
      last_data: freezed == last_data
          ? _value.last_data
          : last_data // ignore: cast_nullable_to_non_nullable
              as LastData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LastDataCopyWith<$Res>? get last_data {
    if (_value.last_data == null) {
      return null;
    }

    return $LastDataCopyWith<$Res>(_value.last_data!, (value) {
      return _then(_value.copyWith(last_data: value) as $Val);
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
      {String? symbol,
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
      LastData? last_data});

  @override
  $LastDataCopyWith<$Res>? get last_data;
}

/// @nodoc
class __$$_DataCopyWithImpl<$Res> extends _$DataCopyWithImpl<$Res, _$_Data>
    implements _$$_DataCopyWith<$Res> {
  __$$_DataCopyWithImpl(_$_Data _value, $Res Function(_$_Data) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = freezed,
    Object? name = freezed,
    Object? sector_name = freezed,
    Object? sub_sector_name = freezed,
    Object? industry_name = freezed,
    Object? sub_industry_name = freezed,
    Object? head_office = freezed,
    Object? phone = freezed,
    Object? representative_name = freezed,
    Object? website_url = freezed,
    Object? address = freezed,
    Object? total_employees = freezed,
    Object? exchange_administration = freezed,
    Object? npwp = freezed,
    Object? npkp = freezed,
    Object? is_active = freezed,
    Object? listing_date = freezed,
    Object? annual_dividend = freezed,
    Object? general_information = freezed,
    Object? fax = freezed,
    Object? founding_date = freezed,
    Object? company_email = freezed,
    Object? corporate_actions = freezed,
    Object? last_data = freezed,
  }) {
    return _then(_$_Data(
      symbol: freezed == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      sector_name: freezed == sector_name
          ? _value.sector_name
          : sector_name // ignore: cast_nullable_to_non_nullable
              as String?,
      sub_sector_name: freezed == sub_sector_name
          ? _value.sub_sector_name
          : sub_sector_name // ignore: cast_nullable_to_non_nullable
              as String?,
      industry_name: freezed == industry_name
          ? _value.industry_name
          : industry_name // ignore: cast_nullable_to_non_nullable
              as String?,
      sub_industry_name: freezed == sub_industry_name
          ? _value.sub_industry_name
          : sub_industry_name // ignore: cast_nullable_to_non_nullable
              as String?,
      head_office: freezed == head_office
          ? _value.head_office
          : head_office // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      representative_name: freezed == representative_name
          ? _value.representative_name
          : representative_name // ignore: cast_nullable_to_non_nullable
              as String?,
      website_url: freezed == website_url
          ? _value.website_url
          : website_url // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      total_employees: freezed == total_employees
          ? _value.total_employees
          : total_employees // ignore: cast_nullable_to_non_nullable
              as String?,
      exchange_administration: freezed == exchange_administration
          ? _value.exchange_administration
          : exchange_administration // ignore: cast_nullable_to_non_nullable
              as String?,
      npwp: freezed == npwp
          ? _value.npwp
          : npwp // ignore: cast_nullable_to_non_nullable
              as String?,
      npkp: freezed == npkp
          ? _value.npkp
          : npkp // ignore: cast_nullable_to_non_nullable
              as String?,
      is_active: freezed == is_active
          ? _value.is_active
          : is_active // ignore: cast_nullable_to_non_nullable
              as bool?,
      listing_date: freezed == listing_date
          ? _value.listing_date
          : listing_date // ignore: cast_nullable_to_non_nullable
              as String?,
      annual_dividend: freezed == annual_dividend
          ? _value.annual_dividend
          : annual_dividend // ignore: cast_nullable_to_non_nullable
              as double?,
      general_information: freezed == general_information
          ? _value.general_information
          : general_information // ignore: cast_nullable_to_non_nullable
              as String?,
      fax: freezed == fax
          ? _value.fax
          : fax // ignore: cast_nullable_to_non_nullable
              as String?,
      founding_date: freezed == founding_date
          ? _value.founding_date
          : founding_date // ignore: cast_nullable_to_non_nullable
              as String?,
      company_email: freezed == company_email
          ? _value.company_email
          : company_email // ignore: cast_nullable_to_non_nullable
              as String?,
      corporate_actions: freezed == corporate_actions
          ? _value._corporate_actions
          : corporate_actions // ignore: cast_nullable_to_non_nullable
              as List<CorporateAction>?,
      last_data: freezed == last_data
          ? _value.last_data
          : last_data // ignore: cast_nullable_to_non_nullable
              as LastData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Data implements _Data {
  const _$_Data(
      {this.symbol,
      this.name,
      this.sector_name,
      this.sub_sector_name,
      this.industry_name,
      this.sub_industry_name,
      this.head_office,
      this.phone,
      this.representative_name,
      this.website_url,
      this.address,
      this.total_employees,
      this.exchange_administration,
      this.npwp,
      this.npkp,
      this.is_active,
      this.listing_date,
      this.annual_dividend,
      this.general_information,
      this.fax,
      this.founding_date,
      this.company_email,
      final List<CorporateAction>? corporate_actions,
      this.last_data})
      : _corporate_actions = corporate_actions;

  factory _$_Data.fromJson(Map<String, dynamic> json) => _$$_DataFromJson(json);

  @override
  final String? symbol;
  @override
  final String? name;
  @override
  final String? sector_name;
  @override
  final String? sub_sector_name;
  @override
  final String? industry_name;
  @override
  final String? sub_industry_name;
  @override
  final String? head_office;
  @override
  final String? phone;
  @override
  final String? representative_name;
  @override
  final String? website_url;
  @override
  final String? address;
  @override
  final String? total_employees;
  @override
  final String? exchange_administration;
  @override
  final String? npwp;
  @override
  final String? npkp;
  @override
  final bool? is_active;
  @override
  final String? listing_date;
  @override
  final double? annual_dividend;
  @override
  final String? general_information;
  @override
  final String? fax;
  @override
  final String? founding_date;
  @override
  final String? company_email;
  final List<CorporateAction>? _corporate_actions;
  @override
  List<CorporateAction>? get corporate_actions {
    final value = _corporate_actions;
    if (value == null) return null;
    if (_corporate_actions is EqualUnmodifiableListView)
      return _corporate_actions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final LastData? last_data;

  @override
  String toString() {
    return 'Data(symbol: $symbol, name: $name, sector_name: $sector_name, sub_sector_name: $sub_sector_name, industry_name: $industry_name, sub_industry_name: $sub_industry_name, head_office: $head_office, phone: $phone, representative_name: $representative_name, website_url: $website_url, address: $address, total_employees: $total_employees, exchange_administration: $exchange_administration, npwp: $npwp, npkp: $npkp, is_active: $is_active, listing_date: $listing_date, annual_dividend: $annual_dividend, general_information: $general_information, fax: $fax, founding_date: $founding_date, company_email: $company_email, corporate_actions: $corporate_actions, last_data: $last_data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Data &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.sector_name, sector_name) ||
                other.sector_name == sector_name) &&
            (identical(other.sub_sector_name, sub_sector_name) ||
                other.sub_sector_name == sub_sector_name) &&
            (identical(other.industry_name, industry_name) ||
                other.industry_name == industry_name) &&
            (identical(other.sub_industry_name, sub_industry_name) ||
                other.sub_industry_name == sub_industry_name) &&
            (identical(other.head_office, head_office) ||
                other.head_office == head_office) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.representative_name, representative_name) ||
                other.representative_name == representative_name) &&
            (identical(other.website_url, website_url) ||
                other.website_url == website_url) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.total_employees, total_employees) ||
                other.total_employees == total_employees) &&
            (identical(
                    other.exchange_administration, exchange_administration) ||
                other.exchange_administration == exchange_administration) &&
            (identical(other.npwp, npwp) || other.npwp == npwp) &&
            (identical(other.npkp, npkp) || other.npkp == npkp) &&
            (identical(other.is_active, is_active) ||
                other.is_active == is_active) &&
            (identical(other.listing_date, listing_date) ||
                other.listing_date == listing_date) &&
            (identical(other.annual_dividend, annual_dividend) ||
                other.annual_dividend == annual_dividend) &&
            (identical(other.general_information, general_information) ||
                other.general_information == general_information) &&
            (identical(other.fax, fax) || other.fax == fax) &&
            (identical(other.founding_date, founding_date) ||
                other.founding_date == founding_date) &&
            (identical(other.company_email, company_email) ||
                other.company_email == company_email) &&
            const DeepCollectionEquality()
                .equals(other._corporate_actions, _corporate_actions) &&
            (identical(other.last_data, last_data) ||
                other.last_data == last_data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        symbol,
        name,
        sector_name,
        sub_sector_name,
        industry_name,
        sub_industry_name,
        head_office,
        phone,
        representative_name,
        website_url,
        address,
        total_employees,
        exchange_administration,
        npwp,
        npkp,
        is_active,
        listing_date,
        annual_dividend,
        general_information,
        fax,
        founding_date,
        company_email,
        const DeepCollectionEquality().hash(_corporate_actions),
        last_data
      ]);

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
      {final String? symbol,
      final String? name,
      final String? sector_name,
      final String? sub_sector_name,
      final String? industry_name,
      final String? sub_industry_name,
      final String? head_office,
      final String? phone,
      final String? representative_name,
      final String? website_url,
      final String? address,
      final String? total_employees,
      final String? exchange_administration,
      final String? npwp,
      final String? npkp,
      final bool? is_active,
      final String? listing_date,
      final double? annual_dividend,
      final String? general_information,
      final String? fax,
      final String? founding_date,
      final String? company_email,
      final List<CorporateAction>? corporate_actions,
      final LastData? last_data}) = _$_Data;

  factory _Data.fromJson(Map<String, dynamic> json) = _$_Data.fromJson;

  @override
  String? get symbol;
  @override
  String? get name;
  @override
  String? get sector_name;
  @override
  String? get sub_sector_name;
  @override
  String? get industry_name;
  @override
  String? get sub_industry_name;
  @override
  String? get head_office;
  @override
  String? get phone;
  @override
  String? get representative_name;
  @override
  String? get website_url;
  @override
  String? get address;
  @override
  String? get total_employees;
  @override
  String? get exchange_administration;
  @override
  String? get npwp;
  @override
  String? get npkp;
  @override
  bool? get is_active;
  @override
  String? get listing_date;
  @override
  double? get annual_dividend;
  @override
  String? get general_information;
  @override
  String? get fax;
  @override
  String? get founding_date;
  @override
  String? get company_email;
  @override
  List<CorporateAction>? get corporate_actions;
  @override
  LastData? get last_data;
  @override
  @JsonKey(ignore: true)
  _$$_DataCopyWith<_$_Data> get copyWith => throw _privateConstructorUsedError;
}

CorporateAction _$CorporateActionFromJson(Map<String, dynamic> json) {
  return _CorporateAction.fromJson(json);
}

/// @nodoc
mixin _$CorporateAction {
  DateTime? get date => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get stock_code => throw _privateConstructorUsedError;
  double? get total_corporate_action => throw _privateConstructorUsedError;
  double? get total_value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CorporateActionCopyWith<CorporateAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CorporateActionCopyWith<$Res> {
  factory $CorporateActionCopyWith(
          CorporateAction value, $Res Function(CorporateAction) then) =
      _$CorporateActionCopyWithImpl<$Res, CorporateAction>;
  @useResult
  $Res call(
      {DateTime? date,
      String? type,
      String? stock_code,
      double? total_corporate_action,
      double? total_value});
}

/// @nodoc
class _$CorporateActionCopyWithImpl<$Res, $Val extends CorporateAction>
    implements $CorporateActionCopyWith<$Res> {
  _$CorporateActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? type = freezed,
    Object? stock_code = freezed,
    Object? total_corporate_action = freezed,
    Object? total_value = freezed,
  }) {
    return _then(_value.copyWith(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      stock_code: freezed == stock_code
          ? _value.stock_code
          : stock_code // ignore: cast_nullable_to_non_nullable
              as String?,
      total_corporate_action: freezed == total_corporate_action
          ? _value.total_corporate_action
          : total_corporate_action // ignore: cast_nullable_to_non_nullable
              as double?,
      total_value: freezed == total_value
          ? _value.total_value
          : total_value // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CorporateActionCopyWith<$Res>
    implements $CorporateActionCopyWith<$Res> {
  factory _$$_CorporateActionCopyWith(
          _$_CorporateAction value, $Res Function(_$_CorporateAction) then) =
      __$$_CorporateActionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? date,
      String? type,
      String? stock_code,
      double? total_corporate_action,
      double? total_value});
}

/// @nodoc
class __$$_CorporateActionCopyWithImpl<$Res>
    extends _$CorporateActionCopyWithImpl<$Res, _$_CorporateAction>
    implements _$$_CorporateActionCopyWith<$Res> {
  __$$_CorporateActionCopyWithImpl(
      _$_CorporateAction _value, $Res Function(_$_CorporateAction) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? type = freezed,
    Object? stock_code = freezed,
    Object? total_corporate_action = freezed,
    Object? total_value = freezed,
  }) {
    return _then(_$_CorporateAction(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      stock_code: freezed == stock_code
          ? _value.stock_code
          : stock_code // ignore: cast_nullable_to_non_nullable
              as String?,
      total_corporate_action: freezed == total_corporate_action
          ? _value.total_corporate_action
          : total_corporate_action // ignore: cast_nullable_to_non_nullable
              as double?,
      total_value: freezed == total_value
          ? _value.total_value
          : total_value // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CorporateAction implements _CorporateAction {
  const _$_CorporateAction(
      {this.date,
      this.type,
      this.stock_code,
      this.total_corporate_action,
      this.total_value});

  factory _$_CorporateAction.fromJson(Map<String, dynamic> json) =>
      _$$_CorporateActionFromJson(json);

  @override
  final DateTime? date;
  @override
  final String? type;
  @override
  final String? stock_code;
  @override
  final double? total_corporate_action;
  @override
  final double? total_value;

  @override
  String toString() {
    return 'CorporateAction(date: $date, type: $type, stock_code: $stock_code, total_corporate_action: $total_corporate_action, total_value: $total_value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CorporateAction &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.stock_code, stock_code) ||
                other.stock_code == stock_code) &&
            (identical(other.total_corporate_action, total_corporate_action) ||
                other.total_corporate_action == total_corporate_action) &&
            (identical(other.total_value, total_value) ||
                other.total_value == total_value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, date, type, stock_code, total_corporate_action, total_value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CorporateActionCopyWith<_$_CorporateAction> get copyWith =>
      __$$_CorporateActionCopyWithImpl<_$_CorporateAction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CorporateActionToJson(
      this,
    );
  }
}

abstract class _CorporateAction implements CorporateAction {
  const factory _CorporateAction(
      {final DateTime? date,
      final String? type,
      final String? stock_code,
      final double? total_corporate_action,
      final double? total_value}) = _$_CorporateAction;

  factory _CorporateAction.fromJson(Map<String, dynamic> json) =
      _$_CorporateAction.fromJson;

  @override
  DateTime? get date;
  @override
  String? get type;
  @override
  String? get stock_code;
  @override
  double? get total_corporate_action;
  @override
  double? get total_value;
  @override
  @JsonKey(ignore: true)
  _$$_CorporateActionCopyWith<_$_CorporateAction> get copyWith =>
      throw _privateConstructorUsedError;
}

LastData _$LastDataFromJson(Map<String, dynamic> json) {
  return _LastData.fromJson(json);
}

/// @nodoc
mixin _$LastData {
  double? get close => throw _privateConstructorUsedError;
  double? get open => throw _privateConstructorUsedError;
  double? get high => throw _privateConstructorUsedError;
  double? get low => throw _privateConstructorUsedError;
  double? get change => throw _privateConstructorUsedError;
  double? get per => throw _privateConstructorUsedError;
  double? get pbr => throw _privateConstructorUsedError;
  double? get one_day => throw _privateConstructorUsedError;
  double? get one_week => throw _privateConstructorUsedError;
  double? get one_month => throw _privateConstructorUsedError;
  double? get three_month => throw _privateConstructorUsedError;
  double? get six_month => throw _privateConstructorUsedError;
  double? get one_year => throw _privateConstructorUsedError;
  double? get three_year => throw _privateConstructorUsedError;
  double? get five_year => throw _privateConstructorUsedError;
  double? get ten_year => throw _privateConstructorUsedError;
  double? get mtd => throw _privateConstructorUsedError;
  double? get ytd => throw _privateConstructorUsedError;
  double? get value => throw _privateConstructorUsedError;
  double? get volume => throw _privateConstructorUsedError;
  double? get frequency => throw _privateConstructorUsedError;
  double? get market_cap => throw _privateConstructorUsedError;
  double? get annual_high_price => throw _privateConstructorUsedError;
  double? get annual_low_price => throw _privateConstructorUsedError;
  DateTime? get time => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LastDataCopyWith<LastData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LastDataCopyWith<$Res> {
  factory $LastDataCopyWith(LastData value, $Res Function(LastData) then) =
      _$LastDataCopyWithImpl<$Res, LastData>;
  @useResult
  $Res call(
      {double? close,
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
      DateTime? time});
}

/// @nodoc
class _$LastDataCopyWithImpl<$Res, $Val extends LastData>
    implements $LastDataCopyWith<$Res> {
  _$LastDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? close = freezed,
    Object? open = freezed,
    Object? high = freezed,
    Object? low = freezed,
    Object? change = freezed,
    Object? per = freezed,
    Object? pbr = freezed,
    Object? one_day = freezed,
    Object? one_week = freezed,
    Object? one_month = freezed,
    Object? three_month = freezed,
    Object? six_month = freezed,
    Object? one_year = freezed,
    Object? three_year = freezed,
    Object? five_year = freezed,
    Object? ten_year = freezed,
    Object? mtd = freezed,
    Object? ytd = freezed,
    Object? value = freezed,
    Object? volume = freezed,
    Object? frequency = freezed,
    Object? market_cap = freezed,
    Object? annual_high_price = freezed,
    Object? annual_low_price = freezed,
    Object? time = freezed,
  }) {
    return _then(_value.copyWith(
      close: freezed == close
          ? _value.close
          : close // ignore: cast_nullable_to_non_nullable
              as double?,
      open: freezed == open
          ? _value.open
          : open // ignore: cast_nullable_to_non_nullable
              as double?,
      high: freezed == high
          ? _value.high
          : high // ignore: cast_nullable_to_non_nullable
              as double?,
      low: freezed == low
          ? _value.low
          : low // ignore: cast_nullable_to_non_nullable
              as double?,
      change: freezed == change
          ? _value.change
          : change // ignore: cast_nullable_to_non_nullable
              as double?,
      per: freezed == per
          ? _value.per
          : per // ignore: cast_nullable_to_non_nullable
              as double?,
      pbr: freezed == pbr
          ? _value.pbr
          : pbr // ignore: cast_nullable_to_non_nullable
              as double?,
      one_day: freezed == one_day
          ? _value.one_day
          : one_day // ignore: cast_nullable_to_non_nullable
              as double?,
      one_week: freezed == one_week
          ? _value.one_week
          : one_week // ignore: cast_nullable_to_non_nullable
              as double?,
      one_month: freezed == one_month
          ? _value.one_month
          : one_month // ignore: cast_nullable_to_non_nullable
              as double?,
      three_month: freezed == three_month
          ? _value.three_month
          : three_month // ignore: cast_nullable_to_non_nullable
              as double?,
      six_month: freezed == six_month
          ? _value.six_month
          : six_month // ignore: cast_nullable_to_non_nullable
              as double?,
      one_year: freezed == one_year
          ? _value.one_year
          : one_year // ignore: cast_nullable_to_non_nullable
              as double?,
      three_year: freezed == three_year
          ? _value.three_year
          : three_year // ignore: cast_nullable_to_non_nullable
              as double?,
      five_year: freezed == five_year
          ? _value.five_year
          : five_year // ignore: cast_nullable_to_non_nullable
              as double?,
      ten_year: freezed == ten_year
          ? _value.ten_year
          : ten_year // ignore: cast_nullable_to_non_nullable
              as double?,
      mtd: freezed == mtd
          ? _value.mtd
          : mtd // ignore: cast_nullable_to_non_nullable
              as double?,
      ytd: freezed == ytd
          ? _value.ytd
          : ytd // ignore: cast_nullable_to_non_nullable
              as double?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double?,
      volume: freezed == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as double?,
      frequency: freezed == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as double?,
      market_cap: freezed == market_cap
          ? _value.market_cap
          : market_cap // ignore: cast_nullable_to_non_nullable
              as double?,
      annual_high_price: freezed == annual_high_price
          ? _value.annual_high_price
          : annual_high_price // ignore: cast_nullable_to_non_nullable
              as double?,
      annual_low_price: freezed == annual_low_price
          ? _value.annual_low_price
          : annual_low_price // ignore: cast_nullable_to_non_nullable
              as double?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LastDataCopyWith<$Res> implements $LastDataCopyWith<$Res> {
  factory _$$_LastDataCopyWith(
          _$_LastData value, $Res Function(_$_LastData) then) =
      __$$_LastDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? close,
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
      DateTime? time});
}

/// @nodoc
class __$$_LastDataCopyWithImpl<$Res>
    extends _$LastDataCopyWithImpl<$Res, _$_LastData>
    implements _$$_LastDataCopyWith<$Res> {
  __$$_LastDataCopyWithImpl(
      _$_LastData _value, $Res Function(_$_LastData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? close = freezed,
    Object? open = freezed,
    Object? high = freezed,
    Object? low = freezed,
    Object? change = freezed,
    Object? per = freezed,
    Object? pbr = freezed,
    Object? one_day = freezed,
    Object? one_week = freezed,
    Object? one_month = freezed,
    Object? three_month = freezed,
    Object? six_month = freezed,
    Object? one_year = freezed,
    Object? three_year = freezed,
    Object? five_year = freezed,
    Object? ten_year = freezed,
    Object? mtd = freezed,
    Object? ytd = freezed,
    Object? value = freezed,
    Object? volume = freezed,
    Object? frequency = freezed,
    Object? market_cap = freezed,
    Object? annual_high_price = freezed,
    Object? annual_low_price = freezed,
    Object? time = freezed,
  }) {
    return _then(_$_LastData(
      close: freezed == close
          ? _value.close
          : close // ignore: cast_nullable_to_non_nullable
              as double?,
      open: freezed == open
          ? _value.open
          : open // ignore: cast_nullable_to_non_nullable
              as double?,
      high: freezed == high
          ? _value.high
          : high // ignore: cast_nullable_to_non_nullable
              as double?,
      low: freezed == low
          ? _value.low
          : low // ignore: cast_nullable_to_non_nullable
              as double?,
      change: freezed == change
          ? _value.change
          : change // ignore: cast_nullable_to_non_nullable
              as double?,
      per: freezed == per
          ? _value.per
          : per // ignore: cast_nullable_to_non_nullable
              as double?,
      pbr: freezed == pbr
          ? _value.pbr
          : pbr // ignore: cast_nullable_to_non_nullable
              as double?,
      one_day: freezed == one_day
          ? _value.one_day
          : one_day // ignore: cast_nullable_to_non_nullable
              as double?,
      one_week: freezed == one_week
          ? _value.one_week
          : one_week // ignore: cast_nullable_to_non_nullable
              as double?,
      one_month: freezed == one_month
          ? _value.one_month
          : one_month // ignore: cast_nullable_to_non_nullable
              as double?,
      three_month: freezed == three_month
          ? _value.three_month
          : three_month // ignore: cast_nullable_to_non_nullable
              as double?,
      six_month: freezed == six_month
          ? _value.six_month
          : six_month // ignore: cast_nullable_to_non_nullable
              as double?,
      one_year: freezed == one_year
          ? _value.one_year
          : one_year // ignore: cast_nullable_to_non_nullable
              as double?,
      three_year: freezed == three_year
          ? _value.three_year
          : three_year // ignore: cast_nullable_to_non_nullable
              as double?,
      five_year: freezed == five_year
          ? _value.five_year
          : five_year // ignore: cast_nullable_to_non_nullable
              as double?,
      ten_year: freezed == ten_year
          ? _value.ten_year
          : ten_year // ignore: cast_nullable_to_non_nullable
              as double?,
      mtd: freezed == mtd
          ? _value.mtd
          : mtd // ignore: cast_nullable_to_non_nullable
              as double?,
      ytd: freezed == ytd
          ? _value.ytd
          : ytd // ignore: cast_nullable_to_non_nullable
              as double?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double?,
      volume: freezed == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as double?,
      frequency: freezed == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as double?,
      market_cap: freezed == market_cap
          ? _value.market_cap
          : market_cap // ignore: cast_nullable_to_non_nullable
              as double?,
      annual_high_price: freezed == annual_high_price
          ? _value.annual_high_price
          : annual_high_price // ignore: cast_nullable_to_non_nullable
              as double?,
      annual_low_price: freezed == annual_low_price
          ? _value.annual_low_price
          : annual_low_price // ignore: cast_nullable_to_non_nullable
              as double?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LastData implements _LastData {
  const _$_LastData(
      {this.close,
      this.open,
      this.high,
      this.low,
      this.change,
      this.per,
      this.pbr,
      this.one_day,
      this.one_week,
      this.one_month,
      this.three_month,
      this.six_month,
      this.one_year,
      this.three_year,
      this.five_year,
      this.ten_year,
      this.mtd,
      this.ytd,
      this.value,
      this.volume,
      this.frequency,
      this.market_cap,
      this.annual_high_price,
      this.annual_low_price,
      this.time});

  factory _$_LastData.fromJson(Map<String, dynamic> json) =>
      _$$_LastDataFromJson(json);

  @override
  final double? close;
  @override
  final double? open;
  @override
  final double? high;
  @override
  final double? low;
  @override
  final double? change;
  @override
  final double? per;
  @override
  final double? pbr;
  @override
  final double? one_day;
  @override
  final double? one_week;
  @override
  final double? one_month;
  @override
  final double? three_month;
  @override
  final double? six_month;
  @override
  final double? one_year;
  @override
  final double? three_year;
  @override
  final double? five_year;
  @override
  final double? ten_year;
  @override
  final double? mtd;
  @override
  final double? ytd;
  @override
  final double? value;
  @override
  final double? volume;
  @override
  final double? frequency;
  @override
  final double? market_cap;
  @override
  final double? annual_high_price;
  @override
  final double? annual_low_price;
  @override
  final DateTime? time;

  @override
  String toString() {
    return 'LastData(close: $close, open: $open, high: $high, low: $low, change: $change, per: $per, pbr: $pbr, one_day: $one_day, one_week: $one_week, one_month: $one_month, three_month: $three_month, six_month: $six_month, one_year: $one_year, three_year: $three_year, five_year: $five_year, ten_year: $ten_year, mtd: $mtd, ytd: $ytd, value: $value, volume: $volume, frequency: $frequency, market_cap: $market_cap, annual_high_price: $annual_high_price, annual_low_price: $annual_low_price, time: $time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LastData &&
            (identical(other.close, close) || other.close == close) &&
            (identical(other.open, open) || other.open == open) &&
            (identical(other.high, high) || other.high == high) &&
            (identical(other.low, low) || other.low == low) &&
            (identical(other.change, change) || other.change == change) &&
            (identical(other.per, per) || other.per == per) &&
            (identical(other.pbr, pbr) || other.pbr == pbr) &&
            (identical(other.one_day, one_day) || other.one_day == one_day) &&
            (identical(other.one_week, one_week) ||
                other.one_week == one_week) &&
            (identical(other.one_month, one_month) ||
                other.one_month == one_month) &&
            (identical(other.three_month, three_month) ||
                other.three_month == three_month) &&
            (identical(other.six_month, six_month) ||
                other.six_month == six_month) &&
            (identical(other.one_year, one_year) ||
                other.one_year == one_year) &&
            (identical(other.three_year, three_year) ||
                other.three_year == three_year) &&
            (identical(other.five_year, five_year) ||
                other.five_year == five_year) &&
            (identical(other.ten_year, ten_year) ||
                other.ten_year == ten_year) &&
            (identical(other.mtd, mtd) || other.mtd == mtd) &&
            (identical(other.ytd, ytd) || other.ytd == ytd) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.volume, volume) || other.volume == volume) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.market_cap, market_cap) ||
                other.market_cap == market_cap) &&
            (identical(other.annual_high_price, annual_high_price) ||
                other.annual_high_price == annual_high_price) &&
            (identical(other.annual_low_price, annual_low_price) ||
                other.annual_low_price == annual_low_price) &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        close,
        open,
        high,
        low,
        change,
        per,
        pbr,
        one_day,
        one_week,
        one_month,
        three_month,
        six_month,
        one_year,
        three_year,
        five_year,
        ten_year,
        mtd,
        ytd,
        value,
        volume,
        frequency,
        market_cap,
        annual_high_price,
        annual_low_price,
        time
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LastDataCopyWith<_$_LastData> get copyWith =>
      __$$_LastDataCopyWithImpl<_$_LastData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LastDataToJson(
      this,
    );
  }
}

abstract class _LastData implements LastData {
  const factory _LastData(
      {final double? close,
      final double? open,
      final double? high,
      final double? low,
      final double? change,
      final double? per,
      final double? pbr,
      final double? one_day,
      final double? one_week,
      final double? one_month,
      final double? three_month,
      final double? six_month,
      final double? one_year,
      final double? three_year,
      final double? five_year,
      final double? ten_year,
      final double? mtd,
      final double? ytd,
      final double? value,
      final double? volume,
      final double? frequency,
      final double? market_cap,
      final double? annual_high_price,
      final double? annual_low_price,
      final DateTime? time}) = _$_LastData;

  factory _LastData.fromJson(Map<String, dynamic> json) = _$_LastData.fromJson;

  @override
  double? get close;
  @override
  double? get open;
  @override
  double? get high;
  @override
  double? get low;
  @override
  double? get change;
  @override
  double? get per;
  @override
  double? get pbr;
  @override
  double? get one_day;
  @override
  double? get one_week;
  @override
  double? get one_month;
  @override
  double? get three_month;
  @override
  double? get six_month;
  @override
  double? get one_year;
  @override
  double? get three_year;
  @override
  double? get five_year;
  @override
  double? get ten_year;
  @override
  double? get mtd;
  @override
  double? get ytd;
  @override
  double? get value;
  @override
  double? get volume;
  @override
  double? get frequency;
  @override
  double? get market_cap;
  @override
  double? get annual_high_price;
  @override
  double? get annual_low_price;
  @override
  DateTime? get time;
  @override
  @JsonKey(ignore: true)
  _$$_LastDataCopyWith<_$_LastData> get copyWith =>
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
