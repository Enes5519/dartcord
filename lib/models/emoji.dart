part of '../dartcord.dart';

class Emoji{
  Snowflake id;
  String name;
  List<Role> roles;
  User user;
  bool require_colons;
  bool managed;
  bool animated;
  bool available;

  Emoji(this.id, this.name);

  factory Emoji.fromMap(Map map){
    var emoji = Emoji(Snowflake(map['id']), map['name'])
      ..user = User.fromMap(map['user'])
      ..require_colons = map['require_colons']
      ..managed = map['managed']
      ..animated = map['animated']
      ..available = map['available'];

    map['roles'].forEach((element) {
      emoji.roles.add(Role.fromMap(element));
    });

    return emoji;
  }
}