import 'package:iptv/database/moor_curd.dart';
import 'package:iptv/models/user.dart';
import 'package:moor_flutter/moor_flutter.dart';
part 'user_curd.g.dart';

@UseDao(
  tables: [Users],
)
class UsersDao extends DatabaseAccessor<AppDatabase> with _$UsersDaoMixin {
  final AppDatabase db;

  UsersDao(this.db) : super(db);

  Future insertUser(User user) => into(users).insert(user);
  Future deleteIdiom(User user) => delete(users).delete(user);
  Future<List<User>> getAllChannels() {
    return (select(db.users).get());
  }
  Future<User> getUser() {
    return (select(db.users).getSingle());
  }
}
