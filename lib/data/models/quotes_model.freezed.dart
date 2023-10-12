// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quotes_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuotesModel _$QuotesModelFromJson(Map<String, dynamic> json) {
  return _QuotesModel.fromJson(json);
}

/// @nodoc
mixin _$QuotesModel {
  Meta? get meta => throw _privateConstructorUsedError;
  List<Datum>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuotesModelCopyWith<QuotesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuotesModelCopyWith<$Res> {
  factory $QuotesModelCopyWith(
          QuotesModel value, $Res Function(QuotesModel) then) =
      _$QuotesModelCopyWithImpl<$Res, QuotesModel>;
  @useResult
  $Res call({Meta? meta, List<Datum>? data});

  $MetaCopyWith<$Res>? get meta;
}

/// @nodoc
class _$QuotesModelCopyWithImpl<$Res, $Val extends QuotesModel>
    implements $QuotesModelCopyWith<$Res> {
  _$QuotesModelCopyWithImpl(this._value, this._then);

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
abstract class _$$_QuotesModelCopyWith<$Res>
    implements $QuotesModelCopyWith<$Res> {
  factory _$$_QuotesModelCopyWith(
          _$_QuotesModel value, $Res Function(_$_QuotesModel) then) =
      __$$_QuotesModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Meta? meta, List<Datum>? data});

  @override
  $MetaCopyWith<$Res>? get meta;
}

