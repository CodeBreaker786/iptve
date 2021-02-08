import 'dart:io';
import 'package:iptv/models/channel.dart';
import 'package:iptv/models/user.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart' as paths;
 

part 'moor_curd.g.dart';

@UseMoor(tables: [Channels,Users])
class AppDatabase extends _$AppDatabase {
  static AppDatabase _db = _constructDb();

  factory AppDatabase() {
    return _db;
  }

  AppDatabase._internal(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 3;

  static AppDatabase _constructDb({bool logStatements8 = false}) {
    final executor = LazyDatabase(() async {
      final dataDir = await paths.getApplicationDocumentsDirectory();
      final dbFile = File(p.join(dataDir.path, 'db.sqlite'));
      return FlutterQueryExecutor.inDatabaseFolder(
          path: dbFile.path, logStatements: true);
    });
    return AppDatabase._internal(executor);
  }
}
