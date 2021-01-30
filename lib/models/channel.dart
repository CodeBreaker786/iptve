import 'package:moor_flutter/moor_flutter.dart';

class Channels extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get channelName => text().nullable()();
  TextColumn get channelLink => text().nullable()();
   TextColumn get channelCategory => text().nullable()();
}