/// @nodoc
class __$$_QuotesModelCopyWithImpl<$Res>
    extends _$QuotesModelCopyWithImpl<$Res, _$_QuotesModel>
    implements _$$_QuotesModelCopyWith<$Res> {
  __$$_QuotesModelCopyWithImpl(
      _$_QuotesModel _value, $Res Function(_$_QuotesModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_QuotesModel(
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
class _$_QuotesModel implements _QuotesModel {
  const _$_QuotesModel({this.meta, final List<Datum>? data}) : _data = data;

  factory _$_QuotesModel.fromJson(Map<String, dynamic> json) =>
      _$$_QuotesModelFromJson(json);

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
    return 'QuotesModel(meta: $meta, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuotesModel &&
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
  _$$_QuotesModelCopyWith<_$_QuotesModel> get copyWith =>
      __$$_QuotesModelCopyWithImpl<_$_QuotesModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuotesModelToJson(
      this,
    );
  }
}

abstract class _QuotesModel implements QuotesModel {
  const factory _QuotesModel({final Meta? meta, final List<Datum>? data}) =
      _$_QuotesModel;

  factory _QuotesModel.fromJson(Map<String, dynamic> json) =
      _$_QuotesModel.fromJson;

  @override
  Meta? get meta;
  @override
  List<Datum>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_QuotesModelCopyWith<_$_QuotesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Datum _$DatumFromJson(Map<String, dynamic> json) {
  return _Datum.fromJson(json);
}

/// @nodoc
mixin _$Datum {
  int? get id => throw _privateConstructorUsedError;
  String? get symbol => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  double? get open => throw _privateConstructorUsedError;
  double? get close => throw _privateConstructorUsedError;
  double? get prev_close => throw _privateConstructorUsedError;
  double? get high => throw _privateConstructorUsedError;
  double? get low => throw _privateConstructorUsedError;
  double? get volume => throw _privateConstructorUsedError;
  double? get change => throw _privateConstructorUsedError;
  double? get change_percent => throw _privateConstructorUsedError;
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
      {int? id,
      String? symbol,
      String? name,
      double? open,
      double? close,
      double? prev_close,
      double? high,
      double? low,
      double? volume,
      double? change,
      double? change_percent,
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
    Object? id = freezed,
    Object? symbol = freezed,
    Object? name = freezed,
    Object? open = freezed,
    Object? close = freezed,
    Object? prev_close = freezed,
    Object? high = freezed,
    Object? low = freezed,
    Object? volume = freezed,
    Object? change = freezed,
    Object? change_percent = freezed,
    Object? time = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      symbol: freezed == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      open: freezed == open
          ? _value.open
          : open // ignore: cast_nullable_to_non_nullable
              as double?,
      close: freezed == close
          ? _value.close
          : close // ignore: cast_nullable_to_non_nullable
              as double?,
      prev_close: freezed == prev_close
          ? _value.prev_close
          : prev_close // ignore: cast_nullable_to_non_nullable
              as double?,
      high: freezed == high
          ? _value.high
          : high // ignore: cast_nullable_to_non_nullable
              as double?,
      low: freezed == low
          ? _value.low
          : low // ignore: cast_nullable_to_non_nullable
              as double?,
      volume: freezed == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as double?,
      change: freezed == change
          ? _value.change
          : change // ignore: cast_nullable_to_non_nullable
              as double?,
      change_percent: freezed == change_percent
          ? _value.change_percent
          : change_percent // ignore: cast_nullable_to_non_nullable
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
      {int? id,
      String? symbol,
      String? name,
      double? open,
      double? close,
      double? prev_close,
      double? high,
      double? low,
      double? volume,
      double? change,
      double? change_percent,
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
    Object? id = freezed,
    Object? symbol = freezed,
    Object? name = freezed,
    Object? open = freezed,
    Object? close = freezed,
    Object? prev_close = freezed,
    Object? high = freezed,
    Object? low = freezed,
    Object? volume = freezed,
    Object? change = freezed,
    Object? change_percent = freezed,
    Object? time = freezed,
  }) {
    return _then(_$_Datum(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      symbol: freezed == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      open: freezed == open
          ? _value.open
          : open // ignore: cast_nullable_to_non_nullable
              as double?,
      close: freezed == close
          ? _value.close
          : close // ignore: cast_nullable_to_non_nullable
              as double?,
      prev_close: freezed == prev_close
          ? _value.prev_close
          : prev_close // ignore: cast_nullable_to_non_nullable
              as double?,
      high: freezed == high
          ? _value.high
          : high // ignore: cast_nullable_to_non_nullable
              as double?,
      low: freezed == low
          ? _value.low
          : low // ignore: cast_nullable_to_non_nullable
              as double?,
      volume: freezed == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as double?,
      change: freezed == change
          ? _value.change
          : change // ignore: cast_nullable_to_non_nullable
              as double?,
      change_percent: freezed == change_percent
          ? _value.change_percent
          : change_percent // ignore: cast_nullable_to_non_nullable
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
      {this.id,
      this.symbol,
      this.name,
      this.open,
      this.close,
      this.prev_close,
      this.high,
      this.low,
      this.volume,
      this.change,
      this.change_percent,
      this.time});

  factory _$_Datum.fromJson(Map<String, dynamic> json) =>
      _$$_DatumFromJson(json);

  @override
  final int? id;
  @override
  final String? symbol;
  @override
  final String? name;
  @override
  final double? open;
  @override
  final double? close;
  @override
  final double? prev_close;
  @override
  final double? high;
  @override
  final double? low;
  @override
  final double? volume;
  @override
  final double? change;
  @override
  final double? change_percent;
  @override
  final String? time;

  @override
  String toString() {
    return 'Datum(id: $id, symbol: $symbol, name: $name, open: $open, close: $close, prev_close: $prev_close, high: $high, low: $low, volume: $volume, change: $change, change_percent: $change_percent, time: $time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Datum &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.open, open) || other.open == open) &&
            (identical(other.close, close) || other.close == close) &&
            (identical(other.prev_close, prev_close) ||
                other.prev_close == prev_close) &&
            (identical(other.high, high) || other.high == high) &&
            (identical(other.low, low) || other.low == low) &&
            (identical(other.volume, volume) || other.volume == volume) &&
            (identical(other.change, change) || other.change == change) &&
            (identical(other.change_percent, change_percent) ||
                other.change_percent == change_percent) &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, symbol, name, open, close,
      prev_close, high, low, volume, change, change_percent, time);

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
      {final int? id,
      final String? symbol,
      final String? name,
      final double? open,
      final double? close,
      final double? prev_close,
      final double? high,
      final double? low,
      final double? volume,
      final double? change,
      final double? change_percent,
      final String? time}) = _$_Datum;

  factory _Datum.fromJson(Map<String, dynamic> json) = _$_Datum.fromJson;

  @override
  int? get id;
  @override
  String? get symbol;
  @override
  String? get name;
  @override
  double? get open;
  @override
  double? get close;
  @override
  double? get prev_close;
  @override
  double? get high;
  @override
  double? get low;
  @override
  double? get volume;
  @override
  double? get change;
  @override
  double? get change_percent;
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
