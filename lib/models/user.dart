import 'package:moor_flutter/moor_flutter.dart';

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().nullable()();
  TextColumn get username => text().nullable()();
  TextColumn get password => text().nullable()();
}
