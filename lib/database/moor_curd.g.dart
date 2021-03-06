// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_curd.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Channel extends DataClass implements Insertable<Channel> {
  final int id;
  final String channelName;
  final String channelLink;
  final String channelCategory;
  Channel(
      {@required this.id,
      this.channelName,
      this.channelLink,
      this.channelCategory});
  factory Channel.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Channel(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      channelName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}channel_name']),
      channelLink: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}channel_link']),
      channelCategory: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}channel_category']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || channelName != null) {
      map['channel_name'] = Variable<String>(channelName);
    }
    if (!nullToAbsent || channelLink != null) {
      map['channel_link'] = Variable<String>(channelLink);
    }
    if (!nullToAbsent || channelCategory != null) {
      map['channel_category'] = Variable<String>(channelCategory);
    }
    return map;
  }

  ChannelsCompanion toCompanion(bool nullToAbsent) {
    return ChannelsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      channelName: channelName == null && nullToAbsent
          ? const Value.absent()
          : Value(channelName),
      channelLink: channelLink == null && nullToAbsent
          ? const Value.absent()
          : Value(channelLink),
      channelCategory: channelCategory == null && nullToAbsent
          ? const Value.absent()
          : Value(channelCategory),
    );
  }

  factory Channel.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Channel(
      id: serializer.fromJson<int>(json['id']),
      channelName: serializer.fromJson<String>(json['channelName']),
      channelLink: serializer.fromJson<String>(json['channelLink']),
      channelCategory: serializer.fromJson<String>(json['channelCategory']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'channelName': serializer.toJson<String>(channelName),
      'channelLink': serializer.toJson<String>(channelLink),
      'channelCategory': serializer.toJson<String>(channelCategory),
    };
  }

  Channel copyWith(
          {int id,
          String channelName,
          String channelLink,
          String channelCategory}) =>
      Channel(
        id: id ?? this.id,
        channelName: channelName ?? this.channelName,
        channelLink: channelLink ?? this.channelLink,
        channelCategory: channelCategory ?? this.channelCategory,
      );
  @override
  String toString() {
    return (StringBuffer('Channel(')
          ..write('id: $id, ')
          ..write('channelName: $channelName, ')
          ..write('channelLink: $channelLink, ')
          ..write('channelCategory: $channelCategory')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(channelName.hashCode,
          $mrjc(channelLink.hashCode, channelCategory.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Channel &&
          other.id == this.id &&
          other.channelName == this.channelName &&
          other.channelLink == this.channelLink &&
          other.channelCategory == this.channelCategory);
}

class ChannelsCompanion extends UpdateCompanion<Channel> {
  final Value<int> id;
  final Value<String> channelName;
  final Value<String> channelLink;
  final Value<String> channelCategory;
  const ChannelsCompanion({
    this.id = const Value.absent(),
    this.channelName = const Value.absent(),
    this.channelLink = const Value.absent(),
    this.channelCategory = const Value.absent(),
  });
  ChannelsCompanion.insert({
    this.id = const Value.absent(),
    this.channelName = const Value.absent(),
    this.channelLink = const Value.absent(),
    this.channelCategory = const Value.absent(),
  });
  static Insertable<Channel> custom({
    Expression<int> id,
    Expression<String> channelName,
    Expression<String> channelLink,
    Expression<String> channelCategory,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (channelName != null) 'channel_name': channelName,
      if (channelLink != null) 'channel_link': channelLink,
      if (channelCategory != null) 'channel_category': channelCategory,
    });
  }

  ChannelsCompanion copyWith(
      {Value<int> id,
      Value<String> channelName,
      Value<String> channelLink,
      Value<String> channelCategory}) {
    return ChannelsCompanion(
      id: id ?? this.id,
      channelName: channelName ?? this.channelName,
      channelLink: channelLink ?? this.channelLink,
      channelCategory: channelCategory ?? this.channelCategory,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (channelName.present) {
      map['channel_name'] = Variable<String>(channelName.value);
    }
    if (channelLink.present) {
      map['channel_link'] = Variable<String>(channelLink.value);
    }
    if (channelCategory.present) {
      map['channel_category'] = Variable<String>(channelCategory.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChannelsCompanion(')
          ..write('id: $id, ')
          ..write('channelName: $channelName, ')
          ..write('channelLink: $channelLink, ')
          ..write('channelCategory: $channelCategory')
          ..write(')'))
        .toString();
  }
}

class $ChannelsTable extends Channels with TableInfo<$ChannelsTable, Channel> {
  final GeneratedDatabase _db;
  final String _alias;
  $ChannelsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _channelNameMeta =
      const VerificationMeta('channelName');
  GeneratedTextColumn _channelName;
  @override
  GeneratedTextColumn get channelName =>
      _channelName ??= _constructChannelName();
  GeneratedTextColumn _constructChannelName() {
    return GeneratedTextColumn(
      'channel_name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _channelLinkMeta =
      const VerificationMeta('channelLink');
  GeneratedTextColumn _channelLink;
  @override
  GeneratedTextColumn get channelLink =>
      _channelLink ??= _constructChannelLink();
  GeneratedTextColumn _constructChannelLink() {
    return GeneratedTextColumn(
      'channel_link',
      $tableName,
      true,
    );
  }

  final VerificationMeta _channelCategoryMeta =
      const VerificationMeta('channelCategory');
  GeneratedTextColumn _channelCategory;
  @override
  GeneratedTextColumn get channelCategory =>
      _channelCategory ??= _constructChannelCategory();
  GeneratedTextColumn _constructChannelCategory() {
    return GeneratedTextColumn(
      'channel_category',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, channelName, channelLink, channelCategory];
  @override
  $ChannelsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'channels';
  @override
  final String actualTableName = 'channels';
  @override
  VerificationContext validateIntegrity(Insertable<Channel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('channel_name')) {
      context.handle(
          _channelNameMeta,
          channelName.isAcceptableOrUnknown(
              data['channel_name'], _channelNameMeta));
    }
    if (data.containsKey('channel_link')) {
      context.handle(
          _channelLinkMeta,
          channelLink.isAcceptableOrUnknown(
              data['channel_link'], _channelLinkMeta));
    }
    if (data.containsKey('channel_category')) {
      context.handle(
          _channelCategoryMeta,
          channelCategory.isAcceptableOrUnknown(
              data['channel_category'], _channelCategoryMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Channel map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Channel.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ChannelsTable createAlias(String alias) {
    return $ChannelsTable(_db, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int id;
  final String name;
  final String username;
  final String password;
  User({@required this.id, this.name, this.username, this.password});
  factory User.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return User(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      username: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}username']),
      password: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}password']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || username != null) {
      map['username'] = Variable<String>(username);
    }
    if (!nullToAbsent || password != null) {
      map['password'] = Variable<String>(password);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      username: username == null && nullToAbsent
          ? const Value.absent()
          : Value(username),
      password: password == null && nullToAbsent
          ? const Value.absent()
          : Value(password),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      username: serializer.fromJson<String>(json['username']),
      password: serializer.fromJson<String>(json['password']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'username': serializer.toJson<String>(username),
      'password': serializer.toJson<String>(password),
    };
  }

  User copyWith({int id, String name, String username, String password}) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        username: username ?? this.username,
        password: password ?? this.password,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('username: $username, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(name.hashCode, $mrjc(username.hashCode, password.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.name == this.name &&
          other.username == this.username &&
          other.password == this.password);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> username;
  final Value<String> password;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.username = const Value.absent(),
    this.password = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.username = const Value.absent(),
    this.password = const Value.absent(),
  });
  static Insertable<User> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<String> username,
    Expression<String> password,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (username != null) 'username': username,
      if (password != null) 'password': password,
    });
  }

  UsersCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<String> username,
      Value<String> password}) {
    return UsersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('username: $username, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  final GeneratedDatabase _db;
  final String _alias;
  $UsersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      true,
    );
  }

  final VerificationMeta _usernameMeta = const VerificationMeta('username');
  GeneratedTextColumn _username;
  @override
  GeneratedTextColumn get username => _username ??= _constructUsername();
  GeneratedTextColumn _constructUsername() {
    return GeneratedTextColumn(
      'username',
      $tableName,
      true,
    );
  }

  final VerificationMeta _passwordMeta = const VerificationMeta('password');
  GeneratedTextColumn _password;
  @override
  GeneratedTextColumn get password => _password ??= _constructPassword();
  GeneratedTextColumn _constructPassword() {
    return GeneratedTextColumn(
      'password',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, username, password];
  @override
  $UsersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'users';
  @override
  final String actualTableName = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username'], _usernameMeta));
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password'], _passwordMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return User.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $ChannelsTable _channels;
  $ChannelsTable get channels => _channels ??= $ChannelsTable(this);
  $UsersTable _users;
  $UsersTable get users => _users ??= $UsersTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [channels, users];
}
