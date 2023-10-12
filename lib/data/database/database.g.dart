// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ConfigTable extends Config with TableInfo<$ConfigTable, ConfigData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ConfigTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _paramMeta = const VerificationMeta('param');
  @override
  late final GeneratedColumn<String> param = GeneratedColumn<String>(
      'param', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'value', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [param, value];
  @override
  String get aliasedName => _alias ?? 'config';
  @override
  String get actualTableName => 'config';
  @override
  VerificationContext validateIntegrity(Insertable<ConfigData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('param')) {
      context.handle(
          _paramMeta, param.isAcceptableOrUnknown(data['param']!, _paramMeta));
    } else if (isInserting) {
      context.missing(_paramMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ConfigData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ConfigData(
      param: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}param'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])!,
    );
  }

  @override
  $ConfigTable createAlias(String alias) {
    return $ConfigTable(attachedDatabase, alias);
  }
}

class ConfigData extends DataClass implements Insertable<ConfigData> {
  final String param;
  final String value;
  const ConfigData({required this.param, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['param'] = Variable<String>(param);
    map['value'] = Variable<String>(value);
    return map;
  }

  ConfigCompanion toCompanion(bool nullToAbsent) {
    return ConfigCompanion(
      param: Value(param),
      value: Value(value),
    );
  }

  factory ConfigData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ConfigData(
      param: serializer.fromJson<String>(json['param']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'param': serializer.toJson<String>(param),
      'value': serializer.toJson<String>(value),
    };
  }

  ConfigData copyWith({String? param, String? value}) => ConfigData(
        param: param ?? this.param,
        value: value ?? this.value,
      );
  @override
  String toString() {
    return (StringBuffer('ConfigData(')
          ..write('param: $param, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(param, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ConfigData &&
          other.param == this.param &&
          other.value == this.value);
}

class ConfigCompanion extends UpdateCompanion<ConfigData> {
  final Value<String> param;
  final Value<String> value;
  final Value<int> rowid;
  const ConfigCompanion({
    this.param = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ConfigCompanion.insert({
    required String param,
    required String value,
    this.rowid = const Value.absent(),
  })  : param = Value(param),
        value = Value(value);
  static Insertable<ConfigData> custom({
    Expression<String>? param,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (param != null) 'param': param,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ConfigCompanion copyWith(
      {Value<String>? param, Value<String>? value, Value<int>? rowid}) {
    return ConfigCompanion(
      param: param ?? this.param,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (param.present) {
      map['param'] = Variable<String>(param.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConfigCompanion(')
          ..write('param: $param, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SimpleStockTable extends SimpleStock
    with TableInfo<$SimpleStockTable, SimpleStockData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SimpleStockTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _symbolMeta = const VerificationMeta('symbol');
  @override
  late final GeneratedColumn<String> symbol = GeneratedColumn<String>(
      'symbol', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [symbol, name];
  @override
  String get aliasedName => _alias ?? 'simple_stock';
  @override
  String get actualTableName => 'simple_stock';
  @override
  VerificationContext validateIntegrity(Insertable<SimpleStockData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('symbol')) {
      context.handle(_symbolMeta,
          symbol.isAcceptableOrUnknown(data['symbol']!, _symbolMeta));
    } else if (isInserting) {
      context.missing(_symbolMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  SimpleStockData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SimpleStockData(
      symbol: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}symbol'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $SimpleStockTable createAlias(String alias) {
    return $SimpleStockTable(attachedDatabase, alias);
  }
}

class SimpleStockData extends DataClass implements Insertable<SimpleStockData> {
  final String symbol;
  final String name;
  const SimpleStockData({required this.symbol, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['symbol'] = Variable<String>(symbol);
    map['name'] = Variable<String>(name);
    return map;
  }

  SimpleStockCompanion toCompanion(bool nullToAbsent) {
    return SimpleStockCompanion(
      symbol: Value(symbol),
      name: Value(name),
    );
  }

  factory SimpleStockData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SimpleStockData(
      symbol: serializer.fromJson<String>(json['symbol']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'symbol': serializer.toJson<String>(symbol),
      'name': serializer.toJson<String>(name),
    };
  }

  SimpleStockData copyWith({String? symbol, String? name}) => SimpleStockData(
        symbol: symbol ?? this.symbol,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('SimpleStockData(')
          ..write('symbol: $symbol, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(symbol, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SimpleStockData &&
          other.symbol == this.symbol &&
          other.name == this.name);
}

class SimpleStockCompanion extends UpdateCompanion<SimpleStockData> {
  final Value<String> symbol;
  final Value<String> name;
  final Value<int> rowid;
  const SimpleStockCompanion({
    this.symbol = const Value.absent(),
    this.name = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SimpleStockCompanion.insert({
    required String symbol,
    required String name,
    this.rowid = const Value.absent(),
  })  : symbol = Value(symbol),
        name = Value(name);
  static Insertable<SimpleStockData> custom({
    Expression<String>? symbol,
    Expression<String>? name,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (symbol != null) 'symbol': symbol,
      if (name != null) 'name': name,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SimpleStockCompanion copyWith(
      {Value<String>? symbol, Value<String>? name, Value<int>? rowid}) {
    return SimpleStockCompanion(
      symbol: symbol ?? this.symbol,
      name: name ?? this.name,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (symbol.present) {
      map['symbol'] = Variable<String>(symbol.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SimpleStockCompanion(')
          ..write('symbol: $symbol, ')
          ..write('name: $name, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ResponseTable extends Response
    with TableInfo<$ResponseTable, ResponseData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ResponseTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _askMeta = const VerificationMeta('ask');
  @override
  late final GeneratedColumn<String> ask = GeneratedColumn<String>(
      'ask', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _answerMeta = const VerificationMeta('answer');
  @override
  late final GeneratedColumn<String> answer = GeneratedColumn<String>(
      'answer', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [ask, answer];
  @override
  String get aliasedName => _alias ?? 'response';
  @override
  String get actualTableName => 'response';
  @override
  VerificationContext validateIntegrity(Insertable<ResponseData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('ask')) {
      context.handle(
          _askMeta, ask.isAcceptableOrUnknown(data['ask']!, _askMeta));
    } else if (isInserting) {
      context.missing(_askMeta);
    }
    if (data.containsKey('answer')) {
      context.handle(_answerMeta,
          answer.isAcceptableOrUnknown(data['answer']!, _answerMeta));
    } else if (isInserting) {
      context.missing(_answerMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ResponseData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ResponseData(
      ask: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ask'])!,
      answer: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}answer'])!,
    );
  }

  @override
  $ResponseTable createAlias(String alias) {
    return $ResponseTable(attachedDatabase, alias);
  }
}

class ResponseData extends DataClass implements Insertable<ResponseData> {
  final String ask;
  final String answer;
  const ResponseData({required this.ask, required this.answer});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['ask'] = Variable<String>(ask);
    map['answer'] = Variable<String>(answer);
    return map;
  }

  ResponseCompanion toCompanion(bool nullToAbsent) {
    return ResponseCompanion(
      ask: Value(ask),
      answer: Value(answer),
    );
  }

  factory ResponseData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ResponseData(
      ask: serializer.fromJson<String>(json['ask']),
      answer: serializer.fromJson<String>(json['answer']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'ask': serializer.toJson<String>(ask),
      'answer': serializer.toJson<String>(answer),
    };
  }

  ResponseData copyWith({String? ask, String? answer}) => ResponseData(
        ask: ask ?? this.ask,
        answer: answer ?? this.answer,
      );
  @override
  String toString() {
    return (StringBuffer('ResponseData(')
          ..write('ask: $ask, ')
          ..write('answer: $answer')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(ask, answer);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ResponseData &&
          other.ask == this.ask &&
          other.answer == this.answer);
}

class ResponseCompanion extends UpdateCompanion<ResponseData> {
  final Value<String> ask;
  final Value<String> answer;
  final Value<int> rowid;
  const ResponseCompanion({
    this.ask = const Value.absent(),
    this.answer = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ResponseCompanion.insert({
    required String ask,
    required String answer,
    this.rowid = const Value.absent(),
  })  : ask = Value(ask),
        answer = Value(answer);
  static Insertable<ResponseData> custom({
    Expression<String>? ask,
    Expression<String>? answer,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (ask != null) 'ask': ask,
      if (answer != null) 'answer': answer,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ResponseCompanion copyWith(
      {Value<String>? ask, Value<String>? answer, Value<int>? rowid}) {
    return ResponseCompanion(
      ask: ask ?? this.ask,
      answer: answer ?? this.answer,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (ask.present) {
      map['ask'] = Variable<String>(ask.value);
    }
    if (answer.present) {
      map['answer'] = Variable<String>(answer.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ResponseCompanion(')
          ..write('ask: $ask, ')
          ..write('answer: $answer, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  late final $ConfigTable config = $ConfigTable(this);
  late final $SimpleStockTable simpleStock = $SimpleStockTable(this);
  late final $ResponseTable response = $ResponseTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [config, simpleStock, response];
}
