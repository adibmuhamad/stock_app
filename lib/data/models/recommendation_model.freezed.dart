// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recommendation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecommendationModel _$RecommendationModelFromJson(Map<String, dynamic> json) {
  return _RecommendationModel.fromJson(json);
}

/// @nodoc
mixin _$RecommendationModel {
  Meta? get meta => throw _privateConstructorUsedError;
  List<Datum>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecommendationModelCopyWith<RecommendationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecommendationModelCopyWith<$Res> {
  factory $RecommendationModelCopyWith(
          RecommendationModel value, $Res Function(RecommendationModel) then) =
      _$RecommendationModelCopyWithImpl<$Res, RecommendationModel>;
  @useResult
  $Res call({Meta? meta, List<Datum>? data});

  $MetaCopyWith<$Res>? get meta;
}

/// @nodoc
class _$RecommendationModelCopyWithImpl<$Res, $Val extends RecommendationModel>
    implements $RecommendationModelCopyWith<$Res> {
  _$RecommendationModelCopyWithImpl(this._value, this._then);

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
              as List<Datum>?,
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
}

/// @nodoc
abstract class _$$_RecommendationModelCopyWith<$Res>
    implements $RecommendationModelCopyWith<$Res> {
  factory _$$_RecommendationModelCopyWith(_$_RecommendationModel value,
          $Res Function(_$_RecommendationModel) then) =
      __$$_RecommendationModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Meta? meta, List<Datum>? data});

  @override
  $MetaCopyWith<$Res>? get meta;
}

