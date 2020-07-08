part of '../dartcord.dart';

class Role {
  final Snowflake id;
  final String name;
  final int color;
  final bool hoist;
  final int position;
  final int permissions;
  final bool managed;
  final bool mentionable;

  Role(this.id, this.name, this.color, this.hoist, this.position,
      this.permissions, this.managed, this.mentionable);

  factory Role.fromMap(Map map) {
    return Role(
        Snowflake(map['id']),
        map['name'],
        map['color'],
        map['hoist'],
        map['position'],
        map['permissions'],
        map['managed'],
        map['mentionable']);
  }
}
