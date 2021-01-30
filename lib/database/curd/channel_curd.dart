import 'package:iptv/database/moor_curd.dart';
import 'package:iptv/models/channel.dart';
import 'package:moor_flutter/moor_flutter.dart';
part 'channel_curd.g.dart';

@UseDao(
  tables: [Channels],
)
class ChannelDao extends DatabaseAccessor<AppDatabase> with _$ChannelDaoMixin {
  final AppDatabase db;

  ChannelDao(this.db) : super(db);

  Future insertChannels(Channel channel) => into(channels).insert(channel);
  // Future deleteIdiom(Idiom idiom) => delete(idioms).delete(idiom);
  Future<List<Channel>> getAllChannels() {
    return (select(db.channels).get());
  }
}
