import 'package:drift/drift.dart';

class Config extends Table {
  TextColumn get param => text()();
  TextColumn get value => text()();
}

class SimpleStock extends Table {
  TextColumn get symbol => text()();
  TextColumn get name => text()();
}

class Response extends Table {
  TextColumn get ask => text()();
  TextColumn get answer => text()();
}