/// @nodoc
class __$$_RecommendationModelCopyWithImpl<$Res>
    extends _$RecommendationModelCopyWithImpl<$Res, _$_RecommendationModel>
    implements _$$_RecommendationModelCopyWith<$Res> {
  __$$_RecommendationModelCopyWithImpl(_$_RecommendationModel _value,
      $Res Function(_$_RecommendationModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_RecommendationModel(
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Datum>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecommendationModel implements _RecommendationModel {
  const _$_RecommendationModel({this.meta, final List<Datum>? data})
      : _data = data;

  factory _$_RecommendationModel.fromJson(Map<String, dynamic> json) =>
      _$$_RecommendationModelFromJson(json);

  @override
  final Meta? meta;
  final List<Datum>? _data;
  @override
  List<Datum>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RecommendationModel(meta: $meta, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecommendationModel &&
            (identical(other.meta, meta) || other.meta == meta) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, meta, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecommendationModelCopyWith<_$_RecommendationModel> get copyWith =>
      __$$_RecommendationModelCopyWithImpl<_$_RecommendationModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecommendationModelToJson(
      this,
    );
  }
}

abstract class _RecommendationModel implements RecommendationModel {
  const factory _RecommendationModel(
      {final Meta? meta, final List<Datum>? data}) = _$_RecommendationModel;

  factory _RecommendationModel.fromJson(Map<String, dynamic> json) =
      _$_RecommendationModel.fromJson;

  @override
  Meta? get meta;
  @override
  List<Datum>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_RecommendationModelCopyWith<_$_RecommendationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Datum _$DatumFromJson(Map<String, dynamic> json) {
  return _Datum.fromJson(json);
}

/// @nodoc
mixin _$Datum {
  String? get symbol => throw _privateConstructorUsedError;
  String? get recommendation => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  double? get buying_price => throw _privateConstructorUsedError;
  double? get selling_price => throw _privateConstructorUsedError;
  double? get stop_loss => throw _privateConstructorUsedError;
  double? get target_price => throw _privateConstructorUsedError;
  double? get predicted_price => throw _privateConstructorUsedError;
  String? get time => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DatumCopyWith<Datum> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DatumCopyWith<$Res> {
  factory $DatumCopyWith(Datum value, $Res Function(Datum) then) =
      _$DatumCopyWithImpl<$Res, Datum>;
  @useResult
  $Res call(
      {String? symbol,
      String? recommendation,
      String? description,
      double? price,
      double? buying_price,
      double? selling_price,
      double? stop_loss,
      double? target_price,
      double? predicted_price,
      String? time});
}

/// @nodoc
class _$DatumCopyWithImpl<$Res, $Val extends Datum>
    implements $DatumCopyWith<$Res> {
  _$DatumCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = freezed,
    Object? recommendation = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? buying_price = freezed,
    Object? selling_price = freezed,
    Object? stop_loss = freezed,
    Object? target_price = freezed,
    Object? predicted_price = freezed,
    Object? time = freezed,
  }) {
    return _then(_value.copyWith(
      symbol: freezed == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String?,
      recommendation: freezed == recommendation
          ? _value.recommendation
          : recommendation // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      buying_price: freezed == buying_price
          ? _value.buying_price
          : buying_price // ignore: cast_nullable_to_non_nullable
              as double?,
      selling_price: freezed == selling_price
          ? _value.selling_price
          : selling_price // ignore: cast_nullable_to_non_nullable
              as double?,
      stop_loss: freezed == stop_loss
          ? _value.stop_loss
          : stop_loss // ignore: cast_nullable_to_non_nullable
              as double?,
      target_price: freezed == target_price
          ? _value.target_price
          : target_price // ignore: cast_nullable_to_non_nullable
              as double?,
      predicted_price: freezed == predicted_price
          ? _value.predicted_price
          : predicted_price // ignore: cast_nullable_to_non_nullable
              as double?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DatumCopyWith<$Res> implements $DatumCopyWith<$Res> {
  factory _$$_DatumCopyWith(_$_Datum value, $Res Function(_$_Datum) then) =
      __$$_DatumCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? symbol,
      String? recommendation,
      String? description,
      double? price,
      double? buying_price,
      double? selling_price,
      double? stop_loss,
      double? target_price,
      double? predicted_price,
      String? time});
}

/// @nodoc
class __$$_DatumCopyWithImpl<$Res> extends _$DatumCopyWithImpl<$Res, _$_Datum>
    implements _$$_DatumCopyWith<$Res> {
  __$$_DatumCopyWithImpl(_$_Datum _value, $Res Function(_$_Datum) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = freezed,
    Object? recommendation = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? buying_price = freezed,
    Object? selling_price = freezed,
    Object? stop_loss = freezed,
    Object? target_price = freezed,
    Object? predicted_price = freezed,
    Object? time = freezed,
  }) {
    return _then(_$_Datum(
      symbol: freezed == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String?,
      recommendation: freezed == recommendation
          ? _value.recommendation
          : recommendation // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      buying_price: freezed == buying_price
          ? _value.buying_price
          : buying_price // ignore: cast_nullable_to_non_nullable
              as double?,
      selling_price: freezed == selling_price
          ? _value.selling_price
          : selling_price // ignore: cast_nullable_to_non_nullable
              as double?,
      stop_loss: freezed == stop_loss
          ? _value.stop_loss
          : stop_loss // ignore: cast_nullable_to_non_nullable
              as double?,
      target_price: freezed == target_price
          ? _value.target_price
          : target_price // ignore: cast_nullable_to_non_nullable
              as double?,
      predicted_price: freezed == predicted_price
          ? _value.predicted_price
          : predicted_price // ignore: cast_nullable_to_non_nullable
              as double?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Datum implements _Datum {
  const _$_Datum(
      {this.symbol,
      this.recommendation,
      this.description,
      this.price,
      this.buying_price,
      this.selling_price,
      this.stop_loss,
      this.target_price,
      this.predicted_price,
      this.time});

  factory _$_Datum.fromJson(Map<String, dynamic> json) =>
      _$$_DatumFromJson(json);

  @override
  final String? symbol;
  @override
  final String? recommendation;
  @override
  final String? description;
  @override
  final double? price;
  @override
  final double? buying_price;
  @override
  final double? selling_price;
  @override
  final double? stop_loss;
  @override
  final double? target_price;
  @override
  final double? predicted_price;
  @override
  final String? time;

  @override
  String toString() {
    return 'Datum(symbol: $symbol, recommendation: $recommendation, description: $description, price: $price, buying_price: $buying_price, selling_price: $selling_price, stop_loss: $stop_loss, target_price: $target_price, predicted_price: $predicted_price, time: $time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Datum &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.recommendation, recommendation) ||
                other.recommendation == recommendation) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.buying_price, buying_price) ||
                other.buying_price == buying_price) &&
            (identical(other.selling_price, selling_price) ||
                other.selling_price == selling_price) &&
            (identical(other.stop_loss, stop_loss) ||
                other.stop_loss == stop_loss) &&
            (identical(other.target_price, target_price) ||
                other.target_price == target_price) &&
            (identical(other.predicted_price, predicted_price) ||
                other.predicted_price == predicted_price) &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      symbol,
      recommendation,
      description,
      price,
      buying_price,
      selling_price,
      stop_loss,
      target_price,
      predicted_price,
      time);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DatumCopyWith<_$_Datum> get copyWith =>
      __$$_DatumCopyWithImpl<_$_Datum>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DatumToJson(
      this,
    );
  }
}

abstract class _Datum implements Datum {
  const factory _Datum(
      {final String? symbol,
      final String? recommendation,
      final String? description,
      final double? price,
      final double? buying_price,
      final double? selling_price,
      final double? stop_loss,
      final double? target_price,
      final double? predicted_price,
      final String? time}) = _$_Datum;

  factory _Datum.fromJson(Map<String, dynamic> json) = _$_Datum.fromJson;

  @override
  String? get symbol;
  @override
  String? get recommendation;
  @override
  String? get description;
  @override
  double? get price;
  @override
  double? get buying_price;
  @override
  double? get selling_price;
  @override
  double? get stop_loss;
  @override
  double? get target_price;
  @override
  double? get predicted_price;
  @override
  String? get time;
  @override
  @JsonKey(ignore: true)
  _$$_DatumCopyWith<_$_Datum> get copyWith =>
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
